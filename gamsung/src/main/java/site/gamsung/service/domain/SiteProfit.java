package site.gamsung.service.domain;

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
	private int profitPointCharge;
	private int profitPointPayment;
	private int profitRegularPayment;
	private int profitAllPayment;
	
	
	/// Default Constructor
	public SiteProfit() {
		
	}

	public Date getProfitRegDate() {
		return profitRegDate;
	}

	public void setProfitRegDate(Date profitRegDate) {
		this.profitRegDate = profitRegDate;
	}

	public int getProfitPointCharge() {
		return profitPointCharge;
	}

	public void setProfitPointCharge(int profitPointCharge) {
		this.profitPointCharge = profitPointCharge;
	}

	public int getProfitPointPayment() {
		return profitPointPayment;
	}

	public void setProfitPointPayment(int profitPointPayment) {
		this.profitPointPayment = profitPointPayment;
	}

	public int getProfitRegularPayment() {
		return profitRegularPayment;
	}

	public void setProfitRegularPayment(int profitRegularPayment) {
		this.profitRegularPayment = profitRegularPayment;
	}

	public int getProfitAllPayment() {
		return profitAllPayment;
	}

	public void setProfitAllPayment(int profitAllPayment) {
		this.profitAllPayment = profitAllPayment;
	}

	// Override toString
	public String toString() {
		return "\n -- SiteProfit --"
			+ "\n [profitRegDate] : " + profitRegDate
			+ "\n [profitPointCharge] : " + profitPointCharge
			+ "\n [profitPointPayment] : " + profitPointPayment
			+ "\n [profitRegularPayment] : " + profitRegularPayment				
			+ "\n [profitAllPayment] : " + profitAllPayment
			+ "\n ---------------- \n";
	}	

}// end of class
