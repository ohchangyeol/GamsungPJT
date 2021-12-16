package service.domain;

public class Payment {
	
	/*
	결제등록번호
	주는사람
	받는사람
	결제방법(paymentMethod)
		1-포인트결제
		2-현금결제
		3-카드결제
		4-간편결제

	결제등록일자
	결제 코드
	결제 원금
	결제 실 금액
	결제 수수료금액
	결제 참조번호
	결제 참조수수료율
	환불 원금
	환불 실 금액
	환불 수수료금액
	환불 참조번호
	환불 참조수수료율
	*/
	
	/// Field
	private String paymentNo;
	private String paymentSender;
	private String paymentReceiver;
	private int paymentMethod;
	private String paymentRegTime;
	private String paymentCode;
	private int paymentPriceTotal;
	private int paymentPricePay;
	private int paymentPriceFee;
	private String paymentReferenceNum;
	private int paymentReferenceFee;
	private int paymentRefundPriceTotal;
	private int paymentRefundPricePay;
	private int paymentRefundPriceFee;
	private String paymentRefundReferenceNum;
	private int paymentRefundReferenceFee;

	
	/// Default Constructor
	public Payment() {
		
	}
	
	/// Getter / Setter	
	public String getPaymentNo() {
		return paymentNo;
	}

	public void setPaymentNo(String paymentNo) {
		this.paymentNo = paymentNo;
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

	public int getPaymentMethod() {
		return paymentMethod;
	}

	public void setPaymentMethod(int paymentMethod) {
		this.paymentMethod = paymentMethod;
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

	// Override toString
	public String toString() {
		return "\n -- Camp --"
			+ "\n [paymentNo] : " + paymentNo
			+ "\n [paymentSender] : " + paymentSender
			+ "\n [paymentReceiver] : " + paymentReceiver
			+ "\n [paymentMethod] : " + paymentMethod				
			+ "\n [paymentRegTime] : " + paymentRegTime
			+ "\n [paymentCode] : " + paymentCode 
			+ "\n [paymentPriceTotal] : " + paymentPriceTotal 
			+ "\n [paymentPricePay] : " + paymentPricePay 
			+ "\n [paymentPriceFee] : " + paymentPriceFee 
			+ "\n [paymentReferenceNum] : " + paymentReferenceNum 
			+ "\n [paymentReferenceFee] : " + paymentReferenceFee 
			+ "\n [paymentRefundPriceTotal] : " + paymentRefundPriceTotal 
			+ "\n [paymentRefundPricePay] : " + paymentRefundPricePay
			+ "\n [paymentRefundPriceFee] :" + paymentRefundPriceFee
			+ "\n [paymentRefundReferenceNum] : " + paymentRefundReferenceNum
			+ "\n [paymentRefundReferenceFee] : " + paymentRefundReferenceFee
			+ "\n ---------------- \n";
	}	
	
}// end of class
