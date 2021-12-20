package site.gamsung.service.auction;

import java.util.List;

import site.gamsung.service.common.Search;
import site.gamsung.service.domain.AuctionProduct;

public interface AuctionProductService {

	public List<AuctionProduct> listAuctionProduct(Search search);
	
	public AuctionProduct getAuctionProduct(String auctionProductNo);
	
}
