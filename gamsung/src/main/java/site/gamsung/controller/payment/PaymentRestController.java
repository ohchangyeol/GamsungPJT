package site.gamsung.controller.payment;

import java.io.IOException;
import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.siot.IamportRestClient.IamportClient;
import com.siot.IamportRestClient.exception.IamportResponseException;
import com.siot.IamportRestClient.response.IamportResponse;

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
	@ResponseBody
	@RequestMapping(value="/verifyIamport/{imp_uid}")
	public IamportResponse<com.siot.IamportRestClient.response.Payment> paymentByImpUid(
			Model model, Locale locale, HttpSession session, 
			@PathVariable(value= "imp_uid") String imp_uid) throws IamportResponseException, IOException {
		
			return api.paymentByImpUid(imp_uid);
	}

}
