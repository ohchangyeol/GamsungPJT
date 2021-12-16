package service.domain;

public class PaymentCode {
	
	/*
	결제코드 등록번호
	결제코드
	구간시작값
	구간종료값
	결제유형 설명
	결제유형 수수료율
	*/
	
	/// Field
	private int paymentCodeNo;
	private String paymentCode;
	private int paymentCodeRangeStart;
	private int paymentCodeRangeEnd;
	private String paymentCodeInfo;
	private int paymentCodeFee;
	
	/// Default Constructor
	public PaymentCode() {
		
	}
	
	/// Getter / Setter	
	public int getPaymentCodeNo() {
		return paymentCodeNo;
	}

	public void setPaymentCodeNo(int paymentCodeNo) {
		this.paymentCodeNo = paymentCodeNo;
	}

	public String getPaymentCode() {
		return paymentCode;
	}

	public void setPaymentCode(String paymentCode) {
		this.paymentCode = paymentCode;
	}

	public int getPaymentCodeRangeStart() {
		return paymentCodeRangeStart;
	}

	public void setPaymentCodeRangeStart(int paymentCodeRangeStart) {
		this.paymentCodeRangeStart = paymentCodeRangeStart;
	}

	public int getPaymentCodeRangeEnd() {
		return paymentCodeRangeEnd;
	}

	public void setPaymentCodeRangeEnd(int paymentCodeRangeEnd) {
		this.paymentCodeRangeEnd = paymentCodeRangeEnd;
	}

	public String getPaymentCodeInfo() {
		return paymentCodeInfo;
	}

	public void setPaymentCodeInfo(String paymentCodeInfo) {
		this.paymentCodeInfo = paymentCodeInfo;
	}

	public int getPaymentCodeFee() {
		return paymentCodeFee;
	}

	public void setPaymentCodeFee(int paymentCodeFee) {
		this.paymentCodeFee = paymentCodeFee;
	}

	// Override toString
	public String toString() {
		return "\n -- Camp --"
			+ "\n [paymentCodeNo] : " + paymentCodeNo
			+ "\n [paymentCode] : " + paymentCode
			+ "\n [paymentCodeRangeStart] : " + paymentCodeRangeStart
			+ "\n [paymentCodeRangeEnd] : " + paymentCodeRangeEnd				
			+ "\n [paymentCodeInfo] : " + paymentCodeInfo
			+ "\n [paymentCodeFee] : " + paymentCodeFee
			+ "\n ---------------- \n";
	}
	
}// end of class
