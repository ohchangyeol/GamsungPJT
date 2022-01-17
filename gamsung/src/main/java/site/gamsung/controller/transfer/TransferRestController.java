  package site.gamsung.controller.transfer;
  
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
import site.gamsung.service.domain.Receive;
import site.gamsung.service.domain.Transfer;
import site.gamsung.service.domain.User;
import site.gamsung.service.transfer.ReceiveService;
import site.gamsung.service.transfer.TransferService;

  
  @RequestMapping("/transfer/*")
  @RestController 
  public class TransferRestController {
  
  @Value("#{commonProperties['communityPageSize']}") int communityPageSize;
    
  @Autowired
  @Qualifier("transferServiceImpl") private TransferService transferService;
  
  @Autowired
  @Qualifier("receiveServiceImpl") private ReceiveService receiveService; 
  
  
  
  public TransferRestController() { 
	  System.out.println(this.getClass()); 
  }

  
  
	
//	  // 양수 list
//	  
//	  @RequestMapping (value = "rest/listReceive")
//	  
//	  public List<Receive> listReceive (@RequestParam String transferNo, Search search, Model
//	  model, HttpSession session) throws Exception{
//	  
//	  System.out.println("listReceive"); // listPost 시작
//	  
//	  User user = (User)session.getAttribute("user"); 
//	  
//	  search.setRole(user.getRole());
//	  search.setTransferNo(Integer.parseInt(transferNo));
//	  search.setId(user.getId());
//	  
//	  System.out.println(user);
//	  
//	  return receiveService.listReceive(search);
//	  
//	  }
	 


  
  
//양수신청글 add
  
 @RequestMapping(value = "rest/addReceive") 
 @ResponseBody
 public void addReceive (@ModelAttribute("receive") Receive receive, String transferNoo, HttpSession session) throws Exception{
	 
	 System.out.println("addReceive:::");
	 System.out.println(receive);

	 Transfer transfer = new Transfer();

	 transfer.setTransferNo(Integer.parseInt(transferNoo));
	 receive.setTransferNo(transfer);
	 
	 User user = (User)session.getAttribute("user");
	 receive.setTransferee(user);
	 
	 receiveService.addReceive(receive);
	 
	 
		/*
		  receiveService.getReceive(receive.getTransferNo());
		 
		/* return Receive; */ 
 }
	/*
	 * //댓글 delete
	 * 
	 * @RequestMapping(value = "rest/deleteComment")
	 * 
	 * @ResponseBody public Post deleteComment (@RequestParam String commentno, Post
	 * post) throws Exception{
	 * 
	 * System.out.println("deleteComment");
	 * 
	 * int commentnoo = Integer.parseInt(commentno);
	 * 
	 * System.out.println("DeleteCommentNo:::::::" + commentnoo);
	 * 
	 * int a= communityService.deleteComment(commentnoo);
	 * 
	 * System.out.println("aaaaa:"+a); //
	 * System.out.println("Post::"+communityService.updatetotalComment(commentnoo));
	 * 
	 * post = communityService.updatetotalComment(commentnoo);
	 * 
	 * return post; }
	 * 
	 * 
	 * //게시물 캠핑장 검색
	 * 
	 * @RequestMapping(value = "rest/searchListCamp")
	 * 
	 * @ResponseBody public Map<String, Object> searchListCamp
	 * (@ModelAttribute("search") Search search, Map<String, Object> map) throws
	 * Exception{
	 * 
	 * // 리뷰게시물 등록 시에 캠핑장 이름으로 캠핑장을 검색해서 가지고 온다. 캠핑장 이름은 searchKeyword에 넣는다.
	 * 
	 * System.out.println("searchListCamp");
	 * 
	 * if (search.getCurrentPage() == 0) { search.setCurrentPage(1); }
	 * 
	 * System.out.println("검색한게 어떻게 날라오나요?"+search.getSearchKeyword());
	 * search.setPageSize(5);//5개를 가져온다. search.setSearchCondition("조회수 높은순"); //조회수
	 * 높은 순으로
	 * 
	 * return campSearchService.listCamp(search); }
	 * 
	 * 
	 */
  
  
  
  
  
  
  
  
  
  
  
  
  }//CommunityRestController END