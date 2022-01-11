package site.gamsung.controller.payment;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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
		
		System.out.println("0 readyPayment_paymentFromPoint : " + paymentFromPoint); 							// 테스트
		System.out.println("1 readyPayment_payCampMapFromCamp : " + payCampMapFromCamp); 						// 테스트		
		System.out.println("2 readyPayment_tempPayment : " + tempPayment); 										// 테스트		
						
		// user 전체정보요청
		User tempUser = userService.getUser( ((User) httpSession.getAttribute("user")).getId() );				
		System.out.println("3 Session tempUser : " + tempUser);   											// 테스트
		
		httpSession.removeAttribute("user");
		httpSession.setAttribute("user", tempUser);
		model.addAttribute("payment", tempPayment);		
		
		return "forward:/view/payment/readyPayment.jsp";		
	}	
	
	@RequestMapping(value = "paymentSystem", method = RequestMethod.POST)
	public String paymentSystem (@ModelAttribute("payment") Payment payment, HttpSession httpSession, Model model) throws Exception {	
						
		System.out.println("000 payment : " + payment); 												// 테스트	
		User tempUser = new User();
		String paymentRespond = "";	
		
		paymentRespond = paymentService.makePayment(payment);
		char ctrlLetter = paymentRespond.charAt(0);
		
		if(ctrlLetter == 'P') {		
			payment.setPaymentNo(paymentRespond);				
		} else if(ctrlLetter == 'E') {
			payment.setPaymentNotice(paymentRespond);			
		}
		
		/*
		System.out.println("000 payment : " + payment); 												// 테스트	
		Payment paymentResult = new Payment();
		User tempUser = new User();
		String paymentRespond = "";	
		
		String oriProduct = payment.getPaymentProduct();
		String oriSenderId = payment.getPaymentSender();
		String oriReceiverId = payment.getPaymentReceiver();
		String oriReferenceNum = payment.getPaymentReferenceNum();
		int oriPaymentProductPriceTotal = payment.getPaymentProductPriceTotal();
		int oriPointChargeTotal = payment.getPointChargeTotal();			
		String oriPaymentCode = payment.getPaymentCode();
		String oriMethod = payment.getPaymentMethod();
		int oriPriceTotal = payment.getPaymentPriceTotal();		
		String oriMethodSecond = payment.getPaymentMethodSecond();
		int oriPriceTotalSecond = payment.getPaymentPriceTotalSecond();						
		
		paymentRespond = paymentService.makePayment(payment);
		char ctrlLetter = paymentRespond.charAt(0);
		
		if(ctrlLetter == 'P') {		
			paymentResult.setPaymentNo(paymentRespond);				
		} else if(ctrlLetter == 'E') {
			paymentResult.setPaymentNotice(paymentRespond);			
		}
		
		paymentResult.setPaymentProduct(oriProduct);
		paymentResult.setPaymentSender(oriSenderId);
		paymentResult.setPaymentReceiver(oriReceiverId);
		paymentResult.setPaymentProductPriceTotal(oriPaymentProductPriceTotal);
		paymentResult.setPaymentCode(oriPaymentCode);
		paymentResult.setPaymentReferenceNum(oriReferenceNum);
		paymentResult.setPaymentMethod(oriMethod);
		paymentResult.setPaymentPriceTotal(oriPriceTotal);
		paymentResult.setPointChargeTotal(oriPointChargeTotal);	

		if (oriMethodSecond != null) {
			paymentResult.setPaymentMethodSecond(oriMethodSecond);
			paymentResult.setPaymentPriceTotalSecond(oriPriceTotalSecond);
		} 
		*/
		
		// Session 정보업데이트
		tempUser = userService.getUser( ((User) httpSession.getAttribute("user")).getId() );
		httpSession.removeAttribute("user");
		httpSession.setAttribute("user", tempUser);
		model.addAttribute("payment", payment);
		
		return "forward:/view/payment/resultPayment.jsp";
	}	
	
	@RequestMapping(value = "getPayment", method = RequestMethod.POST)
	public String getPayment(@RequestParam("paymentNo") int paymentNo, Model model) throws Exception {	
		
		Payment payment = paymentService.getPayment(paymentNo);
		model.addAttribute("payment", payment);
		
		return "forward:/view/payment/getPayment.jsp";
	}
	
	@RequestMapping(value = "listPayment", method = RequestMethod.GET)
	public String listPayment(@ModelAttribute("search") Search search, Model model) throws Exception {		
		
		if (search.getCurrentPage() == 0) { 
			search.setCurrentPage(1); 
		}
  
		search.setPageSize(pageSize); 
		search.setSearchItemType("Payment");
  
		Map<String, Object> map = paymentService.listPayment(search); 
		Page resultPage = new Page(search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize);
  
		model.addAttribute("list", map.get("list"));
		model.addAttribute("resultPage",resultPage); 
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
		
}
