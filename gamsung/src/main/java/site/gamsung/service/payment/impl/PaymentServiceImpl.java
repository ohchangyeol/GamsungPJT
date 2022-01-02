package site.gamsung.service.payment.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import site.gamsung.service.common.Search;
import site.gamsung.service.domain.Payment;
import site.gamsung.service.domain.PaymentCode;
import site.gamsung.service.domain.PointTransfer;
import site.gamsung.service.payment.PaymentDAO;
import site.gamsung.service.payment.PaymentService;



@Service("paymentServiceImpl")
public class PaymentServiceImpl implements PaymentService{
	
	///Field
	@Autowired
	@Qualifier("paymentDAOImpl")
	private PaymentDAO paymentDAO;
	
	public void setPaymentDAO(PaymentDAO paymentDAO) {
		this.paymentDAO = paymentDAO;
	}
	
	
	public PaymentServiceImpl() {
		System.out.println(this.getClass());
	}
	
	/*
	 *  Point
	 */	
	public int pointUpdateById(PointTransfer pointTransfer) throws Exception {
		return paymentDAO.pointUpdateById(pointTransfer);
	}
	
	public int pointTransferByUsers(PointTransfer pointTransfer) throws Exception {
		
		int pointAmount = pointTransfer.getPointAmount();
		int fee = pointTransfer.getFeeAmount();		
		int adminFee = pointAmount * fee / 100;
		int pointAmountAfterFee = pointAmount - adminFee;		
	
		PointTransfer senderCase = new PointTransfer();
		senderCase.setUserId(pointTransfer.getSenderId());
		senderCase.setPointAmount(pointAmount * -1);
		
		PointTransfer receiverCase = new PointTransfer();
		receiverCase.setUserId(pointTransfer.getReceiverId());
		receiverCase.setPointAmount(pointAmountAfterFee);
		
		PointTransfer adminCase = new PointTransfer();
		adminCase.setUserId("admin");
		adminCase.setPointAmount(adminFee);				
		
		if(pointUpdateById(senderCase) == 1 
				&& pointUpdateById(receiverCase) == 1
				&& pointUpdateById(adminCase) == 1 ) {
			return 1;
		} else {
			return 0;
		}
	}
	
	
	/*
	 *  Payment
	 */	
	@Override
	public void addMakePayment(Payment payment) throws Exception {
		
		int paymentMethod = payment.getPaymentMethod();
		String paymentCodeLetter = payment.getPaymentCode();
		int paymentReferenceFee = paymentDAO.getPaymentCodeInfo(paymentCodeLetter).getPaymentCodeFee();
		
		int paymentPriceTotal = payment.getPaymentPriceTotal();		
		int paymentPriceFee = paymentPriceTotal * paymentReferenceFee / 100;
		int paymentPricePay = paymentPriceTotal - paymentPriceFee;
				
		// 포인트결제              
		if(paymentMethod == 1) {
			
			//포인트 충전
			if(paymentCodeLetter.equals("P1")) {
				payment.setPaymentSender("pointCharge(PointManager)");
			}									
		}
		
		
		// 현금결제
		if(paymentMethod == 2) {
			
			//포인트 출금
			if(paymentCodeLetter.equals("P2")) {
				payment.setPaymentSender("admin");
				payment.setPaymentReferenceNum("pointWithdraw(PointManager)");
			}	
					
		}
		
		
		// 카드결제
		if(paymentMethod == 3) {
			
		}
		
		
		// 간편결제
		if(paymentMethod == 4) {
			
		}
		
		payment.setPaymentPricePay(paymentPricePay);
		payment.setPaymentPriceFee(paymentPriceFee);
		payment.setPaymentReferenceFee(paymentReferenceFee);
		
		System.out.println("paymentCodeLetter : " + paymentCodeLetter);
		System.out.println("paymentCodeInfo : " + paymentDAO.getPaymentCodeInfo(paymentCodeLetter));
		System.out.println("paymentReferenceFee : " + paymentReferenceFee);
		System.out.println("paymentPriceTotal : " + paymentPriceTotal);
		System.out.println("paymentPriceFee : " + paymentPriceFee);
		System.out.println("paymentPricePay : " + paymentPricePay);						
		System.out.println("payment : " + payment);
		
		paymentDAO.addMakePayment(payment);
		
	}
	
	@Override
	public void addRefundPayment(Payment payment) throws Exception {
		paymentDAO.addRefundPayment(payment);		
	}	
	
	@Override
	public List<Payment> getPayment(Payment payment) throws Exception {
		return paymentDAO.getPayment(payment);		
	}
	
	@Override
	public Map<String, Object> listPayment(Search search) throws Exception {
		List<Payment> list= paymentDAO.listPayment(search);
		int totalCount = paymentDAO.getTotalCount(search);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list );
		map.put("totalCount", new Integer(totalCount));
		
		return map;		
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
	
	@Override
	public PaymentCode getPaymentCodeInfo(String paymentCodeLetter) throws Exception{		
		return paymentDAO.getPaymentCodeInfo(paymentCodeLetter);
	}

	
	/*
	 *  SiteProfit
	 */


}
