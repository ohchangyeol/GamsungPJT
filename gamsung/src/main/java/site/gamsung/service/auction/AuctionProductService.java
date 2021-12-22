package site.gamsung.service.auction;

import java.util.List;

import site.gamsung.service.common.Search;
import site.gamsung.service.domain.AuctionBidInfo;
import site.gamsung.service.domain.AuctionProduct;

public interface AuctionProductService {

	public List<AuctionProduct> listAuctionProduct(Search search);
	
	public AuctionProduct getAuctionProduct(String auctionProductNo);
	
	public AuctionProduct getTempSaveAuctionProduct(String registrantId);
	
	public void tempSaveAuctionProduct(AuctionProduct auctionProduct);
	
	public void addAuctionProduct(AuctionProduct auctionProduct);
	
	public String auctionProductBid(AuctionBidInfo auctionBidInfo);
	
	public void updateAuctionProductCondition(AuctionBidInfo auctionBidInfo); 
	
	public String addMainAuctionProduct(AuctionProduct auctionProduct);
	
	public List<AuctionProduct> listMainAuctionProduct();
}
