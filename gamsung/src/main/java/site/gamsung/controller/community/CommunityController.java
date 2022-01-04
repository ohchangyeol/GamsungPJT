package site.gamsung.controller.community;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import site.gamsung.service.common.Search;
import site.gamsung.service.community.CommunityService;
import site.gamsung.service.domain.Post;
import site.gamsung.service.domain.User;

@RequestMapping("/community/*")
@Controller
public class CommunityController {
	
	
	@Value("#{commonProperties['communityPageSize']}")
	int communityPageSize;	
	
		
	@Autowired
	@Qualifier("communityServiceImpl")
	private CommunityService communityService;
	
	/* file upload */
	private static final String COM_PATH  = "F:\\Git\\GamsungPJT\\gamsung\\src\\main\\webapp\\uploadfiles\\community\\img";
	
	
	
	public CommunityController() {
		System.out.println(this.getClass());
	}
	
	
	
	
	@RequestMapping(value = "listCommunity")
	public String listCommunity (@ModelAttribute("search") Search search , Model model , HttpServletRequest request) throws Exception{
		
		System.out.println("listProduct");

		if(search.getCurrentPage() == 0 ){
			search.setCurrentPage(1);
		}                          
		
		search.setPageSize(communityPageSize);               //search에 현재 page와 pagesize 3 
		
		// Business logic 수행
		HashMap<String, Object> map = new HashMap<String, Object>();
		
				
		map.put("userId", "user2@gamsung.com");
		map.put("search", search);
		
		List<Post> list = communityService.listPost(map);
	
		// Model 과 View 연결
		model.addAttribute("list", list );

		return "redirect:/view/community/listCommunity.jsp";
	
	
	}
}
