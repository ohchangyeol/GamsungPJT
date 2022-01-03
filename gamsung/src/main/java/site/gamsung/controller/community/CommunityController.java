  package site.gamsung.controller.community;
  
  import java.io.File; 
  import java.io.IOException; 
  import java.nio.file.Files;
  import java.nio.file.Path; 
  import java.nio.file.Paths; 
  import java.nio.file.StandardCopyOption; 
  import java.util.HashMap; 
  import java.util.List; 

  import javax.servlet.http.HttpServletRequest; 
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


  import site.gamsung.service.common.Search; 
  import site.gamsung.service.community.CommunityService; 
  import site.gamsung.service.domain.Post; 
  import site.gamsung.service.domain.User;

  
  @RequestMapping("/community/*")
  @Controller public class CommunityController {
  
  @Value("#{commonProperties['communityPageSize']}") int communityPageSize;
    
  @Autowired
  @Qualifier("communityServiceImpl") private CommunityService communityService;
  
  private static final String COM_PATH = "F:\\Git\\GamsungPJT\\gamsung\\src\\main\\webapp\\uploadfiles\\community\\img";
   
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
	@RequestMapping(value="addPost", method=RequestMethod.POST)
	public String addPost( @ModelAttribute("post") Post post, @RequestParam("file") MultipartFile File, HttpSession session) throws Exception {
	
	System.out.println("addPost Post Start");
	System.out.println("file:::::::::::::"+file);
	
	User user = (User)session.getAttribute("user"); 
	post.setWriter(user);
	
	communityService.addPost(post);
	return "redirect:/view/community/listCommunity.jsp";
	
	
 }
  
  
	
	
	
	
	
  
  }
 