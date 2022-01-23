package site.gamsung.service.payment;

import java.sql.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import site.gamsung.service.common.Search;
import site.gamsung.service.domain.Payment;
import site.gamsung.service.domain.PaymentCode;
import site.gamsung.service.domain.PointTransfer;
import site.gamsung.service.domain.SiteProfit;

public interface PaymentService {
	
	/*
	 *  Point
	 */	
	public int pointUpdateById(PointTransfer pointTransfer) throws Exception;
	
	public int pointTransferByUsers(PointTransfer pointTransfer) throws Exception;
	
	
	/*
	 *  Payment
	 */	
	public String makePayment(Payment payment) throws Exception;
	
	public void refundPayment(Payment payment) throws Exception;
	
	public List<Payment> listPaymentJSON(Search search) throws Exception;
	
	public Payment getPaymentInfo(String paymentNo) throws Exception;
	
	public List<Payment> getPaymentListByRsvNo(String reservationNo) throws Exception;
	
	
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
	public SiteProfit listSiteProfit(String targetDay) throws Exception;
		
	public void calculateSiteProfit() throws Exception;
}
