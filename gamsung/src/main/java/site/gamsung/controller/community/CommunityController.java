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

	@Autowired
	@Qualifier("communityServiceImpl")
	private CommunityService communityService;
	private static final String FILE_SERVER_PATH = "F:\\Git\\GamsungPJT\\gamsung\\src\\main\\webapp\\uploadfiles\\community\\img";
			
	public CommunityController() {
		System.out.println(this.getClass());
	}

	@RequestMapping(value="addPost", method=RequestMethod.POST)
	public String addPost(
			@ModelAttribute("addPost") Post post/* , @RequestParam("file") MultipartFile file */) throws Exception {
	
		System.out.println("addPost Post start...");
		/* System.out.println("file:"+file); */
		
		/*
		 * if(!file.getOriginalFilename().isEmpty()) { file.transferTo(new
		 * File(FILE_SERVER_PATH, file.getOriginalFilename()));
		 * post.setPostImg1(FILE_SERVER_PATH+"/"+file.getOriginalFilename());
		 * 
		 * }
		 */
		
		User user = new User();
		user.setId("admin");
		post.setWriter(user);
		post.setPostType(1);
		post.setPostTile("붕어빵");
		post.setPostContent("맛있다");
		post.setPostImg1("abc");
		post.setPostImg2("abc");
		post.setPostImg3("abc");
		post.setHashtag1("#1");
		post.setHashtag2("#2");
		post.setHashtag3("#3");
		post.setvideo("video");
		
				
		System.out.println("post:"+post.getPostRegdate());
		System.out.println("addPost");
		
		//Business Logic
		communityService.addPost(post);
		System.out.println(post);
		
		return "redirect:/product/listProduct?menu=manage";
	}

}
