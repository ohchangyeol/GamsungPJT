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
		
		/////////////////////////////////////////////////////////////////////// Session 완료시 삭제
		User tempSessionUser = new User();		
		
		tempSessionUser.setId("businessuser3@gamsung.com"); // TS -3 저장
		//tempSessionUser.setId("businessuser6@gamsung.com"); // TS -2 임시저장
		//tempSessionUser.setId("businessuser9@gamsung.com"); // TS -1 발급 완료
		//tempSessionUser.setId("businessuser11@gamsung.com");  // TS -0 발급 미완료
		//tempSessionUser.setId("admin");					  // admin		
		
		httpSession.setAttribute("user", tempSessionUser);
		System.out.println("tempSessionUser : " + tempSessionUser);
		/////////////////////////////////////////////////////////////////////// 여기까지 삭제
		
		
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
		
		////////// 테스트
		//payment.setPaymentCode("P1");
		payment.setPaymentCode("R1");
		//////////테스트
		
		System.out.println("1 payment : " + payment); 													// 테스트
		System.out.println("2 pointWithdrawPaymentCode : " + pointWithdrawPaymentCode); 				// 테스트
		System.out.println("3 paymentRefundReferenceFee : " + paymentRefundReferenceFee); 				// 테스트
		
		// point관리 
		if(pointWithdrawPaymentCode != null && paymentRefundReferenceFee != 0) {
			System.out.println("1 point관리 : " + payment);												// 테스트
			
			// user 전체정보요청
			User tempUser = userService.getUser( ((User) httpSession.getAttribute("user")).getId() );			
			
			System.out.println("Session tempUser : " + tempUser);   									// 테스트
			
			if (tempUser != null) {
				//payment.setPaymentCode(pointWithdrawPaymentCode);
				payment.setPaymentRefundReferenceFee(paymentRefundReferenceFee);
				model.addAttribute("user", tempUser);				
			} 	
			
		} else {					
			
			System.out.println("2 캠핑/경매/양도 : " + payment); 											// 테스트
			char itemControl = payment.getPaymentCode().charAt(0);	
			
			// 캠핑예약
			if( itemControl == 'R' ){
				
				// 
				String paymentCode = payment.getPaymentCode();		
				int paymentReferenceFee = paymentService.getPaymentCodeInfo(paymentCode).getPaymentCodeFee();
				
					
				
			}
			
			if( itemControl == 'A' ){
				
			}
			
			if( itemControl == 'T' ){
				
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
	
	@RequestMapping(value = "listPayment", method = RequestMethod.POST)
	public String listPayment(@ModelAttribute("search") Search search, Model model) throws Exception {
		
		if (search.getCurrentPage() == 0) {
			search.setCurrentPage(1);
		}

		search.setPageSize(pageSize);
		search.setSearchItemType("Payment");
		Map<String, Object> map = paymentService.listPayment(search);
		Page resultPage = 
				new Page(search.getCurrentPage(), ((Integer) map.get("totalCount")).intValue(), pageUnit, pageSize);
		
		model.addAttribute("list", map.get("list"));
		model.addAttribute("resultPage", resultPage);
		model.addAttribute("search", search);		
		
		return "forward:/view/payment/listPayment.jsp";
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
	
	/*
	 * Private Method
	 */
		
	@RequestMapping(value = "paymentSystem", method = RequestMethod.POST)
	public String paymentSystem (@ModelAttribute("payment") Payment payment, HttpSession httpSession, Model model) throws Exception {	
		
		System.out.println("000 payment : " + payment); 							// 테스트	
		Payment paymentResult = new Payment();
		
		// 결제기본
		String oriPaymentCode = payment.getPaymentCode();
		String oriProduct = payment.getPaymentProduct();
		String oriSenderId = payment.getPaymentSender();
		String oriReceiverId = payment.getPaymentReceiver();		
		int oriPaymentProductPriceTotal = payment.getPaymentProductPriceTotal();
		String oriReferenceNum = payment.getPaymentReferenceNum();		
		String oriMethod = payment.getPaymentMethod();
		int oriPriceTotal = payment.getPaymentPriceTotal();	
		String oriMethodSecond = payment.getPaymentMethodSecond();
		int oriPriceTotalSecond = payment.getPaymentPriceTotalSecond();	
		int oriPointChargeTotal = payment.getPointChargeTotal();
		String payNo = "";

		// 포인트구매 결제
		if(oriPaymentCode.equals("P1")) {
			
			// 포인트구매 User_DB
			PointTransfer pointTransfer = new PointTransfer();
			pointTransfer.setSenderId("admin");
			pointTransfer.setReceiverId(oriSenderId);		
			pointTransfer.setPointAmount(oriPointChargeTotal);		
			paymentService.pointTransferByUsers(pointTransfer);
			System.out.println("1 포인트구매 pointTransfer : " + pointTransfer); 			// 테스트
			
			// 포인트구매내역 Payment_DB 
			Payment paymentPoint = new Payment();
			paymentPoint.setPaymentProduct(oriProduct);
			paymentPoint.setPaymentSender("[PointManageSystem-C]");
			paymentPoint.setPaymentReceiver(oriSenderId);
			paymentPoint.setPaymentCode(oriPaymentCode);
			paymentPoint.setPaymentProductPriceTotal(oriPointChargeTotal);
			paymentPoint.setPaymentMethod("point");				
			paymentPoint.setPaymentPriceTotal(oriPointChargeTotal);
			paymentPoint.setPaymentReferenceNum(oriReferenceNum);	
			paymentService.addMakePayment(paymentPoint);		
			System.out.println("2 포인트구매내역 DB저장 payment : " + paymentPoint); 			// 테스트
					
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
			payNo = paymentService.addMakePayment(paymentPay);		
			System.out.println("payNo : "+payNo);
			System.out.println("3 결제완료내역 저장 payment : " + paymentPay); 				// 테스트	
			
			// 결과 			
			paymentResult.setPaymentNo(payNo);
			paymentResult.setPaymentProduct(oriProduct);
			paymentResult.setPaymentSender(oriSenderId);
			paymentResult.setPaymentCode(oriPaymentCode);
			paymentResult.setPaymentProductPriceTotal(oriPointChargeTotal);
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
				paymentService.pointTransferByUsers(pointTransfer);
				
				paymentResult.setPaymentMethodSecond(oriMethodSecond);
				paymentResult.setPaymentPriceTotalSecond(oriPriceTotalSecond);
						
				System.out.println("포인트사용 pointTransfer : " + pointTransfer); 		// 테스트				
			} 		
			
			payNo = paymentService.addMakePayment(paymentResult);
			paymentResult.setPaymentNo(payNo);
		}		

			
		model.addAttribute("payment", paymentResult);
		
		return "forward:/view/payment/resultPayment.jsp";
	}
	
	
}
