package site.gamsung.controller.payment;

import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import site.gamsung.service.common.Page;
import site.gamsung.service.common.Search;
import site.gamsung.service.domain.Payment;
import site.gamsung.service.domain.PaymentCode;
import site.gamsung.service.domain.PointTransfer;
import site.gamsung.service.domain.User;
import site.gamsung.service.payment.PaymentService;
import site.gamsung.service.user.UserService;

@Controller
@RequestMapping("/payment/*")
public class PaymentController {

	/// Field
	@Autowired
	@Qualifier("paymentServiceImpl")
	private PaymentService paymentService;
	
	@Autowired
	@Qualifier("userServiceImpl")
	private UserService userService;

	// @Value("#{commonProperties['pageUnit']}")
	@Value("#{commonProperties['pageUnit'] ?: 10}")
	int pageUnit;

	// @Value("#{commonProperties['pageSize']}")
	@Value("#{commonProperties['pageSize'] ?: 5}")
	int pageSize;

	public PaymentController() {
			System.out.println(this.getClass());
	}
	
		
	/*
	 *  Point
	 */	
	@RequestMapping(value = "managePoint", method = RequestMethod.GET)
	public String managePoint(HttpSession httpSession) throws Exception {
				
		// 포인트환불 수수료 코드입력
		String pointWithdrawPaymentCode = "P2";		
		int paymentRefundReferenceFee = paymentService.getPaymentCodeInfo(pointWithdrawPaymentCode).getPaymentCodeFee();		
		
		return "forward:/payment/readyPayment"
				+ "?pointWithdrawPaymentCode="+pointWithdrawPaymentCode
				+ "&paymentRefundReferenceFee="+paymentRefundReferenceFee;
	}
		
	/*
	 *  Payment
	 */	
	@RequestMapping(value = "readyPayment")
	public String readyPayment(@ModelAttribute("payment") Payment payment, 
								@RequestParam("pointWithdrawPaymentCode") String pointWithdrawPaymentCode, 
								@RequestParam("paymentRefundReferenceFee") int paymentRefundReferenceFee, 
								Model model, HttpSession httpSession) throws Exception {
			
		System.out.println("1 payment : " + payment); 													// 테스트
		System.out.println("2 pointWithdrawPaymentCode : " + pointWithdrawPaymentCode); 				// 테스트
		System.out.println("3 paymentRefundReferenceFee : " + paymentRefundReferenceFee); 				// 테스트
		
		// point관리 
		if(pointWithdrawPaymentCode != null && paymentRefundReferenceFee != 0) {
			
			// user 전체정보요청
			User tempUser = userService.getUser( ((User) httpSession.getAttribute("user")).getId() );				
			System.out.println("Session tempUser : " + tempUser);   									// 테스트
			
			if (tempUser != null) {
				//payment.setPaymentCode(pointWithdrawPaymentCode);
				payment.setPaymentCode("P1");
				payment.setPaymentRefundReferenceFee(paymentRefundReferenceFee);
				System.out.println("1 point관리 : " + payment);											// 테스트
				
				httpSession.setAttribute("user", tempUser);
				model.addAttribute("user", tempUser);				
			} 	
		}		
		model.addAttribute("payment", payment);
		System.out.println("3 paymentCodeCtrl readyPayment : "+payment); 								// 테스트
		
		return "forward:/view/payment/readyPayment.jsp";		
	}
	
	
	@RequestMapping(value = "getPayment", method = RequestMethod.POST)
	public String getPayment(@ModelAttribute("payment") Payment payment, Model model) throws Exception {	
		
		List<Payment> list = paymentService.getPayment(payment);
		model.addAttribute("list", list);
		
		return "forward:/view/payment/getPayment.jsp";
	}
	
	@RequestMapping(value = "listPayment", method = RequestMethod.GET)
	public String listPayment(@ModelAttribute("search") Search search, Model model) throws Exception {
		
		/*
		 * if (search.getCurrentPage() == 0) { search.setCurrentPage(1); }
		 * 
		 * search.setPageSize(pageSize); search.setSearchItemType("Payment");
		 * Map<String, Object> map = paymentService.listPayment(search); Page resultPage
		 * = new Page(search.getCurrentPage(), ((Integer)
		 * map.get("totalCount")).intValue(), pageUnit, pageSize);
		 * 
		 * model.addAttribute("list", map.get("list")); model.addAttribute("resultPage",
		 * resultPage); model.addAttribute("search", search);
		 */	
		
		return "forward:/view/payment/listPayment.jsp";
	}
	
	@RequestMapping(value = "paymentSystem", method = RequestMethod.POST)
	public String paymentSystem (@ModelAttribute("payment") Payment payment, HttpSession httpSession, Model model) throws Exception {	
						
		System.out.println("000 payment : " + payment); 							// 테스트	
		Payment paymentResult = new Payment();
		User tempUser = new User();
		String paymentNo = "";	
		
		// 결제상품명
		String oriProduct = payment.getPaymentProduct();
		
		// 송금자ID
		String oriSenderId = payment.getPaymentSender();
		
		// 수금자Id
		String oriReceiverId = payment.getPaymentReceiver();
		
		// 결제코드유형
		String oriPaymentCode = payment.getPaymentCode();
		
		// 결제코드 전체항목
		PaymentCode oriPaymentCodeInfo = (PaymentCode) paymentService.getPaymentCodeInfo(payment.getPaymentCode());
				
		// 해당결제코드 수수료율
		int oriPaymentReferenceFee = oriPaymentCodeInfo.getPaymentCodeFee();
		
		// 결제 전체 금액
		int oriPaymentProductPriceTotal = payment.getPaymentProductPriceTotal();
		
		// 결제상품 참조번호
		String oriReferenceNum = payment.getPaymentReferenceNum();
		
		// 결제방법
		String oriMethod = payment.getPaymentMethod();
		
		// 일반결제 총금액
		int oriPriceTotal = payment.getPaymentPriceTotal();	
		
		// !null => 포인트결제
		String oriMethodSecond = payment.getPaymentMethodSecond();
		
		// 포인트결제 총금액
		int oriPriceTotalSecond = payment.getPaymentPriceTotalSecond();	
		
		// 포인트 구매[P]
		int oriPointChargeTotal = payment.getPointChargeTotal();			

		
		// 포인트구매 결제
		if(oriPaymentCode.equals("P1")) {
			
			// 포인트이동 User_DB
			PointTransfer pointTransfer = new PointTransfer();
			pointTransfer.setSenderId("admin");
			pointTransfer.setReceiverId(oriSenderId);		
			pointTransfer.setPointAmount(oriPointChargeTotal);	
			pointTransfer.setFeeRate(oriPaymentReferenceFee);
			paymentService.pointTransferByUsers(pointTransfer);
			System.out.println("1 포인트구매 pointTransfer : " + pointTransfer); 			// 테스트
			
			// 포인트구매내역 Payment_DB 
			Payment movePointHistory = new Payment();
			movePointHistory.setPaymentProduct(oriProduct);
			movePointHistory.setPaymentSender("[PointManageSystem-C]");
			movePointHistory.setPaymentReceiver(oriSenderId);
			movePointHistory.setPaymentCode(oriPaymentCode);
			movePointHistory.setPaymentProductPriceTotal(oriPointChargeTotal);
			movePointHistory.setPaymentMethodSecond("point");				
			movePointHistory.setPaymentPriceTotalSecond(oriPointChargeTotal);
			movePointHistory.setPaymentReferenceNum(oriReferenceNum);	
			paymentService.addMakePayment(movePointHistory);		
			System.out.println("2 포인트구매내역 DB저장 payment : " + movePointHistory); 			// 테스트
					
			// 결제완료내역 Payment_DB
			Payment paymentPay = new Payment();
			paymentPay.setPaymentProduct(oriProduct);
			paymentPay.setPaymentSender(oriSenderId);
			paymentPay.setPaymentReceiver("[PointManageSystem-C]");
			paymentPay.setPaymentCode(oriPaymentCode);
			paymentPay.setPaymentProductPriceTotal(oriPriceTotal);			
			paymentPay.setPaymentMethod(oriMethod);							
			paymentPay.setPaymentPriceTotal(oriPriceTotal);
			paymentPay.setPaymentReferenceNum(oriReferenceNum);	
			paymentNo = paymentService.addMakePayment(paymentPay);		
			System.out.println("paymentNo : "+paymentNo);
			System.out.println("3 결제완료내역 저장 payment : " + paymentPay); 				// 테스트	
			
			// Session 정보업데이트
			tempUser = userService.getUser( ((User) httpSession.getAttribute("user")).getId() );
			httpSession.removeAttribute("user");
			httpSession.setAttribute("user", tempUser);
			
			// 결과 			
			paymentResult.setPaymentNo(paymentNo);
			paymentResult.setPaymentProduct(oriProduct);
			paymentResult.setPaymentSender(oriSenderId);
			paymentResult.setPaymentCode(oriPaymentCode);
			paymentResult.setPaymentProductPriceTotal(oriPriceTotal);
			paymentResult.setPaymentReferenceNum(oriReferenceNum);
			paymentResult.setPaymentMethod(oriMethod);
			paymentResult.setPaymentPriceTotal(oriPriceTotal);
			paymentResult.setPointChargeTotal(oriPointChargeTotal);			
			System.out.println("4 결과 paymentResult : " + paymentResult); 				// 테스트				
			
		}
		
		// 캠핑예약 결제
		if(oriPaymentCode.equals("R1")) {
			
			paymentResult.setPaymentProduct(oriProduct);
			paymentResult.setPaymentSender(oriSenderId);
			paymentResult.setPaymentReceiver(oriReceiverId);
			paymentResult.setPaymentProductPriceTotal(oriPaymentProductPriceTotal);
			paymentResult.setPaymentCode(oriPaymentCode);
			paymentResult.setPaymentReferenceNum(oriReferenceNum);
			paymentResult.setPaymentMethod(oriMethod);
			paymentResult.setPaymentPriceTotal(oriPriceTotal);

			if (oriMethodSecond != null) {
				
				// 포인트처리 User_DB	
				PointTransfer pointTransfer = new PointTransfer();
				pointTransfer.setSenderId(oriSenderId);
				pointTransfer.setReceiverId(oriReceiverId);		
				pointTransfer.setPointAmount(oriPriceTotalSecond);	
				pointTransfer.setFeeRate(oriPaymentReferenceFee);
				paymentService.pointTransferByUsers(pointTransfer);
				
				paymentResult.setPaymentMethodSecond(oriMethodSecond);
				paymentResult.setPaymentPriceTotalSecond(oriPriceTotalSecond);
						
				System.out.println("포인트사용 pointTransfer : " + pointTransfer); 		// 테스트				
			} 		
			
			paymentNo = paymentService.addMakePayment(paymentResult);
			paymentResult.setPaymentNo(paymentNo);
		}		

			
		model.addAttribute("payment", paymentResult);
		
		return "forward:/view/payment/resultPayment.jsp";
	}
		
	
	/*
	 *  PaymentCode
	 */
	@RequestMapping(value = "addPaymentCode", method = RequestMethod.POST)
	public String addPaymentCode(@ModelAttribute("paymentCode") PaymentCode paymentCode) throws Exception {	
		paymentService.addPaymentCode(paymentCode);
		return "redirect:/payment/listPaymentCode";
	}
	
	@RequestMapping(value = "updatePaymentCode", method = RequestMethod.POST)
	public String updatePaymentCode(@ModelAttribute("paymentCode") PaymentCode paymentCode) throws Exception {	
		paymentService.updatePaymentCode(paymentCode);
		return "redirect:/payment/listPaymentCode";
	}
	
	@RequestMapping(value = "listPaymentCode", method = RequestMethod.GET)
	public String listPaymentCode(Model model) throws Exception {	
		model.addAttribute("list", paymentService.listPaymentCode());		
		return "forward:/view/payment/listPaymentCode.jsp";
	}

	
	/*
	 *  SiteProfit
	 */
	@RequestMapping(value = "addSiteProfit", method = RequestMethod.POST)
	public String addSiteProfit() throws Exception {	
		return "forward:/view/payment/addSiteProfit.jsp";
	}
	
	@RequestMapping(value = "listSiteProfit", method = RequestMethod.GET)
	public String listSiteProfit() throws Exception {
		return "forward:/view/payment/listSiteProfit.jsp";
	}
		
}
