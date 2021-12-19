package site.gamsung.service.auction;

import java.util.List;

import site.gamsung.service.domain.AuctionProduct;
import site.gamsung.service.domain.AuctionSearch;

public interface AuctionProductService {

	public List<AuctionProduct> listAuctionProduct(AuctionSearch auctionSearch);
	
	public AuctionProduct getAuctionProduct(String auctionProductNo);
	
}
