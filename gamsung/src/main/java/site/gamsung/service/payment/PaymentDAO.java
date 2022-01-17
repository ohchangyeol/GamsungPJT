package site.gamsung.service.payment;

import java.util.List;

import site.gamsung.service.common.Search;
import site.gamsung.service.domain.Payment;
import site.gamsung.service.domain.PaymentCode;
import site.gamsung.service.domain.PointTransfer;

public interface PaymentDAO {
	
	/*
	 * Common
	 */	
	public int getTotalCount(Search search) throws Exception;
	
	
	/*
	 *  Point
	 */	
	public int pointUpdateById(PointTransfer pointTransfer) throws Exception;

		
	/*
	 *  Payment
	 */	
	public String addPayment(Payment payment) throws Exception;
	
	public void updateRefundPayment(Payment payment) throws Exception;
	
	public List<Payment> listPayment(Search search) throws Exception;
	
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

}
