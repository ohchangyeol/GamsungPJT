package site.gamsung.controller.payment;

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

import site.gamsung.service.common.Page;
import site.gamsung.service.common.Search;
import site.gamsung.service.domain.Camp;
import site.gamsung.service.domain.PaymentCode;
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
	public String managePoint(HttpSession httpSession, Model model) throws Exception {
		
		/////////////////////////////////////////////////////////////////////// Session 완료시 삭제
		User tempSessionUser = new User();
		
		tempSessionUser.setId("businessuser1@gamsung.com"); // TS -3 저장
		//tempSessionUser.setId("businessuser6@gamsung.com"); // TS -2 임시저장
		//tempSessionUser.setId("businessuser9@gamsung.com"); // TS -1 발급 완료
		//tempSessionUser.setId("businessuser11@gamsung.com");  // TS -0 발급 미완료
		//tempSessionUser.setId("admin");					  // admin
		
		httpSession.setAttribute("user", tempSessionUser);
		System.out.println("tempSessionUser : " + tempSessionUser);
		/////////////////////////////////////////////////////////////////////// 여기까지 삭제
		
		User tempUser = null;

		if (httpSession != null) {
			
			// user 전체정보요청
			tempUser = userService.getUser(((User) httpSession.getAttribute("user")).getId());
			System.out.println("campSession tempUser : " + tempUser); // 테스트
			
			if (tempUser != null) {
				model.addAttribute("user", tempUser);
			} 
			
		} else {
			return "redirect:/main.jsp";
		}
					
		return "forward:/view/payment/managePoint.jsp";
	}

	
	/*
	 *  Payment
	 */	
	@RequestMapping(value = "addMakePayment", method = RequestMethod.POST)
	public String addMakePayment() throws Exception {
		return "forward:/view/payment/addMakePayment.jsp";
	}
	
	@RequestMapping(value = "addRefundPayment", method = RequestMethod.POST)
	public String addRefundPayment() throws Exception {
		return "forward:/view/payment/addRefundPayment.jsp";
	}
	
	@RequestMapping(value = "getPayment", method = RequestMethod.POST)
	public String getPayment() throws Exception {	
		return "forward:/view/payment/getPayment.jsp";
	}
	
	@RequestMapping(value = "listPayment", method = RequestMethod.POST)
	public String listPayment() throws Exception {
		return "forward:/view/payment/listPayment.jsp";
	}
		
	
	/*
	 *  Payment Code
	 */
	@RequestMapping(value = "addPaymentCode", method = RequestMethod.POST)
	public String addPaymentCode(@ModelAttribute("paymentCode") PaymentCode paymentCode) throws Exception {	
		System.out.println("222222222222 : " + paymentCode);
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
	 *  Site Profit
	 */
	@RequestMapping(value = "addSiteProfit", method = RequestMethod.POST)
	public String addSiteProfit() throws Exception {	
		return "forward:/view/payment/addSiteProfit.jsp";
	}
	
	@RequestMapping(value = "listSiteProfit", method = RequestMethod.POST)
	public String listSiteProfit() throws Exception {
		return "forward:/view/payment/listSiteProfit.jsp";
	}
	
	

}
