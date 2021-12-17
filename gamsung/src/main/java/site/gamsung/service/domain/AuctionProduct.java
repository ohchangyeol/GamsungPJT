package site.gamsung.service.domain;

import java.sql.Timestamp;
import java.util.List;

public class AuctionProduct {
	private String auctionProductNo;
	private String auctionProductName;
	private String auctionProductDatail;
	private User user;
	private String startBidPrice;
	private int hopefulBidPrice;
	private int bidUnit;
	private Timestamp auctionStartTime;
	private Timestamp auctionEndTime;
	private short bidableGrade;
	private List<String> hashtag;
	private List<String> productImg;
	private int productViewCount;
	private Timestamp productRegDate;
	private String auctionStatus;
	private boolean isConfirm;
	private boolean isTempSave;
	private boolean isDelete;
	

	public String getAuctionProduct() {
		return auctionProductNo;
	}
	public void setAuctionProduct(String auctionProductNo) {
		this.auctionProductNo = auctionProductNo;
	}
	public String getAuctionProductName() {
		return auctionProductName;
	}
	public void setAuctionProductName(String auctionProductName) {
		this.auctionProductName = auctionProductName;
	}
	public String getAuctionProductDatail() {
		return auctionProductDatail;
	}
	public void setAuctionProductDatail(String auctionProductDatail) {
		this.auctionProductDatail = auctionProductDatail;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getStartBidPrice() {
		return startBidPrice;
	}
	public void setStartBidPrice(String startBidPrice) {
		this.startBidPrice = startBidPrice;
	}
	public int getHopefulBidPrice() {
		return hopefulBidPrice;
	}
	public void setHopefulBidPrice(int hopefulBidPrice) {
		this.hopefulBidPrice = hopefulBidPrice;
	}
	public int getBidUnit() {
		return bidUnit;
	}
	public void setBidUnit(int bidUnit) {
		this.bidUnit = bidUnit;
	}
	public Timestamp getAuctionStartTime() {
		return auctionStartTime;
	}
	public void setAuctionStartTime(Timestamp auctionStartTime) {
		this.auctionStartTime = auctionStartTime;
	}
	public Timestamp getAuctionEndTime() {
		return auctionEndTime;
	}
	public void setAuctionEndTime(Timestamp auctionEndTime) {
		this.auctionEndTime = auctionEndTime;
	}
	public short getBidableGrade() {
		return bidableGrade;
	}
	public void setBidableGrade(short bidableGrade) {
		this.bidableGrade = bidableGrade;
	}
	public List<String> getHashtag() {
		return hashtag;
	}
	public void setHashtag(List<String> hashtag) {
		this.hashtag = hashtag;
	}
	public List<String> getProductImg() {
		return productImg;
	}
	public void setProductImg(List<String> productImg) {
		this.productImg = productImg;
	}
	public int getProductViewCount() {
		return productViewCount;
	}
	public void setProductViewCount(int productViewCount) {
		this.productViewCount = productViewCount;
	}
	public Timestamp getProductRegDate() {
		return productRegDate;
	}
	public void setProductRegDate(Timestamp productRegDate) {
		this.productRegDate = productRegDate;
	}
	public boolean isConfirm() {
		return isConfirm;
	}
	public void setConfirm(boolean isConfirm) {
		this.isConfirm = isConfirm;
	}
	public String getAuctionStatus() {
		return auctionStatus;
	}
	public void setAuctionStatus(String auctionStatus) {
		this.auctionStatus = auctionStatus;
	}
	public boolean isTempSave() {
		return isTempSave;
	}
	public void setTempSave(boolean isTempSave) {
		this.isTempSave = isTempSave;
	}
	public boolean isDelete() {
		return isDelete;
	}
	public void setDelete(boolean isDelete) {
		this.isDelete = isDelete;
	}
	
	
}
