package site.gamsung.service.auction;

import java.sql.SQLException;
import java.util.List;

import site.gamsung.service.domain.AuctionProduct;

public interface AuctionRestDAO {
	
	public boolean coupangCrawlingData(List<AuctionProduct> list) throws SQLException;
}
