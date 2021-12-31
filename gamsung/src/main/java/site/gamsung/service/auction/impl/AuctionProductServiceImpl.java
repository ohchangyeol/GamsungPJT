package site.gamsung.service.auction.impl;

import java.text.DecimalFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.Map;

import org.apache.commons.collections4.map.HashedMap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import site.gamsung.service.auction.AuctionProductDAO;
import site.gamsung.service.auction.AuctionProductService;
import site.gamsung.service.auction.AuctionInfoDAO;
import site.gamsung.service.common.Search;
import site.gamsung.service.domain.AuctionInfo;
import site.gamsung.service.domain.AuctionProduct;
import site.gamsung.service.domain.User;
import site.gamsung.util.auction.CrawlingData;
import site.gamsung.util.user.SendMail;

@Service("auctionProductService")
@EnableTransactionManagement //관리자 권한 획득
public class AuctionProductServiceImpl implements AuctionProductService{

	@Autowired
	@Qualifier("auctionProductDAO")
	private AuctionProductDAO auctionProductDAO;
	
	@Autowired
	@Qualifier("auctionInfoDAO")
	private AuctionInfoDAO auctionInfoDao;
	
	@Autowired
	@Qualifier("crawlingData")
	private CrawlingData crawlingData;
	
	@Value("#{commonProperties['PATH']}")
	private String PATH;
	
	public AuctionProductServiceImpl(){
		// TODO Auto-generated constructor stub
	}

	@Override
	public List<AuctionProduct> listCrawlingAuctionProduct(Search search) {
		// TODO Auto-generated method stub
	
		return crawlingData.crawlingList(search);
	}
 
	@Override
	@Transactional(readOnly = false, propagation = Propagation.REQUIRES_NEW ) //get* read-only가 설정되어 있어 예외로 새로운 트렌젝션을 탈수 있도록 설정
	public AuctionProduct getCrawlingAuctionProductNo(AuctionProduct auctionProduct) {
		// TODO Auto-generated method stub
		
		//저장된 서브 정보를 가지고 있는 상품이 있는지 확인 
		String existNo = auctionProductDAO.getCrawlingAuctionProductNo(auctionProduct.getAuctionProductSubDetail());
		
		//있다면 해당 데이터를 반환한다.
		if(existNo != null) {
			return auctionProductDAO.getAuctionProduct(existNo);
		}
		
		//없다면 상세 정보에 해당하는 서브 정보를 크롤링하여 객체를 반환 받는다.
		auctionProduct = crawlingData.crawling(auctionProduct);
		
		//입찰 가능 등급을 1~10사이의 무작위 숫자를 적용한다.
		int bidableGrade = (int) (Math.random()*9) + 1;
		auctionProduct.setBidableGrade(bidableGrade);
		
		//받은 모든 해시태그를 공백
		String allhashtag = auctionProduct.getAllhashtag();
		String [] hashtags = allhashtag.split("#");
		
		//#기준으로 파싱하여 해시태그 재정의
		if(hashtags.length == 2) {
			auctionProduct.setHashtag1("#"+hashtags[1].trim());			
		}else if(hashtags.length <=3) {
			auctionProduct.setHashtag1("#"+hashtags[1].trim());	
			auctionProduct.setHashtag1("#"+hashtags[2].trim());			
		}else if(hashtags.length > 3) {
			auctionProduct.setHashtag1("#"+hashtags[1].trim());	
			auctionProduct.setHashtag1("#"+hashtags[2].trim());	
			auctionProduct.setHashtag1("#"+hashtags[3].trim());			
		}
		
		//데이터를 저장한다. 등록자는 관리자가 Default이다.
		auctionProductDAO.addCrawlingAuctionProduct(auctionProduct);
		
		//저장한 크롤링 데이터의 상품 번호를 가져온다.
		String auctionProductNo = auctionProductDAO.getCrawlingAuctionProductNo(auctionProduct.getAuctionProductSubDetail());
		
		//조회수를 1 증가 시킨다.
		auctionProductDAO.updateAuctionProductViewCounter(auctionProductNo);
		
		
		return auctionProductDAO.getAuctionProduct(auctionProductNo);
	}

	@Override
	public List<AuctionProduct> listAuctionProduct(Search search) {
		// TODO Auto-generated method stub
		return auctionProductDAO.listAuctionProduct(search);
	}

	@Override
	public Map<String, Object> getAuctionProduct(AuctionInfo auctionInfo) {
		// TODO Auto-generated method stub

		Map<String, Object> map = new HashedMap<String, Object>();
		
		//상품 정보를 가져왔다.
		AuctionProduct auctionProduct = auctionProductDAO.getAuctionProduct(auctionInfo.getAuctionProductNo());
		
		//경매 조회자의 랭킹을 가져온다.
		List<AuctionInfo> list = auctionInfoDao.getBidderRanking(auctionInfo);
		
		if(list != null && list.size() != 0) {
			auctionInfo = list.get(0);			
			map.put("auctionInfo", auctionInfo);
		}
		
		// 경매 등록자의 아이디를 가져와 경매 등급과 리뷰에 대한 정보를 가져온다.
		String registrantId = auctionProduct.getRegistrantId();
		
		int registrantGrade = auctionInfoDao.getUserAuctionGradeInfo(registrantId);
		
		//리뷰를 추가해야한다.
		//
		//
		AuctionInfo registrantInfo = new AuctionInfo();
		
		User user =  new User();
		user.setId(registrantId);
		user.setAuctionGrade(registrantGrade);
		
		registrantInfo.setUser(user);

		map.put("auctionProduct", auctionProduct);
		map.put("registrantInfo", registrantInfo);
		
		return map;
	}

	@Override
	public AuctionProduct getTempSaveAuctionProduct(String registrantId) {
		// TODO Auto-generated method stub
		return auctionProductDAO.getTempSaveAuctionProduct(registrantId);
	}

	@Override
	public void tempSaveAuctionProduct(AuctionProduct auctionProduct) {
		// TODO Auto-generated method stub
		
		auctionProduct.setIsTempSave("Y");
		
		AuctionProduct tmpAuctionProduct = auctionProductDAO.getTempSaveAuctionProduct(auctionProduct.getRegistrantId());
		
		if(tmpAuctionProduct != null) {
			auctionProduct.setAuctionProductNo(tmpAuctionProduct.getAuctionProductNo());
			auctionProductDAO.updateAuctionProduct(auctionProduct);
		}else {
			auctionProductDAO.tempSaveAuctionProduct(auctionProduct);
		}
	}

	@Override
	public void addAuctionProduct(AuctionProduct auctionProduct) {
		// TODO Auto-generated method stub
		auctionProductDAO.addAuctionProduct(auctionProduct);	
	}
	
	public void updateAuctionProduct(AuctionProduct auctionProduct) {
		
		auctionProduct.setIsTempSave("N");
		auctionProductDAO.updateAuctionProduct(auctionProduct);
	}

	@Override
	@Transactional(rollbackFor = ParseException.class)
	public String auctionProductBid(AuctionInfo auctionInfo) {
		// TODO Auto-generated method stub
		
		String bidderId = auctionInfo.getUser().getId();
		
		//사용자의 경매 등급을 가져온다.
		int userGrade = auctionInfoDao.getUserAuctionGradeInfo(bidderId);
		
		//경매 정보를 가져온다.
		AuctionProduct auctionProduct = auctionProductDAO.getAuctionProduct(auctionInfo.getAuctionProductNo());
		
		//User와 AuctionProduct가 null이 아닌지 확인
		if(auctionInfo.getUser() != null && auctionProduct != null) {
			
			//입찰 가능 등급 보다 유저 등급이 높은지 확인
			if(userGrade >= auctionProduct.getBidableGrade()) {				
				auctionProductDAO.auctionProductBid(auctionInfo);				
			}else {
				return "경매 등급을 확인하세요";
			}
			
			//경매 등록자와 입찰자의 아이디가 동일한지 확인
			if(bidderId.equals( auctionProduct.getRegistrantId()) ) {
				return "경매 등록자는 입찰할 수 없습니다.";
			}
			
			String remainTime = auctionProduct.getRemainAuctionTime();
			System.out.println(remainTime);
			System.out.println(remainTime.indexOf("-"));
			if(remainTime != null && remainTime.indexOf("-") == -1) {
				
				SimpleDateFormat dateFormat = new SimpleDateFormat("HH:mm:ss");
				try {				
					if(dateFormat.parse(auctionProduct.getRemainAuctionTime()).before(dateFormat.parse("00:00:10"))){
						auctionProductDAO.updateBidEndTime(auctionInfo.getAuctionProductNo());
					}
				} catch (ParseException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
					return "시간 확인 에러 발생";
				} 
				
			}else {
				return "경매 종료된 상풍입니다.";
			}
			
		}
		
		auctionProductDAO.updateBidEndTime(bidderId);
		
		DecimalFormat decimalFormat = new DecimalFormat("###,###");
		
		//입찰 완료 안내
		String bidInfo = decimalFormat.format(auctionInfo.getBidPrice())+"원에 입찰 되었습니다.";
		
		return bidInfo;
	}
	
	//경매 상태 업데이트
	@Override
	@Scheduled(cron = "*/1 * * * * *")
	public void updateAuctionProductCondition() {
		// TODO Auto-generated method stub
		
		SimpleDateFormat dateFormat = new SimpleDateFormat("HH:mm:ss");
		
		List<AuctionProduct> auctionList = auctionProductDAO.listAuctionProduct(new Search());
		List<AuctionInfo> bidderList = null;
		
		SendMail sendMail = new SendMail();
		
		AuctionInfo auctionInfo = new AuctionInfo();
		
		for(AuctionProduct auctionProduct : auctionList) {
		
			String auctionProductNo = auctionProduct.getAuctionProductNo();
			
			auctionProduct = auctionProductDAO.getAuctionProduct(auctionProductNo);
			
			try {

				boolean isEnd = dateFormat.parse(auctionProduct.getRemainAuctionTime()).before(dateFormat.parse("00:00:01"));
				
				if(isEnd) {					
					auctionInfo.setAuctionProductNo(auctionProductNo);		
					
					AuctionProduct tmpAuctionProduct = auctionProductDAO.getAuctionProduct(auctionProductNo);
					
					//경매에 참여한 모든 인원들 뽑아온다.
					bidderList = auctionInfoDao.getBidderRanking(auctionInfo);
					
					//희망 낙찰가 보다 최종 입찰가가 작을 경우
					if(tmpAuctionProduct.getCurrentBidPrice() < tmpAuctionProduct.getHopefulBidPrice()) {
						//경매 상태 유찰
						auctionProduct.setAuctionStatus("FAIL");
						
						//입찰한 모든 인원에게 실패 메일 발송
						for(AuctionInfo info : bidderList) {
							sendMail.sendMail(info.getUser().getId(), tmpAuctionProduct.getAuctionProductName(), "유찰 되셨습니다.");
						}
						
					}else {
						//1등을 제외한 모든 인원에게 입찰 상태를 전송한다.
						
						//경매 상태 낙찰
						auctionProduct.setAuctionStatus("WAIT");
						
						//낙찰 성공 여부에 따라 등수에 따른 메일 발송
						for(AuctionInfo info : bidderList) {
							if(info.getBidderRank() == 1) {
								sendMail.sendMail(info.getUser().getId(), tmpAuctionProduct.getAuctionProductName(), "낙찰 되셨습니다. \n 화상채팅 URL 추가 예정");
							}else {
								sendMail.sendMail(info.getUser().getId(), tmpAuctionProduct.getAuctionProductName(), "유찰 되셨습니다.");
							}
						}
					}
					
					//경매 상태를 업데이트 한다.
					auctionProductDAO.updateAuctionProductCondition(auctionProduct);

				}
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}

	//메인에 상품 등록
	@Override
	public String addMainAuctionProduct(AuctionProduct auctionProduct) {
		// TODO Auto-generated method stub
		
		AuctionProduct tmpProduct = auctionProductDAO.getAuctionProduct(auctionProduct.getAuctionProductNo());
		
		int isMain = auctionProductDAO.mainAuctionProductCount(auctionProduct);
		String realEndTime = tmpProduct.getAuctionEndTime();
		String checkEndtime = auctionProduct.getAuctionEndTime();

		tmpProduct = null;
		int mainCount = auctionProductDAO.mainAuctionProductCount(tmpProduct);
		
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		
		try {
			if(isMain != 0){
				return "이미 등록된 상품입니다.";
			}else if(dateFormat.parse(realEndTime).before(dateFormat.parse(checkEndtime))) {
				return "경매 종료 시간을 넘어서는 값을 등록하셨습니다.";
			}else if(mainCount<= 12) {
				auctionProductDAO.addMainAuctionProduct(auctionProduct);
			}else {
				return "이미 12개의 상품이 등록 되어 있습니다. 잠시 후에 다시 시도해 주세요.";
			}
						
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return "추천 상품으로 등록 되었습니다.";
	}

	@Override
	public List<AuctionProduct> listMainAuctionProduct() {
		// TODO Auto-generated method stub
		return auctionProductDAO.listMainAuctionProduct();
	}

	@Override
	public AuctionProduct auctionProductImgs(AuctionProduct auctionProduct, List<String> fileList) {
		// TODO Auto-generated method stub
		
		switch(fileList.size()) {
			case 1:
				auctionProduct.setProductImg1(fileList.get(0));
				break;
			case 2:
				auctionProduct.setProductImg1(fileList.get(0));
				auctionProduct.setProductImg2(fileList.get(1));
				break;
			case 3:
				auctionProduct.setProductImg1(fileList.get(0));
				auctionProduct.setProductImg2(fileList.get(1));
				auctionProduct.setProductImg3(fileList.get(2));
				break;
			case 4:
				auctionProduct.setProductImg1(fileList.get(0));
				auctionProduct.setProductImg2(fileList.get(1));
				auctionProduct.setProductImg3(fileList.get(2));
				auctionProduct.setProductImg4(fileList.get(3));
				break;
			case 5:
				auctionProduct.setProductImg1(fileList.get(0));
				auctionProduct.setProductImg2(fileList.get(1));
				auctionProduct.setProductImg3(fileList.get(2));
				auctionProduct.setProductImg4(fileList.get(3));
				auctionProduct.setProductImg5(fileList.get(4));
				break;
		}
		
		return auctionProduct;
	}

	@Override
	public AuctionInfo deleteAuctionProduct(String auctionProductNo) {
		// TODO Auto-generated method stub
		
		AuctionProduct auctionProduct = auctionProductDAO.getAuctionProduct(auctionProductNo);
		AuctionInfo auctionInfo = new AuctionInfo();
		auctionInfo.setAuctionStatus("Withdrawal");
		auctionInfo.setAuctionProductNo(auctionProductNo);
		
		SimpleDateFormat dateFormat = new SimpleDateFormat("HH:mm:ss");
		
		try {
			if(auctionProduct.getCurrentBidPrice() == 0 && dateFormat.parse(auctionProduct.getRemainAuctionTime()).after(dateFormat.parse("20:00:00")) ) {
				auctionProductDAO.deleteAuctionProduct(auctionInfo);
				auctionInfo.setInfo("중도 철회 성공하셨습니다.");
				return auctionInfo;
			}
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		auctionInfo.setInfo("중도 철회 불가합니다.");
		return auctionInfo;
	}
	
	
	
}
