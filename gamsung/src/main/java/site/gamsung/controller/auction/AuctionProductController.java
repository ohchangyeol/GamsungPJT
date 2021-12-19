package site.gamsung.controller.auction;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import site.gamsung.service.auction.AuctionProductService;
import site.gamsung.service.domain.AuctionProduct;
import site.gamsung.service.domain.AuctionSearch;

@RequestMapping("/auction/*")
@Controller
public class AuctionProductController {
	
	@Value("#{commonProperties['auctionPageSize']}")
	int auctionPageSize;
	
	
	@Autowired
	@Qualifier("auctionProductService")
	private AuctionProductService auctionProductService;
	
	
	
	public AuctionProductController() {
		System.out.println(this.getClass());
	}
	
	@RequestMapping(value = "listAuctionProduct", method = RequestMethod.GET)
	public String listAucitonProduct(HttpSession httpSession, Model model, @ModelAttribute("aucitonSearch") AuctionSearch auctionSearch) {
		
		auctionSearch.setPageSize(auctionPageSize);
		auctionSearch.setCurrentPage(1);
		
		List<AuctionProduct> list = auctionProductService.listAuctionProduct(auctionSearch);
		
		model.addAttribute("list",list);
		
		return "forward:/view/auction/listAuctionProduct.jsp";
		
	}
	
	@RequestMapping(value = "getAuctionProduct", method = RequestMethod.GET)
	public String getAuctionProduct(String auctionProductNo, Model model) {
		
		AuctionProduct auctionProduct = auctionProductService.getAuctionProduct(auctionProductNo);
		model.addAttribute(auctionProduct);
		
		return "forward:/view/auction/getAuctionProduct.jsp";
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
