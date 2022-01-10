package site.gamsung.controller.videochat;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

@Controller
public class VideoController {

	public VideoController() {
		// TODO Auto-generated constructor stub
	}
	
	@GetMapping("/video/{productNo}")
	public String videoChat(@PathVariable("productNo") String productNo, Model model) {
		
		model.addAttribute("roomId",productNo);
		
		return "forward:/view/videochat/videoDoorGuard.jsp";
	}

}
