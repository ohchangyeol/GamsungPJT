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
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping; 
  import org.springframework.web.bind.annotation.RequestMethod; 
  import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import site.gamsung.service.camp.CampSearchService;
import site.gamsung.service.common.Search; 
  import site.gamsung.service.community.CommunityService;
import site.gamsung.service.domain.AuctionProduct;
import site.gamsung.service.domain.Comment;
import site.gamsung.service.domain.Post; 
  import site.gamsung.service.domain.User;

  
  @RequestMapping("/community/*")
  @RestController 
  public class CommunityRestController {
  
  @Value("#{commonProperties['communityPageSize']}") int communityPageSize;
    
  @Autowired
  @Qualifier("communityServiceImpl") private CommunityService communityService;
  
  @Autowired
  @Qualifier("campSearchServiceImpl") private CampSearchService campSearchService; 
  
  
  
  public CommunityRestController() { 
	  System.out.println(this.getClass()); 
  }

  
  
// 댓글 list 
  
  @RequestMapping (value = "rest/listComment") 
  
  public List<Comment> listComment (@ModelAttribute("post") Post post, Model model, HttpSession session) throws Exception{
  
	System.out.println("listComment"); // listPost 시작 

	User user = (User)session.getAttribute("user"); //Session에서 user받아서 user setting하기. 
	
	System.out.println(user);
	
	int postNo = post.getPostNo();
	
	System.out.println(postNo);	
	
//	List<Comment> Comment = communityService.listComment(postNo);
//	
//	// Model 과 View 연결 
//	
//	model.addAttribute("list", Comment );
  
	return communityService.listComment(postNo);

  }
  
  
  
//댓글 add
  
  @RequestMapping(value = "rest/addComment") 
 @ResponseBody
 public Post addComment (@RequestParam String postno, String userid,  String val, User user, Comment comment, Post post) throws Exception{
	 
	 System.out.println("addComment");
	 
	 int postnoo = Integer.parseInt(postno);
	 
	 user.setId(userid);
	 post.setPostNo(postnoo);
 
	 comment.setPostNo(post);
	 comment.setCommentWriter(user);
	 comment.setCommentContent(val);
	 
	 System.out.println("postno ==>" + postno +" userid => " + userid + "val ==> " + val );
	 
	 
	 	   communityService.addComment(comment);
	 
	post = communityService.updatetotalComment2(postnoo);
		 
	return post; 	 
 }
  
//댓글 delete
  
 @RequestMapping(value = "rest/deleteComment") 
 @ResponseBody
 public Post deleteComment (@RequestParam String commentno, Post post) throws Exception{
	 
	 System.out.println("deleteComment");
	 
	 int commentnoo = Integer.parseInt(commentno);
	 
	 System.out.println("DeleteCommentNo:::::::" + commentnoo);
	 	 	 
	 int a= communityService.deleteComment(commentnoo);
 
	 System.out.println("aaaaa:"+a);
//	 System.out.println("Post::"+communityService.updatetotalComment(commentnoo));
	 		
	post = communityService.updatetotalComment(commentnoo);
	 
	return post;
 }
 
 
//게시물 캠핑장 검색
 
@RequestMapping(value = "rest/searchListCamp") 
@ResponseBody
public Map<String, Object> searchListCamp (@ModelAttribute("search") Search search, Map<String, Object> map) throws Exception{

	// 리뷰게시물 등록 시에 캠핑장 이름으로 캠핑장을 검색해서 가지고 온다. 캠핑장 이름은 searchKeyword에 넣는다. 
	
	 System.out.println("searchListCamp");
	 
		if (search.getCurrentPage() == 0) {
			search.setCurrentPage(1);
		}
				
		System.out.println("검색한게 어떻게 날라오나요?"+search.getSearchKeyword());
		search.setPageSize(5);//5개를 가져온다.
		search.setSearchCondition("조회수 높은순"); //조회수 높은 순으로
				 
    return campSearchService.listCamp(search);
}  
  
@RequestMapping(value = "rest/listPost")
public Map<String, Object> listPost(@ModelAttribute("search") Search search,
      @RequestParam(value = "postType", required = false) String postType)
      throws Exception {


   search.setPageSize(communityPageSize);

   // System.out.println(search);

   if (search.getCurrentPage() == 0) {
      search.setCurrentPage(1);
   }

   System.out.println(search);
   // 출력할 개수을 commonProperties로 부터 받아오며, 1페이지가 고정값으로 들어간다.

   HashMap<String, Object> map = new HashMap<String, Object>();

   Post post = new Post();

   if (postType != null) {

      int postTypee = Integer.parseInt(postType);
      post.setPostType(postTypee);

   }
   map.put("search", search);
   map.put("post", post);

   // System.out.println(map);
   List<Post> list = communityService.listPost(map);

   System.out.println("list::::::" + list);
   // Model 과 View 연결
   
   Map<String, Object> resultMap = new HashMap<String, Object>();
   
   resultMap.put("search", search);
   resultMap.put("list", list);
   
   return resultMap;

}

@RequestMapping(value = "rest/concern/{postNo}/{concernType}")
public int AddConcern(@PathVariable("postNo") int postNo ,@PathVariable("concernType") String concernType , HttpSession session) throws Exception {

	System.out.println("postNo======> "+postNo+"\n concernType======>"+concernType);
	
	String userId = ((User)session.getAttribute("user")).getId();
	System.out.println("userId =======>"+ userId);
	
//	int postNo = 1;
//	String userId = "user5@gamsung.com";
//	String concernType = "insert";
//
//	int CONCERN = communityService.updateConcern(postNo, userId, concernType);
//
//	System.out.println("CONCERN:::::" + CONCERN);
	
	communityService.updateConcern(postNo, userId, concernType);
	return communityService.totalConcern(postNo);
}
  
  
  
  
  
  
  
  
  
  
  
  }//CommunityRestController END