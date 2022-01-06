package site.gamsung.service.payment.impl;

import java.time.LocalDateTime;
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
import site.gamsung.service.domain.User;
import site.gamsung.service.payment.PaymentDAO;
import site.gamsung.service.payment.PaymentService;
import site.gamsung.service.user.UserDAO;



@Service("paymentServiceImpl")
public class PaymentServiceImpl implements PaymentService{
	
	///Field
	@Autowired
	@Qualifier("paymentDAOImpl")
	private PaymentDAO paymentDAO;
	
	@Autowired
	@Qualifier("userDAOImpl")
	private UserDAO userDAO;
	
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
		int feeRate = pointTransfer.getFeeRate();		
		int adminFee = pointAmount * feeRate / 100;
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
	public String addMakePayment(Payment payment) throws Exception {
		
		System.out.println("addMakePayment payment : " + payment); 											// 테스트
		
		String paymentCodeLetter = payment.getPaymentCode();
		int paymentReferenceFeeRate = paymentDAO.getPaymentCodeInfo(paymentCodeLetter).getPaymentCodeFee();		   	
		
		// 일반결제 DB저장
		int paymentPriceTotal = payment.getPaymentPriceTotal();		
		int paymentPriceFee = paymentPriceTotal * paymentReferenceFeeRate / 100;
		int paymentPricePay = paymentPriceTotal - paymentPriceFee;
		payment.setPaymentPriceFee(paymentPriceFee);
		payment.setPaymentPricePay(paymentPricePay);
		
		System.out.println("paymentCodeLetter : " + paymentCodeLetter);										// 테스트
		System.out.println("paymentCodeInfo : " + paymentDAO.getPaymentCodeInfo(paymentCodeLetter)); 		
		System.out.println("paymentPriceTotal : " + paymentPriceTotal);										// 테스트
		System.out.println("paymentPricePay : " + paymentPricePay);	
		System.out.println("paymentPriceFee : " + paymentPriceFee);
		
		// 포인트결제 DB저장
		if(payment.getPaymentPriceTotalSecond() != 0) {
			
			int paymentPriceTotalSecond = payment.getPaymentPriceTotalSecond();		
			int paymentPriceFeeSecond = paymentPriceTotalSecond * paymentReferenceFeeRate / 100;
			int paymentPricePaySecond = paymentPriceTotalSecond - paymentPriceFeeSecond;			
			payment.setPaymentPriceFeeSecond(paymentPriceFeeSecond);
			payment.setPaymentPricePaySecond(paymentPricePaySecond);	
			
			System.out.println("paymentPriceTotalSecond : " + paymentPriceTotalSecond);						// 테스트
			System.out.println("paymentPricePaySecond : " + paymentPricePaySecond);	
			System.out.println("paymentPriceFeeSecond : " + paymentPriceFeeSecond);
		}					
		
		System.out.println("payment : " + payment);															// 테스트
		
		return paymentDAO.addMakePayment(payment);		
	}
	
	@Override
	public void addRefundPayment(Payment payment) throws Exception {
		paymentDAO.addRefundPayment(payment);		
	}	
	
	@Override
	public String internalPointPayment(Payment payment) throws Exception {
				
		// 송금자ID
		String oriPaymentProduct = payment.getPaymentProduct();
		
		// 송금자ID
		String oriSenderId = payment.getPaymentSender();
		
		// 수금자Id
		String oriReceiverId = payment.getPaymentReceiver();
		
		// 결제코드유형
		String oriPaymentCode = payment.getPaymentCode();
		
		// 결제코드 전체항목
		PaymentCode oriPaymentCodeInfo = (PaymentCode) getPaymentCodeInfo(payment.getPaymentCode());
				
		// 해당결제코드 수수료율
		int oriPaymentReferenceFee = oriPaymentCodeInfo.getPaymentCodeFee();
		
		// 결제 전체 금액
		int oriPaymentProductPriceTotal = payment.getPaymentProductPriceTotal();
		
		// 결제상품 참조번호
		String oriReferenceNum = payment.getPaymentReferenceNum();
				
		// 포인트결제 총금액
		int oriPriceTotalSecond = payment.getPaymentPriceTotalSecond();	
		
		if(userDAO.getUser(oriSenderId).getHavingPoint() < oriPaymentProductPriceTotal){
			return "ERROR_CODE_IPP01-결제포인트부족";
		}
				
		// 포인트이동 User_DB
		PointTransfer pointTransfer = new PointTransfer();
		pointTransfer.setSenderId(payment.getPaymentSender());
		pointTransfer.setReceiverId(payment.getPaymentReceiver());		
		pointTransfer.setPointAmount(oriPaymentProductPriceTotal);
		pointTransfer.setFeeRate(oriPaymentReferenceFee);
		pointTransferByUsers(pointTransfer);
		
		// 포인트구매내역 Payment_DB 
		Payment movePointHistory = new Payment();
		movePointHistory.setPaymentProduct(oriPaymentProduct);
		movePointHistory.setPaymentSender(oriSenderId);
		movePointHistory.setPaymentReceiver(oriReceiverId);
		movePointHistory.setPaymentProductPriceTotal(oriPriceTotalSecond);
		movePointHistory.setPaymentCode(oriPaymentCode);
		LocalDateTime nowString = LocalDateTime.now();
		movePointHistory.setPaymentReferenceNum(oriReferenceNum+nowString);
		movePointHistory.setPaymentMethodSecond("point");				
		movePointHistory.setPaymentPriceTotalSecond(oriPriceTotalSecond);			
		addMakePayment(movePointHistory);		
		System.out.println("포인트구매내역 DB저장 payment : " + movePointHistory); 			// 테스트
		
		return addMakePayment(movePointHistory);		
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
