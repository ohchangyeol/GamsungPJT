package site.gamsung.service.domain;

import java.sql.Timestamp;

public class AuctionBidInfo {
	private String bidNo;
	private String auctionProductNo;
	//id, nickname, auctionGrade
	private User user;
	private int bidPrice;
	private Timestamp bidDateTime;
	private String auctionStatus;
	
	public String getBidNo() {
		return bidNo;
	}
	public void setBidNo(String bidNo) {
		this.bidNo = bidNo;
	}
	public String getAuctionProductNo() {
		return auctionProductNo;
	}
	public void setAuctionProductNo(String auctionProductNo) {
		this.auctionProductNo = auctionProductNo;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	
	public int getBidPrice() {
		return bidPrice;
	}
	public void setBidPrice(int bidPrice) {
		this.bidPrice = bidPrice;
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
	@Override
	public String toString() {
		return "AuctionBidInfo [bidNo=" + bidNo + ", auctionProductNo=" + auctionProductNo + ", user=" + user
				+ ", bidPrice=" + bidPrice + ", bidDateTime=" + bidDateTime + ", auctionStatus=" + auctionStatus + "]";
	}
	
	
	
	
}
