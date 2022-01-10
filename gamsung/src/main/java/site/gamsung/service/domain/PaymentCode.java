package site.gamsung.service.domain;

/*
 
	 === [ PaymentCode Data ]===  
	  
	결제코드	구간시작값	구간종료값	설명						수수료
	 P0 	0 		0 		포인트 관리자 				0
	 P1 	0 		0  		포인트 충전 	 			0
	 P2 	0  		0  		포인트 출금 	 			20
	 R0 	0  		0  		캠핑 관리자  				0
	 R1 	0  		0  		캠핑 예약  					8
	 R2 	2  		2  		캠핑 예약환불 2일전  			50
	 R3 	3  		3  		캠핑 예약환불 3일전 			60
	 R4 	4  		4  		캠핑 예약환불 4일전 			70
	 R5 	5  		5  		캠핑 예약환불 5일전 			80
	 R6 	6  		6  		캠핑 예약환불 6일전 			90
	 R7 	7  		7  		캠핑 예약환불 7일전 			100
	 A0 	0  		0  		경매 관리자 				0
	 A1 	100  	0  		경매 낙찰취소/중도철회 A등급 		1
	 A2 	60  	99  	경매 낙찰취소/중도철회 B등급 		2
	 A3 	30  	59  	경매 낙찰취소/중도철회 C등급 		3
	 A4 	10  	29  	경매 낙찰취소/중도철회 D등급 		4
	 A5 	1  		9  		경매 낙찰취소/중도철회 E등급 		5
	 T0 	0  		0  		양도양수 관리자 				0
	 T1 	0  		0  		양도양수 					0
	
	
	=== [ PaymentCode domain ]===  
	
	(*필수) 	결제코드           String paymentCode;       
			구간시작값         	int paymentCodeRangeStart;
			구간종료값         	int paymentCodeRangeEnd;  
	(*필수) 	결제유형 설명      	String paymentCodeInfo;   
	(*필수) 	결제유형 수수료율  	int paymentCodeFee;       

*/

public class PaymentCode {
	
	/// Field
	private int paymentCodeRegNum;
	private String paymentCode;
	private int paymentCodeRangeStart;
	private int paymentCodeRangeEnd;
	private String paymentCodeInfo;
	private int paymentCodeFee;
	
	/// Default Constructor
	public PaymentCode() {
		
	}
	
	/// Getter / Setter
	public int getPaymentCodeRegNum() {
		return paymentCodeRegNum;
	}

	public void setPaymentCodeRegNum(int paymentCodeRegNum) {
		this.paymentCodeRegNum = paymentCodeRegNum;
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
		return "\n -- PaymentCode --"
			+ "\n [paymentCodeRegNum] : " + paymentCodeRegNum	
			+ "\n [paymentCode] : " + paymentCode
			+ "\n [paymentCodeRangeStart] : " + paymentCodeRangeStart
			+ "\n [paymentCodeRangeEnd] : " + paymentCodeRangeEnd				
			+ "\n [paymentCodeInfo] : " + paymentCodeInfo
			+ "\n [paymentCodeFee] : " + paymentCodeFee
			+ "\n ---------------- \n";
	}
	
}// end of class
