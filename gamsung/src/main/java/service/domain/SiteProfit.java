package service.domain;

import java.sql.Date;

public class SiteProfit {
	
	/*
	등록일자
	포인트수익
	현금수익
	신용카드수익
	간편결제수익
	*/

	/// Field
	private Date profitRegDate;
	private int profitPoint;
	private int profitCash;
	private int profitCreditcard;
	private int profitSimplePay;
	
	/// Default Constructor
	public SiteProfit() {
		
	}
	
	/// Getter / Setter	
	public Date getProfitRegDate() {
		return profitRegDate;
	}

	public void setProfitRegDate(Date profitRegDate) {
		this.profitRegDate = profitRegDate;
	}

	public int getProfitPoint() {
		return profitPoint;
	}

	public void setProfitPoint(int profitPoint) {
		this.profitPoint = profitPoint;
	}

	public int getProfitCash() {
		return profitCash;
	}

	public void setProfitCash(int profitCash) {
		this.profitCash = profitCash;
	}

	public int getProfitCreditcard() {
		return profitCreditcard;
	}

	public void setProfitCreditcard(int profitCreditcard) {
		this.profitCreditcard = profitCreditcard;
	}

	public int getProfitSimplePay() {
		return profitSimplePay;
	}

	public void setProfitSimplePay(int profitSimplePay) {
		this.profitSimplePay = profitSimplePay;
	}

	// Override toString
	public String toString() {
		return "\n -- Camp --"
			+ "\n [profitRegDate] : " + profitRegDate
			+ "\n [profitPoint] : " + profitPoint
			+ "\n [profitCash] : " + profitCash
			+ "\n [profitCreditcard] : " + profitCreditcard				
			+ "\n [profitSimplePay] : " + profitSimplePay
			+ "\n ---------------- \n";
	}	

}// end of class
