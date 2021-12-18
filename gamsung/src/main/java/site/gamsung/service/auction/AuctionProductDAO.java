package site.gamsung.service.auction;

import site.gamsung.service.domain.AuctionProduct;

public interface AuctionProductDAO {
	
	public void addAuctionProduct(AuctionProduct auctionProduct) throws Exception;
	
}
