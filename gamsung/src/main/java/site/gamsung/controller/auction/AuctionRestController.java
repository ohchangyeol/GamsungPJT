package site.gamsung.controller.auction;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.collections4.map.HashedMap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.simp.SimpMessageHeaderAccessor;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.messaging.simp.stomp.StompHeaderAccessor;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import site.gamsung.service.auction.AuctionInfoService;
import site.gamsung.service.auction.AuctionProductService;
import site.gamsung.service.auction.AuctionReviewService;
import site.gamsung.service.common.RatingReviewService;
import site.gamsung.service.common.Search;
import site.gamsung.service.domain.AuctionInfo;
import site.gamsung.service.domain.AuctionProduct;
import site.gamsung.service.domain.NaverProduct;
import site.gamsung.service.domain.Payment;
import site.gamsung.service.domain.RatingReview;
import site.gamsung.service.domain.User;
import site.gamsung.service.payment.PaymentService;
import site.gamsung.service.user.UserService;
import site.gamsung.util.auction.NaverShoppingAPI;

@RequestMapping("auction/rest/*")
@RestController
public class AuctionRestController {
	
	@Autowired
	@Qualifier("auctionProductService")
	private AuctionProductService auctionProductService;
	
	@Autowired
	@Qualifier("auctionInfoService")
	private AuctionInfoService auctionInfoService;
	
	@Autowired
	@Qualifier("auctionReviewService")
	private RatingReviewService ratingReviewService;
	
	@Autowired
	@Qualifier("auctionReviewService")
	private AuctionReviewService auctionReviewService;
	
	@Autowired
	@Qualifier("paymentServiceImpl")
	private PaymentService paymentService;
	
	@Autowired
	@Qualifier("userServiceImpl")
	private UserService userService;
	
	@Autowired
	@Qualifier("naverShoppingAPI")
	private NaverShoppingAPI naverShoppingAPI;
	
	@Value("#{auctionProperties['auctionPageSize']}")
	int auctionPageSize;
	
	@Value("#{auctionProperties['auctionReviewPageSize']}")
	int auctionReviewPageSize;
	
	@Autowired
	private SimpMessagingTemplate simpMessagingTemplate;
	
	@RequestMapping(value = "infiniteScrollA", produces = "application/json; charset=utf-8")
	public List<NaverProduct> naverShoppingAPI(@RequestBody Search search) {
		
		NaverProduct naverProduct = naverShoppingAPI.naverShopping(search);
		
		return naverProduct.getItems();
	}
	
	//상품명 자동 완성
	@RequestMapping("autoComplete")
	public List<String> autoComplete(@RequestBody Search search) {
		System.out.println(search.getSearchKeyword());
		List<String> list = auctionProductService.autoComplete(search.getSearchKeyword());
		return list;
	}
	
	@PostMapping("getBidderRanking")
	public AuctionInfo getBidderRanking(@RequestBody AuctionInfo auctionInfo, HttpSession httpSession) {
		
		User user = (User)httpSession.getAttribute("user");
		auctionInfo.setUser(user);
		
		return auctionInfoService.getBidderRanking(auctionInfo);
	}
	
	@GetMapping( "updateAuctionStatus/{auctionProductNo}/{status}")
	public AuctionInfo updateAuctionStatus(	@PathVariable("auctionProductNo") String auctionProductNo,
											@PathVariable("status") String status, HttpSession httpSession) {
		
		User user = (User)httpSession.getAttribute("user");
		
		AuctionInfo auctionInfo = new AuctionInfo();
		auctionInfo.setAuctionProductNo(auctionProductNo);
		auctionInfo.setAuctionStatus(status);
		
		AuctionProduct auctionProduct = (AuctionProduct)auctionProductService.getAuctionProduct(auctionInfo).get("auctionProduct");
		auctionProduct.getHopefulBidPrice();
		
		//중도철회/낙칠취소/경매확정에 대해 처리된 안내 메세지를 받는다.
		AuctionInfo info = auctionProductService.deleteAuctionProduct(auctionInfo);
		
		Payment payment = (Payment)auctionInfoService.makePaymentInfo(user, status, auctionProduct);
		
		try {
			paymentService.makePayment(payment);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		//사용자 경매 등급 재설정한다.
		user = auctionInfoService.checkAndUpdateUserAuctionGrade(user);
		httpSession.setAttribute("user", user);
		
		return info;
		
	}
	
	//입찰 10초전 증가
	@GetMapping( "updateBidEndTime/{auctionProductNo}")
	public AuctionInfo updateBidEndTime(@PathVariable("auctionProductNo") String auctionProductNo) {
		
		return auctionProductService.updateBidEndTime(auctionProductNo);
	}
	
	//리뷰 등록
	@PostMapping("addReview/{auctionProductNo}")
	public void addReview(	@PathVariable("auctionProductNo") String auctionProductNo, 
							@RequestBody RatingReview ratingReview, HttpSession httpSession) {
		
		User user = (User)httpSession.getAttribute("user");
		
		ratingReview.setUser(user);
		
		AuctionInfo auctionInfo = new AuctionInfo();
		auctionInfo.setAuctionProductNo(auctionProductNo);
		ratingReview.setAuctionInfo(auctionInfo);
		
		try {
			ratingReviewService.addRatingReview(ratingReview);
			//사용자 경매 등급 재설정한다.
			user = auctionInfoService.checkAndUpdateUserAuctionGrade(user);
			httpSession.setAttribute("user", user);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}	
	}
	
	//리뷰 리스트
	@PostMapping("listAuctionRatingReview/{currentPage}")
	public List<RatingReview> listAuctionRatingReview(@RequestBody AuctionInfo auctionInfo, HttpSession httpSession, @PathVariable int currentPage){
		
		User user = (User)httpSession.getAttribute("user");
		auctionInfo.setUser(user);
		
		//사용자 IP를 얻어온다.
		HttpServletRequest req = ((ServletRequestAttributes)RequestContextHolder.currentRequestAttributes()).getRequest();
		String ip = req.getHeader("X-FORWARDED-FOR");
		if(ip == null) {
			ip = req.getRemoteAddr();			
		}
		auctionInfo.setInfo(ip);
		
		Map<String, Object> map = auctionProductService.getAuctionProduct(auctionInfo);
	
		Search search = new Search();
		search.setCurrentPage(currentPage);
		search.setPageSize(auctionReviewPageSize);
		
		map.put("search", search);
		
		return auctionReviewService.listAuctionRatingReview(map);
	}

	//답글 등록
	@PostMapping("addReviewComment/{auctionProductNo}")
	public AuctionInfo addReviewComment(@RequestBody RatingReview ratingReview, @PathVariable("auctionProductNo") String auctionProductNo) {
		
		AuctionInfo auctionInfo = new AuctionInfo();
		auctionInfo.setAuctionProductNo(auctionProductNo);
		
		ratingReview.setAuctionInfo(auctionInfo);
		
		return auctionReviewService.addAuctionRatingReviewComment(ratingReview);
		
	}
	
	//리뷰 삭제
	@PostMapping("deleteAuctionRatingReview")
	public AuctionInfo deleteAuctionRatingReview(@RequestBody RatingReview ratingReview, HttpSession httpSession){
		
		AuctionInfo auctionInfo = auctionReviewService.deleteAuctionRatingReview(ratingReview); 
		
		//사용자 경매 등급 재설정한다.
		User user = (User)httpSession.getAttribute("user");
		user = auctionInfoService.checkAndUpdateUserAuctionGrade(user);
		httpSession.setAttribute("user", user);
		return auctionInfo;
	}
	
	//메인 상품 등록
	@RequestMapping("addMainAuctionProduct/{auctionProductNo}")
	public AuctionInfo addMainAuctionProduct(@PathVariable("auctionProductNo") String auctionProductNo) {
		
		String info = auctionProductService.addMainAuctionProduct(auctionProductNo);
		
		AuctionInfo auctionInfo = new AuctionInfo();
		auctionInfo.setInfo(info);
		
		return auctionInfo;
	}
	
	//응찰 관심 등록 해제
	@RequestMapping("addBidConcern")
	public AuctionInfo addBidConcern(@RequestBody AuctionInfo auctionInfo, HttpSession httpSession) {
		
		User user = (User)httpSession.getAttribute("user");
		auctionInfo.setUser(user);
		
		String info = auctionInfoService.addBidConcern(auctionInfo);
		
		auctionInfo.setInfo(info);
		
		return auctionInfo;
	}
	
	//검색 조건에 대한 리스트 출력
	@RequestMapping("listAuctionProduct")
	public Map<String,Object> listAuctionProduct(@RequestBody Search search, Model model, HttpSession httpSession) {
		
		User user = (User)httpSession.getAttribute("user");
		
		search.setPageSize(auctionPageSize);
		search.setCurrentPage(1);
		
		Map<String, Object> map = new HashedMap<String, Object>();
		map.put("search", search);
		map.put("user", user);
		
		//조건에 맞는 상위 8개의 상품 목록을 리스트로 받는다
		map = auctionProductService.listAuctionProduct(map);
		map.put("search", search);
		
		return map;
	}
	
	//경매 이용정지 해제
	@PostMapping("deleteSuspension")
	public AuctionInfo deleteAuctionSuspensionUser(@RequestBody User user) {
		
		return auctionInfoService.deleteAuctionSuspension(user);
	}
	
	
	@MessageMapping("/join/{auctionProductNo}")
	public void auctionJoin(AuctionInfo auctionInfo, StompHeaderAccessor stompHeaderAccessor) {
		
		List<String> list = stompHeaderAccessor.getNativeHeader("realTimeViewCount");
		for(String string : list) {
			auctionInfo.setRealTimeViewCount(Integer.parseInt(string));
		}
		
		simpMessagingTemplate.convertAndSend("/topic/join/"+auctionInfo.getAuctionProductNo(),auctionInfo);
	}
	
	@MessageMapping("/bid/{auctionProductNo}")
	public void auctionBid(AuctionInfo auctionInfo, SimpMessageHeaderAccessor simpMessageHeaderAccessor) {

		HttpSession httpSession = (HttpSession)simpMessageHeaderAccessor.getSessionAttributes().get("session");
		User user = (User)httpSession.getAttribute("user");
		
		auctionInfo.setUser(user);
		
		String info = auctionProductService.auctionProductBid(auctionInfo);
		int bidPrice = auctionInfo.getBidPrice();
		
		auctionInfo = auctionInfoService.getBidderRanking(auctionInfo);
		
		auctionInfo.setBidPrice(bidPrice);
		auctionInfo.setInfo(info);
		
		AuctionProduct auctionProduct = (AuctionProduct)auctionProductService.getAuctionProduct(auctionInfo).get("auctionProduct");
		auctionInfo.setBidDateTime(auctionProduct.getAuctionEndTime());
		
		simpMessagingTemplate.convertAndSend("/topic/bid/"+auctionInfo.getAuctionProductNo(),auctionInfo);
	}
	
	@MessageMapping("/update/{auctionProductNo}")
	public void auctionUpdate(AuctionInfo auctionInfo, SimpMessageHeaderAccessor simpMessageHeaderAccessor) {
		
		AuctionProduct auctionProduct = (AuctionProduct)auctionProductService.getAuctionProduct(auctionInfo).get("auctionProduct");
		simpMessagingTemplate.convertAndSend("/topic/update/"+auctionInfo.getAuctionProductNo(), auctionProduct);
		
	}
	
	@MessageMapping("/delete/{auctionProductNo}")
	public void auctionDelete(AuctionInfo auctionInfo, SimpMessageHeaderAccessor simpMessageHeaderAccessor) {
		System.out.println("중도철회");
		
		HttpSession httpSession = (HttpSession)simpMessageHeaderAccessor.getSessionAttributes().get("session");
		User user = (User)httpSession.getAttribute("user");
		
		auctionInfo.setUser(user);
		
		user = auctionInfoService.checkAndUpdateUserAuctionGrade(user);
		httpSession.setAttribute("user", user);
		
		auctionInfo.setInfo("해당 상품은 중도 철회 되었습니다.");
		
		simpMessagingTemplate.convertAndSend("/topic/delete/"+auctionInfo.getAuctionProductNo(),auctionInfo);

	}
	
	@MessageMapping("/exit/{auctionProductNo}")
	public void exitAuction(AuctionInfo auctionInfo, StompHeaderAccessor stompHeaderAccessor) {
		
		List<String> list = stompHeaderAccessor.getNativeHeader("realTimeViewCount");
		for(String string : list) {
			auctionInfo.setRealTimeViewCount(Integer.parseInt(string));
		}
		
		simpMessagingTemplate.convertAndSend("/topic/exit/"+auctionInfo.getAuctionProductNo(),auctionInfo);
	}
	
	//EC2 Coupang 상품 크롤링시 문제 발생
	@PostMapping("infiniteScrollB")
	public synchronized List<AuctionProduct> InfiniteScroll(@RequestBody Search search){
	
		search.setOffset(auctionPageSize);
		search.setPageSize(auctionPageSize);
		
		return auctionProductService.listCrawlingAuctionProduct(search);
	}
}
