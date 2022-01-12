package site.gamsung.service.domain;

public class AuctionInfo {
	private String info;
	private String bidNo;
	private int bidderCount;
	private int bidderRank;
	private String auctionProductNo;
	private User user; //id, nickname, auctionGrade
	private int bidPrice;
	private int realTimeViewCount;
	private String bidDateTime;
	private String concernRegDate;
	private String auctionStatus;
	private int addProductCount;
	private int bidCount;
	private int successfulBidCount;
	private int auctionConfirmCount;
	private int auctionFailCount;
	private int midwayWithdrawalCount;
	private int cancelSuccessfulBidCount;
	private int topRankCount;
	private int addReviewCount;
	
	public String getBidNo() {
		return bidNo;
	}
	public void setBidNo(String bidNo) {
		this.bidNo = bidNo;
	}
	public int getBidderCount() {
		return bidderCount;
	}
	public void setBidderCount(int bidderCount) {
		this.bidderCount = bidderCount;
	}
	public int getBidderRank() {
		return bidderRank;
	}
	public void setBidderRank(int bidderRank) {
		this.bidderRank = bidderRank;
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
	public int getRealTimeViewCount() {
		return realTimeViewCount;
	}
	public void setRealTimeViewCount(int realTimeViewCount) {
		this.realTimeViewCount = realTimeViewCount;
	}
	public String getBidDateTime() {
		return bidDateTime;
	}
	public void setBidDateTime(String bidDateTime) {
		this.bidDateTime = bidDateTime;
	}
	public String getConcernRegDate() {
		return concernRegDate;
	}
	public void setConcernRegDate(String concernRegDate) {
		this.concernRegDate = concernRegDate;
	}
	public String getAuctionStatus() {
		return auctionStatus;
	}
	public void setAuctionStatus(String auctionStatus) {
		this.auctionStatus = auctionStatus;
	}
	public int getAddProductCount() {
		return addProductCount;
	}
	public void setAddProductCount(int addProductCount) {
		this.addProductCount = addProductCount;
	}
	public int getBidCount() {
		return bidCount;
	}
	public void setBidCount(int bidCount) {
		this.bidCount = bidCount;
	}
	public int getSuccessfulBidCount() {
		return successfulBidCount;
	}
	public void setSuccessfulBidCount(int successfulBidCount) {
		this.successfulBidCount = successfulBidCount;
	}
	public int getAuctionFailCount() {
		return auctionFailCount;
	}
	public void setAuctionFailCount(int auctionFailCount) {
		this.auctionFailCount = auctionFailCount;
	}
	public int getAuctionConfirmCount() {
		return auctionConfirmCount;
	}
	public void setAuctionConfirmCount(int auctionConfirmCount) {
		this.auctionConfirmCount = auctionConfirmCount;
	}
	public int getMidwayWithdrawalCount() {
		return midwayWithdrawalCount;
	}
	public void setMidwayWithdrawalCount(int midwayWithdrawalCount) {
		this.midwayWithdrawalCount = midwayWithdrawalCount;
	}
	public int getCancelSuccessfulBidCount() {
		return cancelSuccessfulBidCount;
	}
	public void setCancelSuccessfulBidCount(int cancelSuccessfulBidCount) {
		this.cancelSuccessfulBidCount = cancelSuccessfulBidCount;
	}
	public int getTopRankCount() {
		return topRankCount;
	}
	public void setTopRankCount(int topRankCount) {
		this.topRankCount = topRankCount;
	}
	public int getAddReviewCount() {
		return addReviewCount;
	}
	public void setAddReviewCount(int addReviewCount) {
		this.addReviewCount = addReviewCount;
	}
	public String getInfo() {
		return info;
	}
	public void setInfo(String info) {
		this.info = info;
	}
	@Override
	public String toString() {
		return "AuctionInfo [info=" + info + ", bidNo=" + bidNo + ", bidderCount=" + bidderCount + ", bidderRank="
				+ bidderRank + ", auctionProductNo=" + auctionProductNo + ", user=" + user + ", bidPrice=" + bidPrice
				+ ", realTimeViewCount=" + realTimeViewCount + ", bidDateTime=" + bidDateTime + ", concernRegDate="
				+ concernRegDate + ", auctionStatus=" + auctionStatus + ", addProductCount=" + addProductCount
				+ ", bidCount=" + bidCount + ", successfulBidCount=" + successfulBidCount + ", auctionConfirmCount="
				+ auctionConfirmCount + ", auctionFailCount=" + auctionFailCount + ", midwayWithdrawalCount="
				+ midwayWithdrawalCount + ", cancelSuccessfulBidCount=" + cancelSuccessfulBidCount + ", topRankCount="
				+ topRankCount + ", addReviewCount=" + addReviewCount + "]";
	}
}
