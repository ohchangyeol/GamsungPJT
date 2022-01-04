  package site.gamsung.controller.community;
  
  import java.io.File; 
  import java.io.IOException; 
  import java.nio.file.Files;
  import java.nio.file.Path; 
  import java.nio.file.Paths; 
  import java.nio.file.StandardCopyOption;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
  
  import org.springframework.beans.factory.annotation.Autowired; 
  import org.springframework.beans.factory.annotation.Qualifier; 
  import org.springframework.beans.factory.annotation.Value; 
  import org.springframework.stereotype.Controller; 
  import org.springframework.ui.Model; 
  import org.springframework.web.bind.annotation.GetMapping; 
  import org.springframework.web.bind.annotation.ModelAttribute; 
  import org.springframework.web.bind.annotation.RequestMapping; 
  import org.springframework.web.bind.annotation.RequestMethod; 
  import org.springframework.web.bind.annotation.RequestParam; 
  import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import site.gamsung.service.common.Search; 
  import site.gamsung.service.community.CommunityService; 
  import site.gamsung.service.domain.Post; 
  import site.gamsung.service.domain.User;

  
  @RequestMapping("/community/*")
  @Controller public class CommunityController {
  
  @Value("#{commonProperties['communityPageSize']}") int communityPageSize;
    
  @Autowired
  @Qualifier("communityServiceImpl") private CommunityService communityService;
  
  private static final String FILE_PATH = "F:\\Git\\GamsungPJT\\gamsung\\src\\main\\webapp\\uploadfiles\\community\\img\\";
   
  public CommunityController() { 
	  System.out.println(this.getClass()); 
  }
    
// 커뮤니티 List navigation  
  @RequestMapping (value = "listCommunity") 
  public String listCommunity (@ModelAttribute("search") Search search , Model model , HttpSession session) throws Exception{
  
  System.out.println("listProduct");
  
	User user = (User)session.getAttribute("user");
	
	if(user == null) {
	return "redirect:/"; 
	}
  
  if(search.getCurrentPage() == 0 ){ 
	 search.setCurrentPage(1); 
	 }
  
  search.setPageSize(communityPageSize); //search에 현재 page와 pagesize 3
  
  HashMap<String, Object> map = new HashMap<String, Object>();  
  
  map.put("userId", "user2@gamsung.com"); map.put("search", search);
  
  List<Post> list = communityService.listPost(map);
  
  // Model 과 View 연결 model.addAttribute("list", list );
  
  return "redirect:/view/community/listCommunity.jsp";

  }

  
  
  
  
  //게시물 등록 페이지 navigation 
  @GetMapping(value = "addPost") 
  public String addPost (HttpSession session,  Model model) {
	  
	System.out.println("addPost Get Start");
  
	//세션으로 부터 요청한 유저의 정보를 가져온다.
	User user = (User)session.getAttribute("user");
	
	if(user == null) {
	return "redirect:/"; 
	}
	
  	return "redirect:/view/community/addPost.jsp";
  }
  
  
//게시물 등록 Mapping
  
	@RequestMapping(value="addPost", method=RequestMethod.POST) //RequestParam의 별칭은 file type속성의 name과 맞춘다. 
	public String addPost( @ModelAttribute("post") Post post, @RequestParam("postImg") MultipartFile[] postImg, HttpSession session) throws Exception {
	
	System.out.println("addPost Post Start");
	
	int	index = 1;
	
	for(MultipartFile multpartfile: postImg) {
			
	//MultipartFile로 받은 postImg에서 file이름을 originalPostImg에 넣는다. 
	String originalPostImg = multpartfile.getOriginalFilename(); 
	
	//그 파일명 .의 인덱스 숫자까지 잘라서 확장자만 추출 (ex .jsp)
	String originalFileExtension = originalPostImg.substring(originalPostImg.lastIndexOf("."));
	
	// UUID로 랜덤하게 생성한거에 -가 있으면 없애고 확장자를 붙임 (ex 359498a2ff1a40b8a8e16f6c43dd2bf3.jpg)
    String storedFileName = UUID.randomUUID().toString().replaceAll("-", "") + originalFileExtension;
    
    //File을 생성해서 주소랑 새로 만든 파일이름을 넣는다. 
    File file = new File(FILE_PATH + storedFileName);	
    
    System.out.println("file::::"+file);
	   
    //MultipartFile.transferTo(File file) - Byte형태의 데이터를 File객체에 설정한 파일 경로에 전송한다.
    //file에는 주소랑 새로만든 파일이름이 있음. 그걸 PostImg에 넣는다. 
    multpartfile.transferTo(file); // postImg를 transferto(보낸다)file로 	
    
    System.out.println("file");
    System.out.println("file.getPath::"+file.getPath());
   

		if (index == 1) {
			post.setPostImg1(file.getPath());
		} else if (index == 2 ) {
			post.setPostImg2(file.getPath());
		} else {
			post.setPostImg3(file.getPath());        
		}
	
		index ++;
	}
	
	User user = (User)session.getAttribute("user"); 
	
	post.setWriter(user);	
	
	communityService.addPost(post);
	
	return "redirect:/view/community/listCommunity.jsp";
	}//등록 method 종료	
}