package site.gamsung.controller.videochat;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import site.gamsung.service.auction.AuctionProductService;
import site.gamsung.service.domain.AuctionInfo;
import site.gamsung.service.domain.AuctionProduct;
import site.gamsung.service.domain.User;
import site.gamsung.service.user.UserService;

@Controller
public class VideoController {
	
	@Autowired
	@Qualifier("userServiceImpl")
	private UserService userService;
	
	@Autowired
	@Qualifier("auctionProductService")
	private AuctionProductService auctionProductService;

	public VideoController() {
		// TODO Auto-generated constructor stub
	}
	
	@RequestMapping("/video/{productNo}")
	public String videoChat(@PathVariable("productNo") String productNo, Model model) {
		
		return "redirect:https://gamsung.site/video/"+productNo;
	}
	
	@GetMapping("/video/videoChat")
	public String videoChat() {
		
		return "redirect:/";
	}
	
	@PostMapping("/video/videoChat")
	public String videoChat(@ModelAttribute("user") User user, Model model,
							@ModelAttribute("auctionInfo") AuctionInfo auctionInfo) {
		
		user = userService.checkIdPassword(user);
		if(user == null) {
			return "redirect:/";
		}
		
		auctionInfo.setUser(user);
		
		Map<String,Object> map =auctionProductService.getAuctionProduct(auctionInfo);
		
		AuctionProduct auctionProduct = (AuctionProduct)map.get("auctionProduct");
		String id = user.getId();
		
		if(auctionProduct == null) {			
			return "redirect:/";
		}
		if( !(id.equals( auctionProduct.getRegistrantId()) || id.equals(auctionProduct.getSuccessfulBidderId()) ) ) {
			return "redirect:/";
		}
		
		model.addAttribute("auctionProduct");
		
		return "forward:/view/videochat/videoChat.jsp";
	}

}
