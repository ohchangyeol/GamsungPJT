package site.gamsung.service.payment;

import java.util.List;
import java.util.Map;

import site.gamsung.service.common.Search;
import site.gamsung.service.domain.Payment;
import site.gamsung.service.domain.PaymentCode;

public interface PaymentService {
	
	/*
	 *  Point
	 */	
	public int pointCharge(Payment payment);
	
	public int pointWithdraw();
	
	
	/*
	 *  Payment
	 */	
	public void addMakePayment(Payment payment) throws Exception;
	
	public void addRefundPayment(Payment payment) throws Exception;
	
	public List<Payment> getPayment(Payment payment) throws Exception;
	
	public Map<String, Object> listPayment(Search search) throws Exception;
	
	
	/*
	 *  PaymentCode
	 */
	public void addPaymentCode(PaymentCode paymentCode) throws Exception;		
	
	public void updatePaymentCode(PaymentCode paymentCode) throws Exception;		
	
	public List<PaymentCode> listPaymentCode() throws Exception;	
	
	public PaymentCode getPaymentCode(String paymentCodeLetter) throws Exception;
	
	/*
	 *  SiteProfit
	 */
	
	
}
