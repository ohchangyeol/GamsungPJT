package site.gamsung.controller.common;

import java.util.List;

import org.springframework.ui.Model;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import site.gamsung.service.auction.AuctionProductService;
import site.gamsung.service.domain.AuctionProduct;

@RequestMapping("/")
@Controller
public class MainController {
	
	@Autowired
	@Qualifier("auctionProductService")
	private AuctionProductService auctionProductService;
	
	@RequestMapping
	public String mainPage(Model model) {
		
		List<AuctionProduct> productList = auctionProductService.listMainAuctionProduct();
		
		model.addAttribute("productList",productList);
		
		return "forward:/main.jsp";
	}
}
