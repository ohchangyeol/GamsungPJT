package site.gamsung.service.auction.impl;

import java.text.DecimalFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.apache.commons.collections4.map.HashedMap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import site.gamsung.service.auction.AuctionProductDAO;
import site.gamsung.service.auction.AuctionProductService;
import site.gamsung.service.auction.AuctionReviewDAO;
import site.gamsung.service.auction.AuctionInfoDAO;
import site.gamsung.service.common.Search;
import site.gamsung.service.domain.AuctionInfo;
import site.gamsung.service.domain.AuctionProduct;
import site.gamsung.service.domain.NaverProduct;
import site.gamsung.service.domain.RatingReview;
import site.gamsung.service.domain.User;
import site.gamsung.util.auction.CrawlingData;
import site.gamsung.util.auction.NaverShoppingAPI;

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
	@Qualifier("auctionReviewDAO")
	private AuctionReviewDAO auctionReviewDAO;
	
	@Autowired
	@Qualifier("crawlingData")
	private CrawlingData crawlingData;
	
	@Autowired
	@Qualifier("naverShoppingAPI")
	private NaverShoppingAPI naverShoppingAPI;
	
	public AuctionProductServiceImpl(){
		// TODO Auto-generated constructor stub
	}
	
	@Override
	public List<NaverProduct> listNaverAuctionProduct(Search search) {
		// TODO Auto-generated method stub
		
		NaverProduct naverProduct = naverShoppingAPI.naverShopping(search);
		return naverProduct.getItems();
	}

	@Override
	public AuctionProduct convertNaverToAuctionProduct(AuctionProduct auctionProduct) {
		// TODO Auto-generated method stub
		
		// 저장된 서브 정보를 가지고 있는 상품이 있는지 확인
		String existNo = auctionProductDAO.getCrawlingAuctionProductNo(auctionProduct.getAuctionProductSubDetail());

		// 있다면 해당 데이터를 반환한다.
		if (existNo != null) {
			return auctionProductDAO.getAuctionProduct(existNo);
		}
		
		auctionProduct = naverShoppingAPI.convertNaverToAuctionProduct(auctionProduct);
		
		int bidableGrade = (int) (Math.random()*9) + 1;
		auctionProduct.setBidableGrade(bidableGrade);
		auctionProductDAO.addCrawlingAuctionProduct(auctionProduct);
		String auctionProductNo = auctionProductDAO.getCrawlingAuctionProductNo(auctionProduct.getAuctionProductSubDetail());
		auctionProductDAO.updateAuctionProductViewCounter(auctionProductNo);
		
		
		return auctionProductDAO.getAuctionProduct(auctionProductNo);
	}

	@Override
	public Map<String,Object> listAuctionProduct(Map<String,Object> map) {
		// TODO Auto-generated method stub
		
		List<AuctionProduct> productList = auctionProductDAO.listAuctionProduct((Search)map.get("search"));
		List<AuctionInfo> concernList = null;
		
		//user가 null이 아닐때만 실행한다.
		if(map.get("user") != null) {
			//모든 응찰 관심 목록을 뽑기 위해 search domain을 지운다.
			map.remove("search");
			concernList = auctionInfoDao.listBidConcern(map);
		}
		
		map.clear();
		map.put("productList", productList);
		map.put("concernList", concernList);
		return map;
	}
	
	//검색 상품 자동완성
	@Override
	public List<String> autoComplete(String searchKeyword) {
		// TODO Auto-generated method stub
		List<String> pojoList= auctionProductDAO.autoComplete(searchKeyword);
		
		//기존 스트링 배열을 set을 이용하여 중복제거
		Set<String> set = new HashSet<String>(pojoList);
		List<String> list = new ArrayList<String>(set);
		
		return list;
	}

	//경매 상품 상세조회
	@Override
	@Transactional(readOnly = false, propagation = Propagation.REQUIRES_NEW ) //get* read-only가 설정되어 있어 예외로 새로운 트렌젝션을 탈수 있도록 설정
	public Map<String, Object> getAuctionProduct(AuctionInfo auctionInfo) {
		// TODO Auto-generated method stub
		
		//STOMP를 통해 상품을 조회할 경우 증가를 제거하기 위해 IP의 .을 이용하여 걸려준다.
		if(auctionInfo.getInfo() != null && auctionInfo.getInfo().indexOf('.') > 2) {
			AuctionInfo viewLog = auctionProductDAO.getUserLog(auctionInfo);
			if(viewLog == null) {
				//조회 정보를 추가하며 1증가 시킨다..
				auctionProductDAO.viewUserLog(auctionInfo);
				auctionProductDAO.updateAuctionProductViewCounter(auctionInfo.getAuctionProductNo());
			}			
		}
		
		int auctionGrade = 0;
		//조회자의 경매 등급을 가져온다.
		if(auctionInfo.getUser() != null) {
			auctionGrade = auctionInfoDao.getUserAuctionGradeInfo(auctionInfo.getUser().getId());
		}
		
		
		//조회한 적이 있는 상품인지 확인한다.
		Map<String, Object> map = new HashedMap<String, Object>();

		//상품 정보를 가져왔다.
		AuctionProduct auctionProduct = auctionProductDAO.getAuctionProduct(auctionInfo.getAuctionProductNo());

		//경매 조회자의 랭킹을 가져온다.
		List<AuctionInfo> list = auctionInfoDao.getBidderRanking(auctionInfo);

		//조회자 경매의 입찰 내역이 있을 경우
		if(list != null && list.size() != 0) {
			auctionInfo = list.get(0);			
			map.put("auctionInfo", auctionInfo);
		}

		// 경매 등록자의 아이디를 가져와 경매 등급과 리뷰에 대한 정보를 가져온다.
		String registrantId = auctionProduct.getRegistrantId();
		
		// 경매 등록자의 경매 등급을 조회한다.
		int registrantGrade = auctionInfoDao.getUserAuctionGradeInfo(registrantId);
		
		// 경매 등록자에 대한 모든 리뷰의 평균 평점을 반환 받는다.
		RatingReview ratingReview = auctionReviewDAO.getRegistrantAvgRating(registrantId);

		AuctionInfo registrantInfo = new AuctionInfo();
		
		User user =  new User();
		user.setId(registrantId);
		user.setAuctionGrade(registrantGrade);
		
		registrantInfo.setUser(user);
		
		
		map.put("auctionProduct", auctionProduct);
		map.put("registrantInfo", registrantInfo);
		map.put("ratingReview", ratingReview);
		map.put("auctionGrade",auctionGrade);
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
	
	@Override
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
			
			//경매 마감 10초전이라면 10초 연장
			if(remainTime != null && remainTime.indexOf("-") == -1) {
				
				SimpleDateFormat dateFormat = new SimpleDateFormat("HH:mm:ss");
				try {				
					if(dateFormat.parse(auctionProduct.getRemainAuctionTime()).before(dateFormat.parse("00:00:11"))){
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
	
	

	//메인에 상품 등록
	@Override
	public String addMainAuctionProduct(String auctionProductNo) {
		// TODO Auto-generated method stub
		
		AuctionProduct tmpProduct = auctionProductDAO.getAuctionProduct(auctionProductNo);
		
		if(!tmpProduct.getAuctionStatus().equals("START")) {
			return "경매 진행 중인 상품이 아닙니다.";
		}
		
		int isMain = auctionProductDAO.mainAuctionProductCount(auctionProductNo);
		String remainTime = tmpProduct.getRemainAuctionTime();
		

		tmpProduct = null;
		int mainCount = auctionProductDAO.mainAuctionProductCount(null);
		
		SimpleDateFormat dateFormat = new SimpleDateFormat("HH:mm:ss");
		
		try {
			if(isMain != 0){
				return "이미 등록된 상품입니다.";
			}else if(dateFormat.parse(remainTime).before(dateFormat.parse("6:00:00"))) {
				return "메인 상품에 등록 실패 하였습니다. 경매 마감 6시간 전입니다.";
			}else if(mainCount >= 12) {
				return "이미 12개의 상품이 등록 되어 있습니다. 잠시 후에 다시 시도해 주세요.";
			}else {
				auctionProductDAO.addMainAuctionProduct(auctionProductNo);
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
	public AuctionInfo deleteAuctionProduct(AuctionInfo auctionInfo) {
		// TODO Auto-generated method stub
		
		String status = auctionInfo.getAuctionStatus();
		
		if(status.equals("CANCEL")) {
			auctionProductDAO.deleteAuctionProduct(auctionInfo);
			auctionInfo.setInfo("낙찰 취소 되셨습니다.");
			return auctionInfo;	
		}else if(status.equals("CONFIRM")){
			auctionProductDAO.deleteAuctionProduct(auctionInfo);
			auctionInfo.setInfo("경매 확정 되셨습니다.");
			return auctionInfo;
		}
		
		AuctionProduct auctionProduct = auctionProductDAO.getAuctionProduct(auctionInfo.getAuctionProductNo());

		SimpleDateFormat dateFormat = new SimpleDateFormat("HH:mm:ss");
		
		try {
			if(auctionProduct.getCurrentBidPrice() != 0) {
				
				auctionInfo.setInfo("입찰자가 있어 중도 철회 불가합니다.");
				
			}else if(dateFormat.parse(auctionProduct.getRemainAuctionTime()).after(dateFormat.parse("20:00:00")) ) {
				
				auctionProductDAO.deleteAuctionProduct(auctionInfo);
				auctionInfo.setInfo("중도 철회 성공하셨습니다.");

			}else {
				
				auctionInfo.setInfo("경매 진행 잔여 시간이 20시간 이전이어 중도 철회 불가합니다.");
				
			}
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	
		return auctionInfo;
	}

	@Override
	public AuctionInfo updateBidEndTime(String auctionProductNo) {
		// TODO Auto-generated method stub
		int isSuccess = auctionProductDAO.updateBidEndTime(auctionProductNo);
		
		AuctionInfo auctionInfo = new AuctionInfo();
		auctionInfo.setAuctionProductNo(auctionProductNo);
		String info = "";
		if(isSuccess != 1) {
			info = "경매 시간 연장에 오류 발생하였습니다 관리자에게 문의하세요.";
		}else {
			info = "경매 시간이 10초 연장 되었습니다.";
		}
		auctionInfo.setInfo(info);
		
		return auctionInfo;
	}
	
	// EC2에서 coupang url을 통해 Document를 가져오지 못하도록 제한되어 있어 Naver 상품검색 API로 대채한다.
	@Override
	public List<AuctionProduct> listCrawlingAuctionProduct(Search search) {
		// TODO Auto-generated method stub
		List<AuctionProduct> list = crawlingData.crawlingList(search);
	
		return list;
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
		}else if(hashtags.length ==3) {
			auctionProduct.setHashtag1("#"+hashtags[1].trim());	
			auctionProduct.setHashtag2("#"+hashtags[2].trim());			
		}else if(hashtags.length > 3) {
			auctionProduct.setHashtag1("#"+hashtags[1].trim());	
			auctionProduct.setHashtag2("#"+hashtags[2].trim());	
			auctionProduct.setHashtag3("#"+hashtags[3].trim());			
		}
		
		//데이터를 저장한다. 등록자는 관리자가 Default이다.
		auctionProductDAO.addCrawlingAuctionProduct(auctionProduct);
		
		//저장한 크롤링 데이터의 상품 번호를 가져온다.
		String auctionProductNo = auctionProductDAO.getCrawlingAuctionProductNo(auctionProduct.getAuctionProductSubDetail());
		
		//조회수를 1 증가 시킨다.
		auctionProductDAO.updateAuctionProductViewCounter(auctionProductNo);
		
		
		return auctionProductDAO.getAuctionProduct(auctionProductNo);
	}
}
