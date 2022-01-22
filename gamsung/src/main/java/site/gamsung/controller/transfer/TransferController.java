package site.gamsung.controller.transfer;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import site.gamsung.service.camp.CampReservationService;
import site.gamsung.service.common.Page;
import site.gamsung.service.common.Search;
import site.gamsung.service.community.CommunityService;
import site.gamsung.service.domain.Camp;
import site.gamsung.service.domain.CampReservation;
import site.gamsung.service.domain.Payment;
import site.gamsung.service.domain.Post;
import site.gamsung.service.domain.Receive;
import site.gamsung.service.domain.Transfer;
import site.gamsung.service.domain.User;
import site.gamsung.service.payment.PaymentService;
import site.gamsung.service.transfer.ReceiveService;
import site.gamsung.service.transfer.TransferService;
import site.gamsung.service.user.UserService;


@RequestMapping("/transfer/*")
@Controller
public class TransferController {
   
   
   @Autowired
   @Qualifier("transferServiceImpl")
   private TransferService transferService;   

   @Autowired
   @Qualifier("receiveServiceImpl")
   private ReceiveService receiveService;   
   


   @Autowired
   @Qualifier("paymentServiceImpl")
   private PaymentService paymentService;
   
   @Autowired
   @Qualifier("userServiceImpl")
   private UserService userService;  

   
   
   
   
   @Autowired
   @Qualifier("campReservationServiceImpl")
   private CampReservationService campReservationService;   
   
   @Value("#{commonProperties['pageUnit']}")
   int pageUnit;
   
   @Value("#{commonProperties['pageSize']}")
   int pageSize;
   

   public TransferController() {
      System.out.println(this.getClass());
   }

   // 예약 양도 등록 페이지 navigation
   
   @RequestMapping(value = "addTransfer", method = RequestMethod.GET)   
   public String addTransfer(HttpSession session, Model model) {

      System.out.println("addTransfer Start");

      // 세션으로 부터 요청한 유저의 정보를 가져온다.
      User user = (User) session.getAttribute("user");

      if (user == null) {
         return "redirect:/";
      }
            
       Search search = new Search();
       String id = user.getId();      
       
       if (search.getCurrentPage() == 0) {
            search.setCurrentPage(1);
         }
         
      search.setPageSize(10);
              
       Map<String, Object> List   = campReservationService.listMyReservation(search, id);

       
      List<CampReservation> list = (List<CampReservation>) List.get("list");
      
      System.out.println("list::::::::::::::::::::::::::"+list);
      System.out.println("list:::::::::::::::::끝");
         
      model.addAttribute("userId", user.getId());
      model.addAttribute("list", list);

      return "forward:/view/transfer/addTransfer.jsp";
   }
   
   
   // 예약양도등록 Mapping

   @RequestMapping(value = "addTransfer", method = RequestMethod.POST) // RequestParam의 별칭은 file type속성의 name과 맞춘다.
   public String addTransfer(@ModelAttribute("transfer") Transfer transfer, MultipartFile[] paymentImgs,
         HttpServletRequest req, HttpSession session, Model model) throws Exception {

      System.out.println("addTransfer Post Start");
      System.out.println("transfer:::::::"+transfer);
      
         int index = 1;
         
//         ArrayList<String> imgs = new ArrayList<String>();
         
         for (MultipartFile multpartfile : paymentImgs) {

            // MultipartFile로 받은 postImg에서 file이름을 originalPostImg에 넣는다.
            String originalPostImg = multpartfile.getOriginalFilename();

            System.out.println("originalPostImg::::" + originalPostImg + "!");

            if (originalPostImg != null && originalPostImg != "") {

               // 그 파일명 .의 인덱스 숫자까지 잘라서 확장자만 추출 (ex .jsp)
               String originalFileExtension = originalPostImg.substring(originalPostImg.lastIndexOf("."));

               // UUID로 랜덤하게 생성한거에 -가 있으면 없애고 확장자를 붙임 (ex 359498a2ff1a40b8a8e16f6c43dd2bf3.jpg)
               String root_path = req.getSession().getServletContext().getRealPath("/");
               String attach_path = "uploadfiles/transfer/";
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

//               imgs.add(storedFileName);
            
               if (index == 1) {
                  transfer.setPaymentImg(storedFileName);
               } else if (index == 2) {
                  transfer.setPaymentImg(storedFileName);
               } else {
                  transfer.setPaymentImg(storedFileName);
               }

               index++;

            } // originalPostImg if문 END

         } // postImg for문 END

//         transfer.setPaymentImg(imgs);
         
         User user = (User) session.getAttribute("user");
         
         
         
         transfer.setTransferOr(user);

         transferService.addTransfer(transfer);

//      반장님꺼 뭘 건드려줘야함. 
         
      return "redirect:listTransfer";
   }// 등록 method 종료
   
   
   
   // 예약양도 목록 페이지 navigation   
   @RequestMapping(value = "listTransfer")   
   public String listTransfer(@ModelAttribute("search") Search search, HttpSession session, Model model) throws Exception {

      System.out.println("listTransfer Start");

      User user = (User) session.getAttribute("user");

      if (user == null) {
         return "redirect:/";
      }
      
       Map<String, Object> map = new HashMap<String, Object>();
       
//       Search search = new Search();
           
       if (search.getCurrentPage() == 0) {
            search.setCurrentPage(1);
         }
             
      search.setPageSize(10);

      map.put("search", search);
             
      map = transferService.listTransfer(map);
      
      int TotalCount = (int) map.get("TotalCount");
   
      List<Transfer> list =  (List<Transfer>) map.get("list");
      
      Page resultPage = new Page( search.getCurrentPage(), TotalCount, pageUnit, pageSize);
            
      model.addAttribute("user", user);
      model.addAttribute("list", list);
      model.addAttribute("resultPage", resultPage);      
      
      return "forward:/view/transfer/listTransfer.jsp";
   }
   
   
   
   // 양도 상세 페이지 
   
   @RequestMapping(value = "getTransfer")   
   public String getTransfer(@RequestParam("transferNo") int transferNo, HttpSession session, Model model, Search search) throws Exception {

      System.out.println("getTransfer Start");

      User user = (User) session.getAttribute("user");

      if (user == null) {
         return "redirect:/";
      }
      
      System.out.println("컨트롤에 넘어온 transferNo:::::::"+transferNo);
               
      Transfer transfer = transferService.getTransfer(transferNo);
       
      System.out.println("DB에서 받아온 getTransfer:::"+transfer);
      
      System.out.println("getTransfer이후 TransferNO:::"+transferNo);
              
        search.setRole(user.getRole());
        search.setTransferNo(transferNo);
        search.setId(user.getId());
        search.setCurrentPage(1);
        search.setPageSize(10);
        System.out.println("StartRowNum:::::"+search.getStartRowNum());
        System.out.println("EndRowNum:::::"+search.getEndRowNum());
        
        
        int StartRowNum = search.getStartRowNum();
        int EndRowNum = search.getEndRowNum();
        
        search.setStartRowNum(StartRowNum);
        search.setEndRowNum(EndRowNum);
           
         //search setting해서 페이징처리 안할꺼면 매퍼를 고쳐야한다. 현재는 10개밖에 안뽑아온다. 
        
        // 이 게시글을 등록한 사람은 다 볼 수 있다. 이 게시글에 달린 양수신청만 나와랏 
        
        System.out.println("receiveserive로 보내는 search값:::"+search);
        
        List<Receive> listreceive = receiveService.listReceive(search);   
        
        System.out.println("DB에서 받아온 listreceive:::::::::"+listreceive);
   
         model.addAttribute("user", user);
         model.addAttribute("transfer", transfer);
         model.addAttribute("listreceive", listreceive);
   
      return "forward:/view/transfer/getTransfer.jsp";
      
      
   }
   
   // 예약양도양수 My 페이지 navigation   1.양도 목록 
   @RequestMapping(value = "listMyTransfer")   
   public String listMyTransfer(HttpSession session, Model model, Search search , @RequestParam(value = "options", defaultValue = "1") int options) throws Exception {

      System.out.println("listMyTransfer Start");
      
   
      User user = (User) session.getAttribute("user");
      int TotalCount = 0;
      List<Transfer> Transferlist = null;
      if (user == null) {
         return "redirect:/";
      }
      
       Map<String, Object> map = new HashMap<String, Object>();
       
       if (search.getCurrentPage() == 0) {
            search.setCurrentPage(1);
         }
             
      search.setPageSize(10);
      search.setId(user.getId()); // listMyTransfer는 search에 id를 넣는다. 

      map.put("search", search);
      
      System.out.println(" -------------- \n options ==>"+ options);
      
      if(options == 1) {
         map = transferService.listTransfer(map);
      }else {
         map = transferService.listTransferForReceive(search);
         
      }
      
      TotalCount = (int) map.get("TotalCount");
      Transferlist =  (List<Transfer>) map.get("list");
   
      
      Page resultPage = new Page( search.getCurrentPage(), TotalCount, pageUnit, pageSize);
            
      System.out.println(Transferlist);
      
      model.addAttribute("user", user);
      model.addAttribute("Transferlist", Transferlist);
      model.addAttribute("resultPage", resultPage);
      model.addAttribute("options", options);
      
      return "forward:/view/transfer/listMyTransfer.jsp";
   }
   
   
   
   // 예약양수 My 페이지 navigation   
   
//   @RequestMapping(value = "listMyReceive")   
//   
//   public String listMyReceive(HttpSession session, Model model) throws Exception {
//
//      System.out.println("listMyTransfer Start");
//
//      User user = (User) session.getAttribute("user");
//
//      if (user == null) {
//         return "redirect:/";
//      }
//         
//       Map<String, Object> map = new HashMap<String, Object>();
//       
//       Search search = new Search();
//           
//       if (search.getCurrentPage() == 0) {
//            search.setCurrentPage(1);
//         }
//             
//      search.setPageSize(10);
//      search.setId(user.getId()); // listMyTransfer는 search에 id를 넣는다. 
//
//      map.put("search", search);
//             
//      map = transferService.listTransfer(map);
//      
//      int TotalCount = (int) map.get("TotalCount");
//   
//      List<Transfer> Transferlist =  (List<Transfer>) map.get("list");
//      
//      Page resultPage = new Page( search.getCurrentPage(), TotalCount, pageUnit, pageSize);
//            
//      System.out.println(Transferlist);
//      
//      model.addAttribute("user", user);
//      model.addAttribute("Transferlist", Transferlist);
//      model.addAttribute("resultPage", resultPage);      
//      
//      return "forward:/view/transfer/listMyTransfer.jsp";
//   }
   
   
  // 양도양수 결제 
   @RequestMapping(value = "TransferPayment")   
   public String TransferPayment(@RequestParam(value = "receiveno", required = false) String receiveno, @RequestParam("transferor") String transferor, @RequestParam("transferPrice") String transferPrice, @RequestParam("transferno") String transferno, Model model, HttpSession session, Search search) throws Exception {

     System.out.println("listMyTransfer Start");

     User user = (User) session.getAttribute("user");

      if (user == null) {
        return "redirect:/";
     }
      
      System.out.println("transferor::"+transferor);
      System.out.println("transferPrice::"+transferPrice);
      System.out.println("transferno::"+transferno);
      System.out.println("receiveno::"+receiveno);
      System.out.println("trasnferee::"+user.getId());
      
      Payment payment = new Payment();
      
      payment.setPaymentProduct("양도양수");    
      payment.setPaymentSender(user.getId()); //보내는 사람 ID    
      payment.setPaymentReceiver(transferor);  //받는 사람 ID    
      payment.setPaymentCode("T1");     
      payment.setPaymentReferenceNum(transferno);     
      payment.setPaymentMethodSecond("point");    
      payment.setPaymentPriceTotalSecond(Integer.parseInt(transferPrice));

      paymentService.makePayment(payment);
      
      User tempUser = userService.getUser( ((User) session.getAttribute("user")).getId() );
      session.removeAttribute("user");
      session.setAttribute("user", tempUser);
      
      
      //상태값 변경
      
      //양도 결제시 양도 결제되는 양도글번호랑 양수글번호 상태를 3으로 변경하고 나머지는 양수는 4로 변경한다. 
      
      
      Receive receive = new Receive();
      Transfer transfer = new Transfer();
      
      transfer.setTransferNo(Integer.parseInt(transferno));     
      receive.setReceiveStatus(2);
      receive.setTransferNo(transfer);
      receive.setReceiveNo(Integer.parseInt(receiveno));
      
      receiveService.updateTransferStatus(receive);
           
     return "redirect:/view/transfer/listMyTransfer.jsp";
     
     
    
   }
  
  
   
 //양수신청글 add
//   
//   @RequestMapping(value = "addReceive") 
//   public String addReceive (@ModelAttribute("receive") Receive receive, String transferNoo, HttpSession session, Model model) throws Exception{
//  	 
//  	 System.out.println("addReceive:::");
//  	 System.out.println(receive);
//
//  	 Transfer transfer = new Transfer();
//
//  	 transfer.setTransferNo(Integer.parseInt(transferNoo));
//  	 receive.setTransferNo(transfer);
//  	 
//  	 User user = (User)session.getAttribute("user");
//  	 receive.setTransferee(user);
//  	 
//  	 System.out.println("receive getTransfer => "+ receive.getTransferNo());
////  	 System.out.println("receive => " + receive);
//  	 receiveService.addReceive(receive);
//  	 
//  	 System.out.println(transferNoo);
//  	 
//     model.addAttribute("transferNo", transferNoo);      
//  		
//  		return "forward:getTransfer";
//   }
   
   
   //양도수정page 네비게이션   
   
   @RequestMapping(value = "updateTransfer", method= RequestMethod.GET) 
   public String updateTransfer (@RequestParam(value = "transferNo", required = false)int transferNo, HttpSession session, Model model) throws Exception{
  	 
  	 System.out.println("updateTransfer:::");
  	 System.out.println(transferNo);
	 
  	 User user = (User)session.getAttribute("user");
  	 
     if (user == null) {
         return "redirect:/";
      }
     
     Search search = new Search();
     String id = user.getId();      
     
     if (search.getCurrentPage() == 0) {
          search.setCurrentPage(1);
       }
       
     search.setPageSize(10);
    
  	 Map<String, Object> List   = campReservationService.listMyReservation(search, id);
  	 
     List<CampReservation> list = (List<CampReservation>) List.get("list");
     
  	 
  	Transfer transfer = transferService.getTransfer(transferNo);
  	 
  	
  	System.out.println("\n\n Transfer ==>" + transfer );
  	
  	
     model.addAttribute("list", list);
     model.addAttribute("transfer", transfer);

  		
     return "forward:/view/transfer/updateTransfer.jsp";
   }
   
   
   
   
   // 예약양도수정 비즈니스
   
   @RequestMapping(value = "updateTransfer", method = RequestMethod.POST) // RequestParam의 별칭은 file type속성의 name과 맞춘다.
   public String updateTransfer(@ModelAttribute("transfer") Transfer transfer, HttpServletRequest req, HttpSession session, Model model) throws Exception {

      System.out.println("updateTransfer Post Start");
      System.out.println("transfer:::::::"+transfer);

      	 User user = (User)session.getAttribute("user");
      	 
         if (user == null) {
             return "redirect:/";
          }
                          
        transfer.setTransferOr(user);

        System.out.println("수정페이지에서 받은 수정자료 + 세션에 있는 user를 transferor에 넣는다면?"+transfer);
        
    	transferService.updateTransfer(transfer);
    	
//      반장님꺼 뭘 건드려줘야함. 
         
      return "redirect:listTransfer";
   }// 등록 method 종료 
   
   
   
   
   
   //양도삭제page 네비게이션   
   
   @RequestMapping(value = "deleteTransfer") 
   public String deleteTransfer (@RequestParam(value = "transferNo", required = false)int transferNo, HttpSession session, Model model) throws Exception{
  	 
  	 System.out.println("deleteTransfer:::");
  	 System.out.println(transferNo);
	 
  	 User user = (User)session.getAttribute("user");
  	 
     if (user == null) {
         return "redirect:/";
      }
     
     transferService.deleteTransfer(transferNo);
  	   	   		
     return "redirect:listTransfer";
   }   
   
   
   
   
   
   
   
   
   
   
   
//   //@Test 
//	 public void testUpdateTransfer() throws Exception {		
//	 
//	 Transfer transfer = transferService.getTransfer(1);
//	 
//	 transfer.setTransferTitle("코딩하느라 놀러갈 시간이 없어요"); //양도제목 1
//	 transfer.setTransferCampname("오감자");  //캠핑장명 2 
//	 transfer.setTransferMainsiteType("텐트");  //캠핑장메인시설 3 
//	 transfer.setTransferStartDate("2021-12-31");  //예약시작날짜 4 
//	 transfer.setTransferEndDate("2022-01-15");  //예약끝날짜 5 
//	 transfer.setTransferCampCall("03112345678");  //캠핑장번호 6 
//	 transfer.setTransferUserNum(5);  //예약인원 7
//	 transfer.setTransferPrice(10000);  //양도금액 8 
//	 transfer.setTransferContent("세상에 젠장 내 머리가 이렇게까지 굳었다니 놀랍다.");  //양도내용 9
//	 transfer.setTransferAddContent("언제는 말랑말랑 했었나싶기도하고 ");  //양도특이사항  10 
//	 transfer.setPaymentImg("AABBCCDDEEFFGGHHIIJJKKLL");  //결제이미지 11
//	 transfer.setHashtag1("#오감자");  //해시태그1 12
//	 transfer.setHashtag2("#오구마");  //해시태그2 13 
//	 transfer.setHashtag3("#오사과");  //해시태그3 14 
//	
//	 int TRANSFER = transferService.updateTransfer(transfer);
//	
//	System.out.println("TRANSFER:::::::::::::::::::::::::::::::::" + TRANSFER);		 
//	}
//   
 
   
   
   
   
   
   
   
   
   
   
   
     
   
}