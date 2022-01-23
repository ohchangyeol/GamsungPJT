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
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import site.gamsung.service.common.Page;
import site.gamsung.service.common.RatingReviewService;
import site.gamsung.service.common.Search;
import site.gamsung.service.community.CommunityService;
import site.gamsung.service.domain.AuctionProduct;
import site.gamsung.service.domain.Camp;
import site.gamsung.service.domain.Comment;
import site.gamsung.service.domain.Post;
import site.gamsung.service.domain.RatingReview;
import site.gamsung.service.domain.User;

@RequestMapping("/community/*")
@Controller
public class CommunityController {

   @Value("#{commonProperties['communityPageSize']}")
   int communityPageSize;

   @Autowired
   @Qualifier("communityServiceImpl")
   private CommunityService communityService;
   
   @Autowired
   @Qualifier("campRatingReviewServiceImpl")
   private RatingReviewService ratingReviewService;
   
   
   
   @Value("#{commonProperties['pageUnit']}")
   int pageUnit;
   

   public CommunityController() {
      System.out.println(this.getClass());
   }

// 커뮤니티 List navigation  
   @RequestMapping(value = "listPost")
   public String listPost(@ModelAttribute("search") Search search,
         @RequestParam(value = "postType", required = false) String postType, Model model, HttpSession session)
         throws Exception {

      System.out.println("listPost"); // listPost 시작
      System.out.println(postType);
      System.out.println(search);

      User user = (User) session.getAttribute("user"); // Session에서 user받아서 user setting하기.

      System.out.println(user);

      if (user == null) {
         return "redirect:/";
      } // user가 null이면 main으로 navigation

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
      map.put("userId", user.getId()); // 세션에 있는 아이디로 추천여부확인. 
      map.put("search", search);
      map.put("post", post);
      
      System.out.println("\n\n\n\n\n\n listPost ======");
      
      System.out.println(user.getId());
      System.out.println(post);

      // System.out.println(map);
      List<Post> list = communityService.listPost(map);

      System.out.println("list::::::" + list);
      // Model 과 View 연결

      model.addAttribute("list", list);
      model.addAttribute("userId", user.getId());
      model.addAttribute("search", search);

      return "forward:/view/community/listPost.jsp";

   }

   // 게시물 등록 페이지 navigation
   @GetMapping(value = "addPost")
   public String addPost(HttpSession session, Model model) {

      System.out.println("addPost Get Start");

      // 세션으로 부터 요청한 유저의 정보를 가져온다.
      User user = (User) session.getAttribute("user");

      if (user == null) {
         return "redirect:/";
      }

      return "redirect:/view/community/addPost.jsp";
   }

   // 게시물 등록 Mapping

   @RequestMapping(value = "addPost", method = RequestMethod.POST) // RequestParam의 별칭은 file type속성의 name과 맞춘다.
   public String addPost(@ModelAttribute("post") Post post, @RequestParam("postImg") MultipartFile[] postImg,
         HttpServletRequest req, HttpSession session, Model model) throws Exception {
      
      System.out.println("addPost Post Start");
      
      System.out.println("----------------\n"
                      	+"ㅣ     data     ㅣ\n"
                      	+"----------------\n"+post);
      
      RatingReview ratingReview = null;
      
//      Camp camp = new Camp(); // camp 만들고
//      int campno = post.getCampNo(); // addPost에서 넘어온 campNo 넣어주고.
//      camp.setCampNo(campno); // campno camp에 setting

//      if (campno != 0 && post.getStatusRating() != 0) { // 값이 있을 경우

      int index = 1;

      for (MultipartFile multpartfile : postImg) {

         // MultipartFile로 받은 postImg에서 file이름을 originalPostImg에 넣는다.
         String originalPostImg = multpartfile.getOriginalFilename();

         System.out.println("originalPostImg::::" + originalPostImg + "!");

         if (originalPostImg != null && originalPostImg != "") {

            // 그 파일명 .의 인덱스 숫자까지 잘라서 확장자만 추출 (ex .jsp)
            String originalFileExtension = originalPostImg.substring(originalPostImg.lastIndexOf("."));

            // UUID로 랜덤하게 생성한거에 -가 있으면 없애고 확장자를 붙임 (ex 359498a2ff1a40b8a8e16f6c43dd2bf3.jpg)
            String root_path = req.getSession().getServletContext().getRealPath("/");
            String attach_path = "uploadfiles/community/img/";

            String storedFileName = UUID.randomUUID().toString().replaceAll("-", "") + originalFileExtension;

            System.out.println(root_path);
            // File을 생성해서 주소랑 새로 만든 파일이름을 넣는다.
            File file = new File(root_path + attach_path + storedFileName);
            
            System.out.println("file::::" + file);
            
            // MultipartFile.transferTo(File file) - Byte형태의 데이터를 File객체에 설정한 파일 경로에 전송한다.
            // file에는 주소랑 새로만든 파일이름이 있음. 그걸 PostImg에 넣는다.
            multpartfile.transferTo(file); // postImg를 transferto(보낸다)file로
            
            System.out.println("file");
            System.out.println("file.getPath::" + file.getPath()+"\n");
            
            
            if(post.getPostType() == 4 && post.getCampNo() != 0 ) {
               
               System.out.println("--------------------------------\nㅣ review File save starting.... ㅣ \n--------------------------------");
               
               attach_path = "uploadfiles/campimg/review/";
               System.out.println("File storage path!! \n ==> "+root_path + attach_path + storedFileName);
               file = new File (root_path + attach_path + storedFileName);
               multpartfile.transferTo(file);
            }
            
            System.out.println("file");
            System.out.println("file.getPath::" + file.getPath());
            
            if (index == 1) {
               post.setPostImg1(storedFileName);
            } else if (index == 2) {
               post.setPostImg2(storedFileName);
            } else {
               post.setPostImg3(storedFileName);
            }
            
            index++;
         } // originalPostImg if문 END

      } // postImg for문 END

      User user = (User) session.getAttribute("user");
      post.setWriter(user);

      if(post.getPostType() == 4 && post.getCampNo() != 0 ) {
         Camp camp = new Camp();
         camp.setCampNo(post.getCampNo());
         
         ratingReview = new RatingReview(camp, user, 2, post.getPostTitle(), post.getPostContent(), post.getStatusRating(), post.getPostImg1(), post.getPostImg2(), post.getPostImg3());
         
         ratingReviewService.addRatingReview(ratingReview);
      }
      
      communityService.addPost(post);
      

      return "redirect:/community/listPost";
//      return "forward:/campGeneral/addCampRatingReview";

   }// 등록 method 종료

   // 게시물 수정 page navigation
   @GetMapping(value = "updatePost")
   public String updatePost(@RequestParam String postNo, HttpSession session, Post post, Model model)
         throws Exception { // throw Exception이 있어야 하는 경우?

      System.out.println("updatePost Get Start");

      // 세션으로 부터 요청한 유저의 정보를 가져온다.
      User user = (User) session.getAttribute("user");

      if (user == null) {
         return "redirect:/";
      }

      int postno = Integer.parseInt(postNo);

      post = communityService.getPost(postno);

      model.addAttribute("post", post);
      model.addAttribute("user", user);

      return "forward:/view/community/updatePost.jsp";
   }

   // 게시물 수정 비즈니스로직
   @PostMapping(value = "updatePost")
   public String updatePost(@ModelAttribute("post") Post post, @RequestParam("postImg") MultipartFile[] postImg,
         HttpServletRequest req, HttpSession session) throws Exception { // throw Exception이 있어야 하는 경우?

      System.out.println("updatePost Post Start");

      // 세션으로 부터 요청한 유저의 정보를 가져온다.
      User user = (User) session.getAttribute("user");

//      String PostContent = post.getPostContent();   
      System.out.println(post);

      if (user == null) {
         return "redirect:/";

      }

      int index = 1;

      for (MultipartFile multpartfile : postImg) {

         // MultipartFile로 받은 postImg에서 file이름을 originalPostImg에 넣는다.
         String originalPostImg = multpartfile.getOriginalFilename();

         System.out.println("originalPostImg::::" + originalPostImg + "!");

         if (originalPostImg != null && originalPostImg != "") {

            // 그 파일명 .의 인덱스 숫자까지 잘라서 확장자만 추출 (ex .jsp)
            String originalFileExtension = originalPostImg.substring(originalPostImg.lastIndexOf("."));

            // UUID로 랜덤하게 생성한거에 -가 있으면 없애고 확장자를 붙임 (ex 359498a2ff1a40b8a8e16f6c43dd2bf3.jpg)
            String root_path = req.getSession().getServletContext().getRealPath("/");
            String attach_path = "uploadfiles/community/img/";
            String storedFileName = UUID.randomUUID().toString().replaceAll("-", "") + originalFileExtension;

            System.out.println(root_path);
            // File을 생성해서 주소랑 새로 만든 파일이름을 넣는다.
            File file = new File(root_path + attach_path + storedFileName);

            System.out.println("file::::" + file);

            // MultipartFile.transferTo(File file) - Byte형태의 데이터를 File객체에 설정한 파일 경로에 전송한다.
            // file에는 주소랑 새로만든 파일이름이 있음. 그걸 PostImg에 넣는다.
            multpartfile.transferTo(file); // postImg를 transferto(보낸다)file로

            System.out.println("file");
            System.out.println("file.getPath::" + file.getPath());

            if (index == 1) {
               post.setPostImg1(storedFileName);
            } else if (index == 2) {
               post.setPostImg2(storedFileName);
            } else {
               post.setPostImg3(storedFileName);
            }

            index++;
         }
      }

      post.setWriter(user);
      
      System.out.println("\n\n Post ==> " + post);

      communityService.updatePost(post);

      return "redirect:listPost";
   }

   // 게시물 삭제
   @GetMapping(value = "deletePost")
   public String deletePost(@RequestParam("postNo") int postNo, HttpSession session) throws Exception { // throw
                                                                                 // Exception이
                                                                                 // 있어야 하는
                                                                                 // 경우?
      System.out.println("deletePost Post Start");

      
      System.out.println("postNo ==> " + postNo);
      
      
      // 세션으로 부터 요청한 유저의 정보를 가져온다.
      User user = (User) session.getAttribute("user");

      if (user == null) {
         return "redirect:/";

      }

      communityService.deletePost(postNo);

      return "redirect:listPost";
   }
   
// 커뮤니티 My post navigation  
   
   @RequestMapping(value = "listMyPost")
   public String listMyPost(@ModelAttribute("search") Search search, @RequestParam(value = "postType", required = false) String postType, Model model, HttpSession session) throws Exception {

      System.out.println("listMyPost시작"); // listPost 시작
      System.out.println("postType"+postType);
      System.out.println("search"+search);

      User user = (User) session.getAttribute("user"); // Session에서 user받아서 user setting하기.

      System.out.println(user);

      if (user == null) {
         return "redirect:/";
      } // user가 null이면 main으로 navigation

      search.setPageSize(communityPageSize);

      // System.out.println(search);

      if (search.getCurrentPage() == 0) {
         search.setCurrentPage(1);
      }

      HashMap<String, Object> map = new HashMap<String, Object>();

      Post post = new Post();

      if (postType != null) {
        int postTypee = Integer.parseInt(postType);
         post.setPostType(postTypee);
      }
      map.put("userId", user.getId());
      map.put("search", search);
      map.put("post", post);

      List<Post> list = communityService.MylistPost(map);
      
      int totalCount = communityService.getTotalPost(map);
      
      Page resultPage = new Page( search.getCurrentPage(), totalCount, pageUnit, communityPageSize);
      
      System.out.println("list::::::" + list);

      model.addAttribute("list", list);
      model.addAttribute("resultPage", resultPage); 
      model.addAttribute("search",search);
      
      return "forward:/view/community/listMyPost.jsp";

   }

// 커뮤니티 My comment List navigation  
   
   @RequestMapping(value = "listMyComment")
   public String listMyComment(@ModelAttribute("search") Search search, @RequestParam(value = "postType", required = false) String postType, Model model, HttpSession session) throws Exception {
  
	  System.out.println("listMyComment"); 
      User user = (User) session.getAttribute("user"); // Session에서 user받아서 user setting하기.

      if (user == null) {
         return "redirect:/";
      } // user가 null이면 main으로 navigation
      search.setPageSize(communityPageSize);

      if (search.getCurrentPage() == 0) {
         search.setCurrentPage(1);
      }
      
      search.setId(user.getId());

      // System.out.println(map);
      List<Post> list = communityService.listPostForComment(search);//댓글 List		(map);
      int totalCount = communityService.getTotalComment(search);
      
      System.out.println("listPostForCommentlist::::::" + list);
      
      Page resultPage = new Page( search.getCurrentPage(), totalCount, pageUnit, communityPageSize);
      
      model.addAttribute("list", list);
      model.addAttribute("resultPage",resultPage);
      
      return "forward:/view/community/listMyComment.jsp";

   }

   // 게시물 상세
   @GetMapping(value = "getPost")
   public String getPost(@RequestParam("postNo") int postNo, HttpSession session, Model model) throws Exception { // throw
                                                                                                                                 
      System.out.println("getPost Post Start");

      User user = (User) session.getAttribute("user");

      if (user == null) {
         return "redirect:/";

      }

      Post post = communityService.getPost(postNo);
      
      model.addAttribute("post", post);
      
      return "forward:/view/community/getPost.jsp";
   }
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   

}