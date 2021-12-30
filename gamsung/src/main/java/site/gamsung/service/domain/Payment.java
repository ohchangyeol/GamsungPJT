package site.gamsung.service.domain;

/*
====  결제 / 결제취소 ====

	## 결제 
	1. Payment domain 에 정보 입력
	2. PaymentService > addMakePayment() 메소드에 매개변수로 전달.
	
	[ Payment domain ]
	String 	paymentSender 			: 주는사람 (아이디)
	String 	paymentReceiver 		: 받는사람 (아이디)
	int     paymentMethod 			: 결제방법 [ 1-포인트결제, 2-현금결제, 3-카드결제, 4-간편결제 ] 
	String 	paymentCode 			: 결제코드 [ PaymentCode Domain 설명 참조 ] 
	int     paymentPriceTotal 		: 수수료 계산전 결제금액 원금 
	String 	paymentReferenceNum 	: 결제참조번호 [ 예약번호, 경매번호, 양도양수번호 ]
	
	
	## 결제취소  
	1. Payment domain 에 정보 입력 후 
	2. PaymentService > addRefundPayment() 메소드에 매개변수 전달
	
	[ Payment domain ]
	String  paymentReferenceNum 	 	: 해당결제참조번호 [ 예약번호, 경매번호, 양도양수번호 ]
	String  paymentRefundCode			: 코드 [ PaymentCode Domain 설명 참조 ]
	String  paymentRefundReferenceNum   : 환불참조번호 [ 예약취소번호, 경매취소번호, 양도양수취소번호 ]
	int     paymentRefundPriceTotal    	: 수수료 계산전  환불금액 원금
	
		  
	=== [ Payment domain ]===	  
		
			결제등록번호					String 	paymentNo                  
	(*결제)	주는사람					String 	paymentSender              
	(*결제)	받는사람					String 	paymentReceiver            
	(*결제)	결제방법(paymentMethod)		int 	paymentMethod                 
			1-포인트결제              
			2-현금결제                
			3-카드결제                
			4-간편결제                
	                                  
	 		결제등록일자					String 	paymentRegTime              
	(*결제) 	결제 코드					String 	paymentCode                
	(*결제) 	결제 원금					int 	paymentPriceTotal             
			결제 실 금액				int 	paymentPricePay               
			결제 수수료금액				int 	paymentPriceFee           
	(*결제/*환불)	결제 참조번호			String 	paymentReferenceNum          
			결제 참조수수료율				int 	paymentReferenceFee        
		
	 		환불등록일자					String 	paymentRegTime    
	(*환불) 	환불 코드					String 	paymentRefundCode          
	(*환불) 	환불 원금					int 	paymentRefundPriceTotal     
			환불 실 금액				int 	paymentRefundPricePay         
			환불 수수료금액				int 	paymentRefundPriceFee  
	(*환불)	환불 참조번호				String 	paymentRefundReferenceNum   
			환불 참조수수료율				int 	paymentRefundReferenceFee
*/

public class Payment {
	

	
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
	
	private String paymentRefundRegTime;
	private String paymentRefundCode;
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
		return "\n -- Payment --"
			+ "\n [paymentNo] : " + paymentNo
			+ "\n [paymentSender] : " + paymentSender
			+ "\n [paymentReceiver] : " + paymentReceiver
			+ "\n [paymentMethod] : " + paymentMethod	
			+ "\n "
			+ "\n [paymentRegTime] : " + paymentRegTime			
			+ "\n [paymentCode] : " + paymentCode 
			+ "\n [paymentPriceTotal] : " + paymentPriceTotal 
			+ "\n [paymentPricePay] : " + paymentPricePay 
			+ "\n [paymentPriceFee] : " + paymentPriceFee 
			+ "\n [paymentReferenceNum] : " + paymentReferenceNum 
			+ "\n [paymentReferenceFee] : " + paymentReferenceFee 
			+ "\n "
			+ "\n [paymentRefundRegTime] : " + paymentRefundRegTime			
			+ "\n [paymentRefundCode] : " + paymentRefundCode	
			+ "\n [paymentRefundPriceTotal] : " + paymentRefundPriceTotal 
			+ "\n [paymentRefundPricePay] : " + paymentRefundPricePay
			+ "\n [paymentRefundPriceFee] : " + paymentRefundPriceFee
			+ "\n [paymentRefundReferenceNum] : " + paymentRefundReferenceNum
			+ "\n [paymentRefundReferenceFee] : " + paymentRefundReferenceFee
			+ "\n ---------------- \n";
	}
	
}// end of class
