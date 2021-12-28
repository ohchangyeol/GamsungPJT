package site.gamsung.service.auction.impl;

import java.text.DecimalFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;

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
import site.gamsung.util.auction.CrawlingData;

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
		String existNo = auctionProductDAO.getCrawlingAuctionProductNo(auctionProduct.getAuctionProductSubDatail());
		
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
		String auctionProductNo = auctionProductDAO.getCrawlingAuctionProductNo(auctionProduct.getAuctionProductSubDatail());
		
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
	public AuctionProduct getAuctionProduct(String auctionProductNo) {
		// TODO Auto-generated method stub
		return auctionProductDAO.getAuctionProduct(auctionProductNo);
	}

	@Override
	public AuctionProduct getTempSaveAuctionProduct(String registrantId) {
		// TODO Auto-generated method stub
		return auctionProductDAO.getTempSaveAuctionProduct(registrantId);
	}

	@Override
	public void tempSaveAuctionProduct(AuctionProduct auctionProduct) {
		// TODO Auto-generated method stub
		auctionProductDAO.tempSaveAuctionProduct(auctionProduct);
	}

	@Override
	public void addAuctionProduct(AuctionProduct auctionProduct) {
		// TODO Auto-generated method stub
		auctionProductDAO.addAuctionProduct(auctionProduct);
		
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
		AuctionInfo auctionInfo = new AuctionInfo();
		auctionInfo.setAuctionStatus("WAIT");
		List<AuctionProduct> list = auctionProductDAO.listAuctionProduct(new Search());
		for(AuctionProduct auctionProduct : list) {
		
			String auctionProductNo = auctionProduct.getAuctionProductNo();
			
			auctionProduct = auctionProductDAO.getAuctionProduct(auctionProductNo);
			
			try {
				boolean isEnd = dateFormat.parse(auctionProduct.getRemainAuctionTime()).before(dateFormat.parse("00:00:00"));
				if(isEnd) {
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
	
}
