package site.gamsung.service.payment.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import site.gamsung.service.payment.PaymentDAO;
import site.gamsung.service.payment.PaymentService;

@Service("paymentServiceImpl")
public class PaymentServiceImpl implements PaymentService{
	
	///Field
	@Autowired
	@Qualifier("paymentDAOImpl")
	private PaymentDAO paymentDAO;
	
	public void setPaymentDAO(PaymentDAO campBusinessDAO) {
		this.paymentDAO = paymentDAO;
	}
	
	public PaymentServiceImpl() {
		System.out.println(this.getClass());
	}

	@Override
	public void addMakePayment() throws Exception {
		// TODO Auto-generated method stub
		
	}

}
