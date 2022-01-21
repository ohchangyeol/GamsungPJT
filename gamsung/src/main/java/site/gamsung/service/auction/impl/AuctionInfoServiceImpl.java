package site.gamsung.service.auction.impl;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import site.gamsung.service.auction.AuctionProductDAO;
import site.gamsung.service.common.Search;
import site.gamsung.service.auction.AuctionInfoDAO;
import site.gamsung.service.auction.AuctionInfoService;
import site.gamsung.service.domain.AuctionInfo;
import site.gamsung.service.domain.AuctionProduct;
import site.gamsung.service.domain.Payment;
import site.gamsung.service.domain.PaymentCode;
import site.gamsung.service.domain.User;
import site.gamsung.service.user.UserDAO;
import site.gamsung.util.auction.AuctionStatisticJson;

@Service("auctionInfoService")
public class AuctionInfoServiceImpl implements AuctionInfoService{
	
	@Autowired
	@Qualifier("auctionInfoDAO")
	private AuctionInfoDAO auctionInfoDAO;
	
	@Autowired
	@Qualifier("auctionProductDAO")
	private AuctionProductDAO auctionProductDAO;
	
	@Autowired
	@Qualifier("userDAOImpl")
	private UserDAO userDAO;
	
	@Autowired
	@Qualifier("auctionStatisticJson")
	private AuctionStatisticJson auctionStatisticJson;
	
	
	public AuctionInfoServiceImpl() {
		// TODO Auto-generated constructor stub
	}

	@Override
	public String addBidConcern(AuctionInfo auctionBidInfo) {
		// TODO Auto-generated method stub
		
		int isActive = auctionInfoDAO.getBidConcern(auctionBidInfo);
		String productName = auctionProductDAO.getAuctionProduct(auctionBidInfo.getAuctionProductNo()).getAuctionProductName();
		
		String info = "";
		
		if(isActive == 0) {
			auctionInfoDAO.addBidConcern(auctionBidInfo);
			info = "선택하신 \""+productName+"\"의 응찰 관심이 활성화 되었습니다.";
		}else {
			auctionInfoDAO.deleteBidConcern(auctionBidInfo);
			info = "선택하신 \""+productName+"\"의 응찰 관심 비활성화 되었습니다.";
		}
		
		return info;
	}

	@Override
	public Map<String,Object> listBidConcern(Map<String, Object> map) {
		// TODO Auto-generated method stub
		
		List<AuctionInfo> list = auctionInfoDAO.listBidConcern(map);
		int totalCount = auctionInfoDAO.countBidConcern((User)map.get("user"));
		
		map.put("totalCount", totalCount);
		map.put("list", list);
		
		return map;
	}

	@Override
	public Map<String,Object> listAuctionProductByRole(Map<String, Object> map) {
		// TODO Auto-generated method stub
		User user = (User)map.get("user");
		int totalCount = auctionInfoDAO.countAuctionProductByRole(user.getId());
		List<AuctionProduct> list = auctionInfoDAO.listAuctionProductByRole(map);
		
		map.put("list", list);
		map.put("totalCount", totalCount);
		return map;
	}

	@Override
	public Map<String,Object> auctionHistory(Map<String, Object> map) {
		// TODO Auto-generated method stub
		
		int totalCount = auctionInfoDAO.countAuctionHistory((User)map.get("user"));
		List<AuctionInfo> list = auctionInfoDAO.auctionHistory(map);
		
		map.put("totalCount", totalCount);
		map.put("list", list);
		return map;
	}

	@Override
	public Map<String, Object> getAuctionStatistics() {
		// TODO Auto-generated method stub
		
		SimpleDateFormat dateFormat = new SimpleDateFormat("YYYY");
		int currentYear = Integer.parseInt(dateFormat.format(new Date()));
		System.out.println(currentYear);
		//년 별 등록, 중도철회, 낙찰 취소, 경매 확정 횟수를 가져온다.
		List<AuctionInfo> yearList = auctionInfoDAO.getYearAuctionStatistics();
		List<AuctionInfo> lastYearList = auctionInfoDAO.getMonthlyAuctionStatistics(currentYear-1); 
		List<AuctionInfo> currentYearList = auctionInfoDAO.getMonthlyAuctionStatistics(currentYear);
		AuctionInfo todayAuction = auctionInfoDAO.todayAuctionStatistics();
		Map<String, Object> map = new HashMap<String, Object>();
	
		map.put("yearList", auctionStatisticJson.makeJson(yearList));
		map.put("lastYearList", auctionStatisticJson.makeJson(lastYearList));
		map.put("currentYearList", auctionStatisticJson.makeJson(currentYearList));
		map.put("todayAuction",todayAuction);
		
		return map;
	}

	@Override
	public User checkAndUpdateUserAuctionGrade(User user) {
		// TODO Auto-generated method stub
		
		AuctionInfo auctionInfo = auctionInfoDAO.auctionStatusTotalCount(user);
		
		int addProductCount = auctionInfo.getAddProductCount()/2;
		int addReviewCount = auctionInfo.getAddReviewCount()/4;
		int auctionConfirmCount = auctionInfo.getAuctionConfirmCount()/2;
		int topRankCount = auctionInfo.getTopRankCount()/4;
		int midwayWithdrawalCount =auctionInfo.getMidwayWithdrawalCount();
		int cancelSuccessfulBidCount = auctionInfo.getCancelSuccessfulBidCount();
		
		int userAuctionGrade = addProductCount + addReviewCount + auctionConfirmCount + topRankCount
								- midwayWithdrawalCount - cancelSuccessfulBidCount + 1;
		if(userAuctionGrade < 1) {
			auctionInfoDAO.auctionSuspension(user);
			userAuctionGrade = 1;
		}
		user.setAuctionGrade(userAuctionGrade);
		
		auctionInfoDAO.updateUserAuctionGrade(user);
		
		return userDAO.getUser(user.getId());
	}

	@Override
	public AuctionInfo getBidderRanking(AuctionInfo auctionInfo) {
		// TODO Auto-generated method stub
		List<AuctionInfo> list = auctionInfoDAO.getBidderRanking(auctionInfo);
		
		if(list.size() == 0) {
			return auctionInfo;
		}
		
		return auctionInfoDAO.getBidderRanking(auctionInfo).get(0);
	}

	@Override
	public Map<String, Object> listAuctionSuspensionUser(User user, Search search) {
		// TODO Auto-generated method stub
		
		List<User> list = auctionInfoDAO.auctionSuspensionUserList(search);
		int count = auctionInfoDAO.countAuctionSuspensionUser();
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);
		map.put("count", count);
		
		return map;
	}

	@Override
	public AuctionInfo deleteAuctionSuspension(User user) {
		// TODO Auto-generated method stub
		boolean isUpdate = auctionInfoDAO.deleteAuctionSuspension(user);
		AuctionInfo auctionInfo = new AuctionInfo();
		
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd"); 
		Date date = new Date(); 
		String now = format.format(date);
		
		if(isUpdate) {
			auctionInfo.setInfo(now+" "+user.getId()+"의 경매 이용정지가 해제 되었습니다.");
		}else {
			auctionInfo.setInfo("이용정지 해제중 오류가 발생 하였습니다. 개발자에게 문의하세요.");
		}
		
		return auctionInfo;
	}

	@Override
	public Object makePaymentInfo(User user, String option, AuctionProduct auctionProduct) {
		// TODO Auto-generated method stub
		
		//상품 등록 수수료를 받아올 때는 등록자 ID를 통해 가장 최근에 등록된 상품정보를 가져온다. 
		if(auctionProduct == null) {
			auctionProduct = auctionProductDAO.paymentSubInfo(user.getId());
			if(auctionProduct != null) {
				auctionProduct = auctionProductDAO.getAuctionProduct(auctionProduct.getAuctionProductNo());							
			}
		}
		PaymentCode paymentCode = new PaymentCode();
		paymentCode.setPaymentCodeRangeStart(user.getAuctionGrade());
		
		switch(option) {
		case "CANCEL":
			option = "낙찰취소";
			break;
		case "CONFIRM":
			option = "경매확정";
			break;
		case "WITHDRAWAL":
			option = "중도철회";
			break;
		}
		
		paymentCode.setPaymentCodeInfo(option);
		
		paymentCode = auctionInfoDAO.getPaymentInfo(paymentCode);
		
		Payment payment = new Payment();
		
		switch(option) {
		case "상품등록 수수료": 
			return paymentCode;
		case "중도철회 수수료": 
			return paymentCode;
		case "경매확정 수수료": 
			return paymentCode;
		case "낙찰취소 수수료": 
			return paymentCode;
		case "경매확정":
			payment.setPaymentReceiver(auctionProduct.getRegistrantId());
			payment.setPaymentPriceTotalSecond(auctionProduct.getCurrentBidPrice());
			break;
		default : //상품등록, 중도철회, 낙찰취소
			payment.setPaymentReceiver("admin");
			payment.setPaymentPriceTotalSecond(auctionProduct.getHopefulBidPrice()*paymentCode.getPaymentCodeFee()/100);
			break;
		}
		
		payment.setPaymentProduct(auctionProduct.getAuctionProductName());
		payment.setPaymentSender(user.getId());
		payment.setPaymentReferenceNum("["+auctionProduct.getAuctionProductNo()+"]");
		payment.setPaymentCode(paymentCode.getPaymentCode());
		payment.setPaymentMethodSecond("point");
		
		return payment;
	}
}
