package site.gamsung.service.payment;

import java.util.List;
import java.util.Map;

import site.gamsung.service.domain.PaymentCode;

public interface PaymentService {
	
	/*
	 *  Point
	 */	
	
	
	
	/*
	 *  Payment
	 */	
	public void addMakePayment() throws Exception;
	
	
	/*
	 *  PaymentCode
	 */
	public void addPaymentCode(PaymentCode paymentCode) throws Exception;		
	
	public void updatePaymentCode(PaymentCode paymentCode) throws Exception;		
	
	public List<PaymentCode> listPaymentCode() throws Exception;	
	
	
	/*
	 *  SiteProfit
	 */
	
	
}
