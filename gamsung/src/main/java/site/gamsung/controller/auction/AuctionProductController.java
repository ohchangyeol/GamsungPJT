package site.gamsung.controller.auction;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import site.gamsung.service.auction.AuctionProductService;
import site.gamsung.service.domain.AuctionProduct;

@RequestMapping("/auction/*")
@Controller
public class AuctionProductController {
	
	@Autowired
	@Qualifier("auctionProductService")
	private AuctionProductService auctionProductService;
	
	
	
	public AuctionProductController() {
		System.out.println(this.getClass());
	}
	
	@RequestMapping(value = "listAuctionProduct", method = RequestMethod.GET)
	public String listAucitonProduct(HttpSession httpSession) {
		
		httpSession.getAttribute("");
		
		
		return "forward:/view/listAuctionProduct.jsp";
		
	}

	@RequestMapping(value = "addProduct", method = RequestMethod.GET)
	public String addAuctionProduct() {
		
		return "forward:view/auction/addAuctionProduct.jsp";
	}
	
	@RequestMapping(value = "addProduct", method = RequestMethod.POST)
	public String addAuctionProduct(@ModelAttribute("auctionProduct") AuctionProduct auctionProduct) {
		
		return "forward:view/auction/addAuctionProduct.jsp";
	}
	
}
