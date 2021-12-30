package site.gamsung.controller.community;

import java.io.File;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import site.gamsung.service.community.CommunityService;
import site.gamsung.service.domain.Post;
import site.gamsung.service.domain.User;

@Controller
@RequestMapping("/community/*")
public class CommunityController {
	
	public CommunityController() {
		System.out.println(this.getClass());
	}
	
	
	/* file upload */
	@Autowired
	@Qualifier("communityServiceImpl")
	private CommunityService communityService;
	private static final String FILE_SERVER_PATH = "F:\\Git\\GamsungPJT\\gamsung\\src\\main\\webapp\\uploadfiles\\community\\img";
			
	
	@RequestMapping(value = "listCommunity")
	public String listCommunity() {
		return "redirect:/view/community/listCommunity.jsp";
	}
	
	
	

}
