package site.gamsung.service.domain;

import site.gamsung.service.common.Search;

public class AuctionList {

	private String stringData;
	private User user;
	private AuctionBidInfo auctionBidInfo;
	private AuctionProduct auctionProduct;
	private Search search;
	
	public AuctionList() {
		// TODO Auto-generated constructor stub
	}

	public String getStringdata() {
		return stringData;
	}

	public void setStringData(String stringData) {
		this.stringData = stringData;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public AuctionBidInfo getAuctionBidInfo() {
		return auctionBidInfo;
	}

	public void setAuctionBidInfo(AuctionBidInfo auctionBidInfo) {
		this.auctionBidInfo = auctionBidInfo;
	}

	public AuctionProduct getAuctionProduct() {
		return auctionProduct;
	}

	public void setAuctionProduct(AuctionProduct auctionProduct) {
		this.auctionProduct = auctionProduct;
	}

	public Search getSearch() {
		return search;
	}

	public void setSearch(Search search) {
		this.search = search;
	}

	@Override
	public String toString() {
		return "AuctionList [stringData=" + stringData + ", user=" + user + ", auctionBidInfo=" + auctionBidInfo
				+ ", auctionProduct=" + auctionProduct + ", search=" + search + "]";
	}
	
	
	
}
