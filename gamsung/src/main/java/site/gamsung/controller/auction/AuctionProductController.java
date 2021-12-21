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
import site.gamsung.service.common.Search;
import site.gamsung.service.domain.AuctionProduct;

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
	
	@RequestMapping(value = "listAuctionProduct")
	public String listAucitonProduct(HttpSession httpSession, Model model, @ModelAttribute("search") Search search) {
		
		search.setPageSize(auctionPageSize);
		search.setCurrentPage(1);
		
		List<AuctionProduct> list = auctionProductService.listAuctionProduct(search);
		
		model.addAttribute("list",list);
		
		return "forward:/view/auction/listAuctionProduct.jsp";
		
	}
	
	@RequestMapping(value = "getAuctionProduct")
	public String getAuctionProduct(String auctionProductNo, Model model) {
		
		AuctionProduct auctionProduct = auctionProductService.getAuctionProduct(auctionProductNo);
		model.addAttribute(auctionProduct);
		
		return "forward:/view/auction/getAuctionProduct.jsp";
	}

	@RequestMapping(value = "addAuctionProduct", method = RequestMethod.GET)
	public String addAuctionProduct(HttpSession session, Model model) {
		
		AuctionProduct auctionProduct = auctionProductService.getTempSaveAuctionProduct((String)session.getAttribute(""));
		
		if(auctionProduct != null) {
			model.addAttribute("auctionProduct",auctionProduct);
		}
		
		return "forward:/view/auction/addAuctionProduct.jsp";
	}
	
	@RequestMapping(value = "addAuctionProduct", method = RequestMethod.POST)
	public String addAuctionProduct(@ModelAttribute("auctionProduct") AuctionProduct auctionProduct) {
			
			auctionProductService.addAuctionProduct(auctionProduct);
		
		return "forward:/view/auction/addAuctionProduct.jsp";
	}
	
	@RequestMapping(value = "previewAuctionProduct", method = RequestMethod.GET)
	public String previewAuctionProduct() {
		
		return "redirect:./listAuctionProduct";
	}
	
	@RequestMapping(value = "previewAuctionProduct", method = RequestMethod.POST)
	public String previewAuctionProduct(@ModelAttribute("auctionProduct") AuctionProduct auctionProduct) {
		
		return "forward:/view/auction/previewAuctionProduct.jsp";
	}
	
	@RequestMapping(value = "tempSaveAuctionProduct")
	public String tempSaveAuctionProduct(@ModelAttribute("auctionProduct") AuctionProduct auctionProduct) { 
			
			auctionProductService.tempSaveAuctionProduct(auctionProduct);
		
		return "redirect:./listAuctionProduct";
	}
	
	
}
