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
	(*결제)	결제상품              			String 	paymentProduct;
	(*결제)	주는사람						String 	paymentSender              
	(*결제)	받는사람						String 	paymentReceiver              
	(*결제)	결제방법						String 	paymentMethod                 
			'point' 	- 포인트결제
			'samsung' 	- 삼성페이
			'trans' 	- 실시간계좌이체 
			'vbank' 	- 가상계좌
			'phone' 	- 휴대폰소액결제		     
			           
	(*결제) 	결제 코드						String 	paymentCode                                   
	 		결제등록일자					String 	paymentRegTime                           
	(*결제) 	결제 원금						int 	paymentPriceTotal             
			결제 실 금액					int 	paymentPricePay               
			결제 수수료금액					int 	paymentPriceFee           
	(*결제/*환불)	결제 참조번호				String 	paymentReferenceNum          
			결제 참조수수료율					int 	paymentReferenceFee 
			       
	(*환불) 	환불 코드						String 	paymentRefundCode 	
	 		환불등록일자					String 	paymentRefundRegTime             
	(*환불) 	환불 원금						int 	paymentRefundPriceTotal     
			환불 실 금액					int 	paymentRefundPricePay         
			환불 수수료금액					int 	paymentRefundPriceFee  
	(*환불)	환불 참조번호					String 	paymentRefundReferenceNum   
			환불 참조수수료율					int 	paymentRefundReferenceFee
			
	(*충전)	충전하는 포인트가액				int 	pointChargeTotal
*/

public class Payment {
	
	/// Field
	private String paymentNo;
	private String paymentProduct;	
	private String paymentSender;
	private String paymentReceiver;	
	
	private int paymentProductPriceTotal;	
	private String paymentRegTime;
	private String paymentCode;	
	private String paymentReferenceNum;	
	private int paymentReferenceFee;
	
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
			+ "\n [paymentNo] : " + paymentNo
			+ "\n [paymentProduct] : " + paymentProduct
			+ "\n [paymentSender] : " + paymentSender
			+ "\n [paymentReceiver] : " + paymentReceiver			
			+ "\n [paymentProductPriceTotal] : " + paymentProductPriceTotal
			+ "\n "
			+ "\n [paymentRegTime] : " + paymentRegTime
			+ "\n [paymentCode] : " + paymentCode 
			+ "\n [paymentReferenceNum] : " + paymentReferenceNum 
			+ "\n [paymentReferenceFee] : " + paymentReferenceFee 
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
