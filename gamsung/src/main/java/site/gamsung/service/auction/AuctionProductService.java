package site.gamsung.service.auction;

import java.util.List;
import java.util.Map;

import site.gamsung.service.common.Search;
import site.gamsung.service.domain.AuctionInfo;
import site.gamsung.service.domain.AuctionProduct;

public interface AuctionProductService {
	
	public List<AuctionProduct> listCrawlingAuctionProduct(Search search);
	
	public AuctionProduct getCrawlingAuctionProductNo(AuctionProduct auctionProduct);

	public List<AuctionProduct> listAuctionProduct(Search search);
	
	public Map<String, Object> getAuctionProduct(AuctionInfo auctionInfo);
	
	public AuctionProduct getTempSaveAuctionProduct(String registrantId);
	
	public void tempSaveAuctionProduct(AuctionProduct auctionProduct);
	
	public void addAuctionProduct(AuctionProduct auctionProduct);
	
	public void updateAuctionProduct(AuctionProduct auctionProduct);
	
	public String auctionProductBid(AuctionInfo auctionInfo);
	
	public void updateAuctionProductCondition(); 
	
	public String addMainAuctionProduct(AuctionProduct auctionProduct);
	
	public List<AuctionProduct> listMainAuctionProduct();
	
	public AuctionProduct auctionProductImgs(AuctionProduct auctionProduct, List<String> fileList);
	
	public AuctionInfo deleteAuctionProduct(String auctionProductNo, String status);

}
