package site.gamsung.controller.payment;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;

import site.gamsung.service.payment.PaymentService;

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

}
