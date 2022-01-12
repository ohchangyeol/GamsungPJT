package site.gamsung.service.payment;

import java.util.List;
import java.util.Map;

import site.gamsung.service.common.Search;
import site.gamsung.service.domain.Payment;
import site.gamsung.service.domain.PaymentCode;
import site.gamsung.service.domain.PointTransfer;

public interface PaymentService {
	
	/*
	 *  Point
	 */	

	
	/*
	 *  Payment
	 */	
	public String makePayment(Payment payment) throws Exception;
	
	public void refundPayment(Payment payment) throws Exception;
		
	public Payment getPayment(int paymentNo) throws Exception;
	
	public Map<String, Object> listPayment(Search search) throws Exception;
	
	public List<Payment> listPaymentJSON(Search search) throws Exception;
	
	
	/*
	 *  PaymentCode
	 */
	public void addPaymentCode(PaymentCode paymentCode) throws Exception;		
	
	public void updatePaymentCode(PaymentCode paymentCode) throws Exception;		
	
	public List<PaymentCode> listPaymentCode() throws Exception;	
	
	public PaymentCode getPaymentCodeInfo(String paymentCodeLetter) throws Exception;
	
	/*
	 *  SiteProfit
	 */
	
	
}
