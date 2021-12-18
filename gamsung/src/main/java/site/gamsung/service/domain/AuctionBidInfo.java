package site.gamsung.service.domain;

import java.sql.Timestamp;

public class AuctionBidInfo {
	private String bidNo;
	private String productNo;
	private String bidderId;
	private Timestamp bidDateTime;
	private String auctionStatus;
	private int bidderGrade;
	
	public String getBidNo() {
		return bidNo;
	}
	public void setBidNo(String bidNo) {
		this.bidNo = bidNo;
	}
	public String getProductNo() {
		return productNo;
	}
	public void setProductNo(String productNo) {
		this.productNo = productNo;
	}
	public String getBidderId() {
		return bidderId;
	}
	public void setBidderId(String bidderId) {
		this.bidderId = bidderId;
	}
	public Timestamp getBidDateTime() {
		return bidDateTime;
	}
	public void setBidDateTime(Timestamp bidDateTime) {
		this.bidDateTime = bidDateTime;
	}
	public String getAuctionStatus() {
		return auctionStatus;
	}
	public void setAuctionStatus(String auctionStatus) {
		this.auctionStatus = auctionStatus;
	}
	public int getBidderGrade() {
		return bidderGrade;
	}
	public void setBidderGrade(int bidderGrade) {
		this.bidderGrade = bidderGrade;
	}
	
	
	
}
