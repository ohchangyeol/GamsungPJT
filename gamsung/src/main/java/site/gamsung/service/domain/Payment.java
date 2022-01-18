package site.gamsung.service.domain;

import java.util.List;

/*
	=== [ Payment domain ]===	  
  
	String 	paymentMethod						              
		'point' 	- 포인트결제
		'samsung' 	- 삼성페이
		'trans' 	- 실시간계좌이체 
		'vbank' 	- 가상계좌
		'phone' 	- 휴대폰소액결제
	
	
	int paymentStatus
		1			- 포인트이동
		2			- 결제완료
		3			- 환불완료
*/

public class Payment {
	
	/// Field
	private String paymentNo;
	private int paymentStatus;
	private String paymentProduct;	
	private String paymentSender;
	private String paymentReceiver;	
	
	private int paymentProductPriceTotal;	
	private String paymentRegTime;
	private String paymentCode;	
	private String paymentReferenceNum;	
	private int paymentReferenceFee;
	private String impUid;
	
	private String paymentMethod;
	private int paymentPriceTotal;
	private int paymentPricePay;
	private int paymentPriceFee;		
	
	private String paymentMethodSecond;
	private int paymentPriceTotalSecond;
	private int paymentPricePaySecond;
	private int paymentPriceFeeSecond;
	
	private String paymentRefundRegTime;
	private String paymentRefundCode;		
	private String paymentRefundReferenceNum;	
	private int paymentRefundReferenceFee;
	
	private int paymentRefundPriceTotal;
	private int paymentRefundPricePay;
	private int paymentRefundPriceFee;	
	
	private int paymentRefundPriceTotalSecond;
	private int paymentRefundPricePaySecond;
	private int paymentRefundPriceFeeSecond;
	
	private int pointChargeTotal;
	private String paymentNotice;
	
	private List<Payment> paymentList;
	
	/// Default Constructor
	public Payment() {
		
	}
	
	public List<Payment> getPaymentList() {
		return paymentList;
	}

	public void setPaymentList(List<Payment> paymentList) {
		this.paymentList = paymentList;
	}

	/// Getter / Setter	
	public String getPaymentNo() {
		return paymentNo;
	}

	public void setPaymentNo(String paymentNo) {
		this.paymentNo = paymentNo;
	}

	public int getPaymentStatus() {
		return paymentStatus;
	}

	public void setPaymentStatus(int paymentStatus) {
		this.paymentStatus = paymentStatus;
	}

	public String getPaymentProduct() {
		return paymentProduct;
	}

	public void setPaymentProduct(String paymentProduct) {
		this.paymentProduct = paymentProduct;
	}

	public String getPaymentSender() {
		return paymentSender;
	}

	public void setPaymentSender(String paymentSender) {
		this.paymentSender = paymentSender;
	}

	public String getPaymentReceiver() {
		return paymentReceiver;
	}

	public void setPaymentReceiver(String paymentReceiver) {
		this.paymentReceiver = paymentReceiver;
	}

	public int getPaymentProductPriceTotal() {
		return paymentProductPriceTotal;
	}

	public void setPaymentProductPriceTotal(int paymentProductPriceTotal) {
		this.paymentProductPriceTotal = paymentProductPriceTotal;
	}

	public String getPaymentRegTime() {
		return paymentRegTime;
	}

	public void setPaymentRegTime(String paymentRegTime) {
		this.paymentRegTime = paymentRegTime;
	}

	public String getPaymentCode() {
		return paymentCode;
	}

	public void setPaymentCode(String paymentCode) {
		this.paymentCode = paymentCode;
	}

	public String getPaymentReferenceNum() {
		return paymentReferenceNum;
	}

	public void setPaymentReferenceNum(String paymentReferenceNum) {
		this.paymentReferenceNum = paymentReferenceNum;
	}

	public int getPaymentReferenceFee() {
		return paymentReferenceFee;
	}

	public void setPaymentReferenceFee(int paymentReferenceFee) {
		this.paymentReferenceFee = paymentReferenceFee;
	}

	public String getImpUid() {
		return impUid;
	}

	public void setImpUid(String impUid) {
		this.impUid = impUid;
	}

	public String getPaymentMethod() {
		return paymentMethod;
	}

	public void setPaymentMethod(String paymentMethod) {
		this.paymentMethod = paymentMethod;
	}

	public int getPaymentPriceTotal() {
		return paymentPriceTotal;
	}

	public void setPaymentPriceTotal(int paymentPriceTotal) {
		this.paymentPriceTotal = paymentPriceTotal;
	}

	public int getPaymentPricePay() {
		return paymentPricePay;
	}

	public void setPaymentPricePay(int paymentPricePay) {
		this.paymentPricePay = paymentPricePay;
	}

	public int getPaymentPriceFee() {
		return paymentPriceFee;
	}

	public void setPaymentPriceFee(int paymentPriceFee) {
		this.paymentPriceFee = paymentPriceFee;
	}

	public String getPaymentMethodSecond() {
		return paymentMethodSecond;
	}

	public void setPaymentMethodSecond(String paymentMethodSecond) {
		this.paymentMethodSecond = paymentMethodSecond;
	}

	public int getPaymentPriceTotalSecond() {
		return paymentPriceTotalSecond;
	}

	public void setPaymentPriceTotalSecond(int paymentPriceTotalSecond) {
		this.paymentPriceTotalSecond = paymentPriceTotalSecond;
	}

	public int getPaymentPricePaySecond() {
		return paymentPricePaySecond;
	}

	public void setPaymentPricePaySecond(int paymentPricePaySecond) {
		this.paymentPricePaySecond = paymentPricePaySecond;
	}

	public int getPaymentPriceFeeSecond() {
		return paymentPriceFeeSecond;
	}

	public void setPaymentPriceFeeSecond(int paymentPriceFeeSecond) {
		this.paymentPriceFeeSecond = paymentPriceFeeSecond;
	}

	public String getPaymentRefundRegTime() {
		return paymentRefundRegTime;
	}

	public void setPaymentRefundRegTime(String paymentRefundRegTime) {
		this.paymentRefundRegTime = paymentRefundRegTime;
	}

	public String getPaymentRefundCode() {
		return paymentRefundCode;
	}

	public void setPaymentRefundCode(String paymentRefundCode) {
		this.paymentRefundCode = paymentRefundCode;
	}

	public String getPaymentRefundReferenceNum() {
		return paymentRefundReferenceNum;
	}

	public void setPaymentRefundReferenceNum(String paymentRefundReferenceNum) {
		this.paymentRefundReferenceNum = paymentRefundReferenceNum;
	}

	public int getPaymentRefundReferenceFee() {
		return paymentRefundReferenceFee;
	}

	public void setPaymentRefundReferenceFee(int paymentRefundReferenceFee) {
		this.paymentRefundReferenceFee = paymentRefundReferenceFee;
	}

	public int getPaymentRefundPriceTotal() {
		return paymentRefundPriceTotal;
	}

	public void setPaymentRefundPriceTotal(int paymentRefundPriceTotal) {
		this.paymentRefundPriceTotal = paymentRefundPriceTotal;
	}

	public int getPaymentRefundPricePay() {
		return paymentRefundPricePay;
	}

	public void setPaymentRefundPricePay(int paymentRefundPricePay) {
		this.paymentRefundPricePay = paymentRefundPricePay;
	}

	public int getPaymentRefundPriceFee() {
		return paymentRefundPriceFee;
	}

	public void setPaymentRefundPriceFee(int paymentRefundPriceFee) {
		this.paymentRefundPriceFee = paymentRefundPriceFee;
	}

	public int getPaymentRefundPriceTotalSecond() {
		return paymentRefundPriceTotalSecond;
	}

	public void setPaymentRefundPriceTotalSecond(int paymentRefundPriceTotalSecond) {
		this.paymentRefundPriceTotalSecond = paymentRefundPriceTotalSecond;
	}

	public int getPaymentRefundPricePaySecond() {
		return paymentRefundPricePaySecond;
	}

	public void setPaymentRefundPricePaySecond(int paymentRefundPricePaySecond) {
		this.paymentRefundPricePaySecond = paymentRefundPricePaySecond;
	}

	public int getPaymentRefundPriceFeeSecond() {
		return paymentRefundPriceFeeSecond;
	}

	public void setPaymentRefundPriceFeeSecond(int paymentRefundPriceFeeSecond) {
		this.paymentRefundPriceFeeSecond = paymentRefundPriceFeeSecond;
	}

	public int getPointChargeTotal() {
		return pointChargeTotal;
	}

	public void setPointChargeTotal(int pointChargeTotal) {
		this.pointChargeTotal = pointChargeTotal;
	}

	public String getPaymentNotice() {
		return paymentNotice;
	}

	public void setPaymentNotice(String paymentNotice) {
		this.paymentNotice = paymentNotice;
	}

	// Override toString
	public String toString() {
			
		return "\n -- Payment --"
			+ "\n [paymentList] : " + paymentList	
			+ "\n [paymentNo] : " + paymentNo
			+ "\n [paymentStatus] : " + paymentStatus
			+ "\n [paymentProduct] : " + paymentProduct
			+ "\n [paymentSender] : " + paymentSender
			+ "\n [paymentReceiver] : " + paymentReceiver			
			+ "\n [paymentProductPriceTotal] : " + paymentProductPriceTotal
			+ "\n "
			+ "\n [paymentRegTime] : " + paymentRegTime
			+ "\n [paymentCode] : " + paymentCode 
			+ "\n [paymentReferenceNum] : " + paymentReferenceNum 
			+ "\n [paymentReferenceFee] : " + paymentReferenceFee 
			+ "\n [impUid] : " + impUid 
			+ "\n "			
			+ "\n [paymentMethod] : " + paymentMethod		
			+ "\n [paymentPriceTotal] : " + paymentPriceTotal 
			+ "\n [paymentPricePay] : " + paymentPricePay 
			+ "\n [paymentPriceFee] : " + paymentPriceFee 
			+ "\n "
			+ "\n [paymentMethodSecond] : " + paymentMethodSecond	
			+ "\n [paymentPriceTotalSecond] : " + paymentPriceTotalSecond 
			+ "\n [paymentPricePaySecond] : " + paymentPricePaySecond 
			+ "\n [paymentPriceFeeSecond] : " + paymentPriceFeeSecond 
			+ "\n "
			+ "\n [paymentRefundRegTime] : " + paymentRefundRegTime			
			+ "\n [paymentRefundCode] : " + paymentRefundCode	
			+ "\n [paymentRefundReferenceNum] : " + paymentRefundReferenceNum
			+ "\n [paymentRefundReferenceFee] : " + paymentRefundReferenceFee
			+ "\n "
			+ "\n [paymentRefundPriceTotal] : " + paymentRefundPriceTotal 
			+ "\n [paymentRefundPricePay] : " + paymentRefundPricePay
			+ "\n [paymentRefundPriceFee] : " + paymentRefundPriceFee
			+ "\n "
			+ "\n [paymentRefundPriceTotalSecond] : " + paymentRefundPriceTotalSecond 
			+ "\n [paymentRefundPricePaySecond] : " + paymentRefundPricePaySecond
			+ "\n [paymentRefundPriceFeeSecond] : " + paymentRefundPriceFeeSecond
			+ "\n "
			+ "\n [pointChargeTotal] : " + pointChargeTotal	
			+ "\n [paymentNotice] : " + paymentNotice				
			+ "\n ---------------- \n";
	}
	
}// end of class
