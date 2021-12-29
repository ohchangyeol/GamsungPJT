package site.gamsung.service.payment.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import site.gamsung.service.domain.PaymentCode;
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

	
	/*
	 *  Point
	 */	
	
	
	
	/*
	 *  Payment
	 */	
	@Override
	public void addMakePayment() throws Exception {
		// TODO Auto-generated method stub
		
	}
	
	
	/*
	 *  PaymentCode
	 */
	@Override
	public void addPaymentCode(PaymentCode paymentCode) throws Exception{
		paymentDAO.addPaymentCode(paymentCode);
	}
	@Override
	
	public void updatePaymentCode(PaymentCode paymentCode) throws Exception{
		paymentDAO.updatePaymentCode(paymentCode);
	}	
	
	@Override
	public List<PaymentCode> listPaymentCode() throws Exception{
		return paymentDAO.listPaymentCode();
	}
		
	
	/*
	 *  SiteProfit
	 */


}
