package site.gamsung.controller.payment;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
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

import site.gamsung.service.camp.CampReservationService;
import site.gamsung.service.domain.CampReservation;
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
	private PaymentController paymentController;	
	
	@Autowired
	@Qualifier("paymentServiceImpl")
	private PaymentService paymentService;
	
	@Autowired
	@Qualifier("campReservationServiceImpl")
	private CampReservationService campReservationService;
	
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
	public String managePoint(HttpServletRequest request) throws Exception {
		
		// 포인트환불 수수료 코드입력
		Payment payment = new Payment();
		String pointWithdrawPaymentCode = "P2";	
		payment.setPaymentCode(pointWithdrawPaymentCode);
		payment.setPaymentRefundReferenceFee(paymentService.getPaymentCodeInfo(pointWithdrawPaymentCode).getPaymentCodeFee());

		request.setAttribute("payment", payment);
			
		return "forward:/payment/readyPayment";
	}
		
	/*
	 *  Payment
	 */	
	@RequestMapping(value = "readyPayment")
	public String readyPayment(HttpServletRequest request, HttpSession httpSession, Model model) throws Exception {
		
		if (httpSession.getAttribute("user") == null) {
			return "forward:/main.jsp";
		}
		
		Payment tempPayment = new Payment();
		
		//포인트관리
		Payment paymentFromPoint = (Payment) request.getAttribute("payment");
		if(paymentFromPoint != null) {
			tempPayment = paymentFromPoint;
		}
		
		//캠핑예약결제
		Map<String, Object> payCampMapFromCamp = (Map<String, Object>) request.getAttribute("payCampMap");
		if(payCampMapFromCamp != null) {
			tempPayment = (Payment) payCampMapFromCamp.get("payment");
			CampReservation campReservationFromCamp = (CampReservation) payCampMapFromCamp.get("campReservation");
			model.addAttribute("campReservation", campReservationFromCamp);			
		}		
		
		System.out.println("0 readyPayment_paymentFromPoint : " + paymentFromPoint); 				// 테스트
		System.out.println("1 readyPayment_payCampMapFromCamp : " + payCampMapFromCamp); 			// 테스트		
		System.out.println("2 readyPayment_tempPayment : " + tempPayment); 							// 테스트		
						
		// user 전체정보요청
		User tempUser = userService.getUser( ((User) httpSession.getAttribute("user")).getId() );				
		System.out.println("3 Session tempUser : " + tempUser);   									// 테스트
		
		httpSession.removeAttribute("user");
		httpSession.setAttribute("user", tempUser);
		model.addAttribute("payment", tempPayment);		
		
		return "forward:/view/payment/readyPayment.jsp";		
	}	
	
	@RequestMapping(value = "paymentSystem", method = RequestMethod.POST)
	public String paymentSystem (@ModelAttribute("payment") Payment payment, 
									@ModelAttribute(value ="campReservation") CampReservation campReservation, 
									HttpSession httpSession, Model model) throws Exception {	
		
		System.out.println("0 paymentSystem_payment : " + payment); 						// 테스트
		System.out.println("1 paymentSystem_campReservation : " + campReservation); 		// 테스트		
						
		User tempUser = new User();
		String paymentRespond = "";	
		
		paymentRespond = paymentService.makePayment(payment);
		char ctrlLetter = paymentRespond.charAt(0);
		
		if(ctrlLetter == 'P') {		
			payment.setPaymentNo(paymentRespond);				
		} else if(ctrlLetter == 'E') {
			payment.setPaymentNotice(paymentRespond);			
		}
				
		// 캠핑장 최초예약 결제완료-예약완료 처리
		if(campReservation.getReservationStatus() == 0) {
			campReservation.setReservationStatus(1);		
			campReservation.setTotalPaymentPrice(0);
			campReservationService.updateTempReservationToReal(campReservation);
		}
		
		// 캠핑장 예약변경 결제완료-예약완료 처리
		if(campReservation.getReservationStatus() == 2) {
			campReservationService.updateReservation(campReservation);
		}			
		
		// Session 정보업데이트
		tempUser = userService.getUser( ((User) httpSession.getAttribute("user")).getId() );
		httpSession.removeAttribute("user");
		httpSession.setAttribute("user", tempUser);
		model.addAttribute("payment", payment);
		model.addAttribute("campReservation", campReservation);
		
		System.out.println("3 paymentSystem_payment : " + payment); 					// 테스트
		System.out.println("4 paymentSystem_campReservation : " + campReservation); 	// 테스트		
		System.out.println("5 paymentSystem_tempUser : " + tempUser); 					// 테스트	
		
		return "forward:/view/payment/resultPayment.jsp";
	}	
	
	@RequestMapping(value = "readyRefund", method = RequestMethod.GET)
	public String readyRefund(@RequestParam(value ="paymentNo", required = false) String paymentNo,
								@RequestParam(value ="reservationNo", required = false) String reservationNo,
								@RequestParam(value ="paymentRefundCode", required = false) String paymentRefundCode,								
								HttpServletRequest request, Model model) throws Exception {	
		
		Payment paymentRecord = null;
		PaymentCode paymentCodeInfo = null;
		List<Payment> paymentRecordList = new ArrayList<Payment>();
		String referenceNum = null;
		String refNum = null;
		
		System.out.println("paymentNo : " + paymentNo);														// 테스트
		System.out.println("reservationNo : " + reservationNo);												// 테스트
		System.out.println("paymentRefundCode : " + paymentRefundCode);										// 테스트
		
		if(paymentNo != null) {
			paymentRecord = paymentService.getPaymentInfo(paymentNo);
			paymentRecordList.add(paymentRecord);
			referenceNum = paymentRecord.getPaymentReferenceNum();
			refNum = referenceNum.substring(1, 7);
		}
		
		if(reservationNo != null) {
			paymentRecordList = paymentService.getPaymentListByRsvNo(reservationNo);
			refNum = reservationNo;
		}		

		if(paymentRefundCode != null) {
			paymentCodeInfo = paymentService.getPaymentCodeInfo(paymentRefundCode);
		}
				
		int refundFeeRate = paymentCodeInfo.getPaymentCodeFee();
		
		List<Payment> paymentNewList = new ArrayList<Payment>();
		for (int cnt = 0; cnt < paymentRecordList.size(); cnt++) {
			Payment onePayment = paymentRecordList.get(cnt);
			
			System.out.println("paymentRecordList1 : "+cnt+" : " + onePayment);
			
			if(onePayment.getPaymentMethod() != null) {
				int orginalPaymentPriceTotal = onePayment.getPaymentPriceTotal();
				int refundPaymentPriceFee = orginalPaymentPriceTotal * refundFeeRate / 100;
				int refundPaymentPricePay = orginalPaymentPriceTotal - refundPaymentPriceFee;
				
				onePayment.setPaymentRefundPriceTotal(orginalPaymentPriceTotal);
				onePayment.setPaymentRefundPricePay(refundPaymentPricePay);
				onePayment.setPaymentRefundPriceFee(refundPaymentPriceFee);			
			}
			
			if(onePayment.getPaymentMethodSecond() != null) {
				int orginalPaymentPriceTotalSecond = onePayment.getPaymentPriceTotalSecond();
				int refundPaymentPriceFeeSecond = orginalPaymentPriceTotalSecond * refundFeeRate / 100;
				int refundPaymentPricePaySecond = orginalPaymentPriceTotalSecond - refundPaymentPriceFeeSecond;
				
				onePayment.setPaymentRefundPriceTotalSecond(orginalPaymentPriceTotalSecond);
				onePayment.setPaymentRefundPricePaySecond(refundPaymentPricePaySecond);
				onePayment.setPaymentRefundPriceFeeSecond(refundPaymentPriceFeeSecond);			
			}			
			
			onePayment.setPaymentRefundCode(paymentRefundCode);
			System.out.println("paymentRecordList2 : "+cnt+" : " + onePayment);
			paymentNewList.add(onePayment);
		}
		
		for (Payment payment : paymentNewList) {
			System.out.println("payment : " + payment);
		}
		
		String Codeletter = paymentCodeInfo.getPaymentCode();
		char letter = Codeletter.charAt(0);	
				
		if(letter == 'R') {
			CampReservation campReservationInfo = campReservationService.getReservation(refNum);
			model.addAttribute("campReservation", campReservationInfo);
			System.out.println("campReservation : "+campReservationInfo);                           // 테스트
		}
		
		System.out.println("paymentCodeInfo : "+paymentCodeInfo);									// 테스트
		System.out.println("Codeletter : "+Codeletter);												// 테스트
		System.out.println("referenceNum : "+referenceNum);											// 테스트
		System.out.println("refNum : "+refNum);														// 테스트
		System.out.println("paymentRecord : "+paymentRecord);										// 테스트
		
		model.addAttribute("paymentList", paymentNewList);
		
		return "forward:/view/payment/readyRefund.jsp";
	}
	
	@RequestMapping(value = "refundSystem", method = RequestMethod.POST)
	public String refundSystem(@ModelAttribute Payment paymentList, 
								@ModelAttribute("campReservation") CampReservation campReservation, 
								HttpSession httpSession, Model model) throws Exception {
		
		System.out.println("payment : "+paymentList);												// 테스트
		System.out.println("campReservation : "+campReservation);									// 테스트
		
		List<Payment> paymentListFromParam = paymentList.getPaymentList();
		for (int cnt = 0; cnt < paymentListFromParam.size(); cnt++) {
			
			Payment onePayment = paymentListFromParam.get(cnt);
			onePayment.setPaymentStatus(3);
			System.out.println("paymentRecordList : "+cnt+" : " + onePayment);						// 테스트
			
			if(onePayment.getPaymentMethodSecond() != null) {
				
				String sender = onePayment.getPaymentSender();
				String receiver = onePayment.getPaymentReceiver();
				
				// 기존 포인트 취소
				PointTransfer senderCase = new PointTransfer();
				senderCase.setUserId(sender);
				senderCase.setPointAmount(onePayment.getPaymentPriceTotalSecond());
				paymentService.pointUpdateById(senderCase);
				
				PointTransfer receiverCase = new PointTransfer();
				receiverCase.setUserId(receiver);
				receiverCase.setPointAmount(onePayment.getPaymentPricePaySecond() * -1);
				paymentService.pointUpdateById(receiverCase);
				
				PointTransfer adminCase = new PointTransfer();
				adminCase.setUserId("admin");
				adminCase.setPointAmount(onePayment.getPaymentPriceFeeSecond() * -1);				
				paymentService.pointUpdateById(adminCase);

				
				// 환불규정 참조 재결제
				PaymentCode onePaymentCodeInfo = paymentService.getPaymentCodeInfo(onePayment.getPaymentRefundCode());
				PointTransfer newCase = new PointTransfer();
				
				int pointAmount = onePayment.getPaymentPriceTotalSecond();
				int feeRate = onePaymentCodeInfo.getPaymentCodeFee();	
				int adminFee = pointAmount * feeRate / 100;
				int pointAmountAfterFee = pointAmount - adminFee;
				
				newCase.setSenderId(sender);
				newCase.setReceiverId(receiver);
				newCase.setPointAmount(pointAmount);
				newCase.setFeeRate(feeRate);
				paymentService.pointTransferByUsers(newCase);
				
				onePayment.setPaymentRefundPriceTotalSecond(pointAmount);
				onePayment.setPaymentRefundPricePaySecond(pointAmountAfterFee);
				onePayment.setPaymentRefundPriceFeeSecond(adminFee);
			
			}
			
			String paymentCode = onePayment.getPaymentCode();
			System.out.println("paymentCode.charAt(0) : " + paymentCode.charAt(0));
			if(paymentCode.charAt(0)=='R') {
				
				String tempReservationNum = onePayment.getPaymentReferenceNum().substring(1, 7);
				System.out.println("tempReservationNum : " + tempReservationNum);
				
				onePayment.setPaymentReferenceNum(tempReservationNum);
				campReservationService.cancleReservationDo(onePayment);
			}
			
			paymentService.refundPayment(onePayment);
		}
		
		List<Payment> paymentNewList = paymentService.getPaymentListByRsvNo(campReservation.getReservationNo());
		for (Payment payment : paymentNewList) {
			System.out.println("payment : " + payment);
		}
		
		model.addAttribute("paymentList", paymentNewList);
		model.addAttribute("campReservation", campReservation);
		
		return "forward:/view/payment/resultRefund.jsp";
	}
	
	@RequestMapping(value = "listPayment", method = RequestMethod.GET)
	public String listPayment() throws Exception {					
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
		
}
