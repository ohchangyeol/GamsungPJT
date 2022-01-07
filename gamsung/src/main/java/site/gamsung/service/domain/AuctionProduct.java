package site.gamsung.service.domain;

public class AuctionProduct {
	private String auctionProductNo;
	private String auctionProductName;
	private String auctionProductDetail;
	private String auctionProductSubDetail;
	private String registrantId;
	private String registrantNickName;
	private String successfulBidderId;
	private int startBidPrice;
	private int hopefulBidPrice;
	private int bidUnit;
	private int currentBidPrice;
	private String auctionStartTime;
	private String auctionEndTime;
	private String remainAuctionTime;
	private int bidableGrade;
	private String allhashtag;
	private String hashtag1;
	private String hashtag2;
	private String hashtag3;
	private String productImg1;
	private String productImg2;
	private String productImg3;
	private String productImg4;
	private String productImg5;
	private int productViewCount;
	private int bidderCount;
	private String productRegDate;
	private String auctionStatus;
	private String isConfirm;
	private String isTempSave;
	private String isDelete;
	public String getAuctionProductNo() {
		return auctionProductNo;
	}
	public void setAuctionProductNo(String auctionProductNo) {
		this.auctionProductNo = auctionProductNo;
	}
	public String getAuctionProductName() {
		return auctionProductName;
	}
	public void setAuctionProductName(String auctionProductName) {
		this.auctionProductName = auctionProductName;
	}
	public String getAuctionProductDetail() {
		return auctionProductDetail;
	}
	public void setAuctionProductDetail(String auctionProductDetail) {
		if(auctionProductDetail != null) {
			this.auctionProductDetail = auctionProductDetail.trim();
		}else {
			this.auctionProductDetail = auctionProductDetail;
		}
	}
	public String getAuctionProductSubDetail() {
		return auctionProductSubDetail;
	}
	public void setAuctionProductSubDetail(String auctionProductSubDetail) {
		this.auctionProductSubDetail = auctionProductSubDetail;
	}
	public String getRegistrantId() {
		return registrantId;
	}
	public void setRegistrantId(String registrantId) {
		this.registrantId = registrantId;
	}
	public String getRegistrantNickName() {
		return registrantNickName;
	}
	public void setRegistrantNickName(String registrantNickName) {
		this.registrantNickName = registrantNickName;
	}
	public String getSuccessfulBidderId() {
		return successfulBidderId;
	}
	public void setSuccessfulBidderId(String successfulBidderId) {
		this.successfulBidderId = successfulBidderId;
	}
	public int getStartBidPrice() {
		return startBidPrice;
	}
	public void setStartBidPrice(int startBidPrice) {
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
	public int getCurrentBidPrice() {
		return currentBidPrice;
	}
	public void setCurrentBidPrice(int currentBidPrice) {
		this.currentBidPrice = currentBidPrice;
	}
	public String getAuctionStartTime() {
		return auctionStartTime;
	}
	public void setAuctionStartTime(String auctionStartTime) {
		this.auctionStartTime = auctionStartTime;
	}
	public String getAuctionEndTime() {
		return auctionEndTime;
	}
	public void setAuctionEndTime(String auctionEndTime) {
		this.auctionEndTime = auctionEndTime;
	}
	public String getRemainAuctionTime() {
		return remainAuctionTime;
	}
	public void setRemainAuctionTime(String remainAuctionTime) {
		this.remainAuctionTime = remainAuctionTime;
	}
	public int getBidableGrade() {
		return bidableGrade;
	}
	public void setBidableGrade(int bidableGrade) {
		this.bidableGrade = bidableGrade;
	}
	public String getAllhashtag() {
		return allhashtag;
	}
	public void setAllhashtag(String allhashtag) {
		this.allhashtag = allhashtag;
	}
	public String getHashtag1() {
		return hashtag1;
	}
	public void setHashtag1(String hashtag1) {
		if(hashtag1 != null) {
			this.hashtag1 = hashtag1.trim();
		}else {
			this.hashtag1 = hashtag1;			
		}
	}
	public String getHashtag2() {
		return hashtag2;
	}
	public void setHashtag2(String hashtag2) {
		if(hashtag2 != null) {
			this.hashtag2 = hashtag2.trim();
		}else {
			this.hashtag2 = hashtag2;			
		}
	}
	public String getHashtag3() {
		return hashtag3;
	}
	public void setHashtag3(String hashtag3) {
		if(hashtag3 != null) {
			this.hashtag3 = hashtag3.trim();
		}else {
			this.hashtag3 = hashtag3;			
		}
	}
	public String getProductImg1() {
		return productImg1;
	}
	public void setProductImg1(String productImg1) {
		this.productImg1 = productImg1;
	}
	public String getProductImg2() {
		return productImg2;
	}
	public void setProductImg2(String productImg2) {
		this.productImg2 = productImg2;
	}
	public String getProductImg3() {
		return productImg3;
	}
	public void setProductImg3(String productImg3) {
		this.productImg3 = productImg3;
	}
	public String getProductImg4() {
		return productImg4;
	}
	public void setProductImg4(String productImg4) {
		this.productImg4 = productImg4;
	}
	public String getProductImg5() {
		return productImg5;
	}
	public void setProductImg5(String productImg5) {
		this.productImg5 = productImg5;
	}
	public int getProductViewCount() {
		return productViewCount;
	}
	public void setProductViewCount(int productViewCount) {
		this.productViewCount = productViewCount;
	}
	public int getBidderCount() {
		return bidderCount;
	}
	public void setBidderCount(int bidderCount) {
		this.bidderCount = bidderCount;
	}
	public String getProductRegDate() {
		return productRegDate;
	}
	public void setProductRegDate(String productRegDate) {
		this.productRegDate = productRegDate;
	}
	public String getAuctionStatus() {
		return auctionStatus;
	}
	public void setAuctionStatus(String auctionStatus) {
		this.auctionStatus = auctionStatus;
	}
	public String getIsConfirm() {
		return isConfirm;
	}
	public void setIsConfirm(String isConfirm) {
		this.isConfirm = isConfirm;
	}
	public String getIsTempSave() {
		return isTempSave;
	}
	public void setIsTempSave(String isTempSave) {
		this.isTempSave = isTempSave;
	}
	public String getIsDelete() {
		return isDelete;
	}
	public void setIsDelete(String isDelete) {
		this.isDelete = isDelete;
	}
	@Override
	public String toString() {
		return "AuctionProduct [auctionProductNo=" + auctionProductNo + ", auctionProductName=" + auctionProductName
				+ ", auctionProductDetail=" + auctionProductDetail + ", auctionProductSubDetail="
				+ auctionProductSubDetail + ", registrantId=" + registrantId + ", successfulBidderId="
				+ successfulBidderId + ", startBidPrice=" + startBidPrice + ", hopefulBidPrice=" + hopefulBidPrice
				+ ", bidUnit=" + bidUnit + ", currentBidPrice=" + currentBidPrice + ", auctionStartTime="
				+ auctionStartTime + ", auctionEndTime=" + auctionEndTime + ", remainAuctionTime=" + remainAuctionTime
				+ ", bidableGrade=" + bidableGrade + ", allhashtag=" + allhashtag + ", hashtag1=" + hashtag1
				+ ", hashtag2=" + hashtag2 + ", hashtag3=" + hashtag3 + ", productImg1=" + productImg1
				+ ", productImg2=" + productImg2 + ", productImg3=" + productImg3 + ", productImg4=" + productImg4
				+ ", productImg5=" + productImg5 + ", productViewCount=" + productViewCount + ", bidderCount="
				+ bidderCount + ", productRegDate=" + productRegDate + ", auctionStatus=" + auctionStatus
				+ ", isConfirm=" + isConfirm + ", isTempSave=" + isTempSave + ", isDelete=" + isDelete + "]";
	}
}
