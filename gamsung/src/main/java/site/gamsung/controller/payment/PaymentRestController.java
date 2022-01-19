package site.gamsung.controller.payment;

import java.io.IOException;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.siot.IamportRestClient.IamportClient;
import com.siot.IamportRestClient.exception.IamportResponseException;
import com.siot.IamportRestClient.request.CancelData;
import com.siot.IamportRestClient.response.IamportResponse;

import site.gamsung.service.common.Page;
import site.gamsung.service.common.Search;
import site.gamsung.service.domain.Payment;
import site.gamsung.service.domain.User;
import site.gamsung.service.payment.PaymentService;

@Controller
@RequestMapping("/payment/rest/*")
public class PaymentRestController {

	/// Field
	@Autowired
	@Qualifier("paymentServiceImpl")
	private PaymentService paymentService;

	// @Value("#{commonProperties['pageUnit']}")
	@Value("#{commonProperties['pageUnit'] ?: 10}")
	int pageUnit;

	// @Value("#{commonProperties['pageSize']}")
	@Value("#{commonProperties['pageSize'] ?: 5}")
	int pageSize;

	public PaymentRestController() {
		System.out.println(this.getClass());
	}
	
	// REST_API_KEY 와 REST_API_SECRET
	private IamportClient api = new IamportClient("9067791642102125","c7326e3340556f9c50ac1ad4323dfb45daa7b58d5efe2d3d70b722012420a8d60b656b2fccb648d2");
		
	
	// Iamport 결제 검증
	// /payment/rest/verifyIamport/
	@ResponseBody
	@RequestMapping(value="/verifyIamport/{imp_uid}")
	public IamportResponse<com.siot.IamportRestClient.response.Payment> 
				paymentByImpUid(Model model, Locale locale, HttpSession session, @PathVariable(value= "imp_uid") String imp_uid) 
						throws IamportResponseException, IOException {
		
		System.out.println("paymentByImpUid_imp_uid : " + imp_uid);
		
			return api.paymentByImpUid(imp_uid);
	}	
		
	// Iamport 결제 취소
	// /payment/rest/cancleIamport
	@ResponseBody
	@RequestMapping(value="/cancleIamport")
	public IamportResponse<com.siot.IamportRestClient.response.Payment> 
			cancelPaymentByImpUid(@RequestParam(value="uidList[]") List<String> uidList) 
					throws IamportResponseException, IOException {
		
		CancelData oneCancelData = null;
		if(uidList.size() > 0) {
			for(int i=0; i<uidList.size(); i++) {
				 
				 System.out.println("input_uid ["+ i +"]"+ uidList.get(i));
				 oneCancelData = new CancelData(uidList.get(i), true); 
				 return api.cancelPaymentByImpUid(oneCancelData);
				 
			 }	
		} 
		return null;
	}	
	
	@RequestMapping(value = "listPayment")
	private @ResponseBody String listPaymentJSON(HttpSession httpSession) throws Exception {
		
		User tempUser = (User) httpSession.getAttribute("user");				
		Search search = new Search();
		search.setId(tempUser.getId());
		search.setRole(tempUser.getRole());
		
		System.out.println("listPaymentJSON_userId : " + tempUser.getId());	
		System.out.println("listPaymentJSON_role : " + tempUser.getRole());	
				
		List<Payment> paymentList = paymentService.listPaymentJSON(search);
		Gson data = new GsonBuilder().serializeNulls().create();
		
		return data.toJson(paymentList);

	}

}
