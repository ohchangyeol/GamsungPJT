package site.gamsung.service.auction.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import site.gamsung.service.auction.AuctionProductDAO;
import site.gamsung.service.auction.AuctionProductService;
import site.gamsung.service.common.Search;
import site.gamsung.service.domain.AuctionProduct;

@Service("auctionProductService")
public class AuctionProductServiceImpl implements AuctionProductService{

	@Autowired(required = false)
	@Qualifier("auctionProductDAO")
	private AuctionProductDAO auctionProductDAO;
	
	public AuctionProductServiceImpl(){
		// TODO Auto-generated constructor stub
	}

	@Override
	public List<AuctionProduct> listAuctionProduct(Search search) {
		// TODO Auto-generated method stub
			
		return auctionProductDAO.listAuctionProduct(search);
	}

	@Override
	public AuctionProduct getAuctionProduct(String auctionProductNo) {
		// TODO Auto-generated method stub
		return auctionProductDAO.getAuctionProduct(auctionProductNo);
	}

	@Override
	public AuctionProduct getTempSaveAuctionProduct(String registrantId) {
		// TODO Auto-generated method stub
		return auctionProductDAO.getTempSaveAuctionProduct(registrantId);
	}

	@Override
	public void tempSaveAuctionProduct(AuctionProduct auctionProduct) {
		// TODO Auto-generated method stub
		auctionProductDAO.tempSaveAuctionProduct(auctionProduct);
	}

	@Override
	public void addAuctionProduct(AuctionProduct auctionProduct) {
		// TODO Auto-generated method stub
		auctionProductDAO.addAuctionProduct(auctionProduct);
	}
	
	
	
	

	
}
