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
import org.springframework.web.multipart.MultipartFile;

import site.gamsung.service.camp.CampReservationService;
import site.gamsung.service.common.Page;
import site.gamsung.service.common.Search;
import site.gamsung.service.community.CommunityService;
import site.gamsung.service.domain.Camp;
import site.gamsung.service.domain.CampReservation;
import site.gamsung.service.domain.Post;
import site.gamsung.service.domain.Transfer;
import site.gamsung.service.domain.User;
import site.gamsung.service.transfer.TransferService;


@RequestMapping("/transfer/*")
@Controller
public class TransferController {
	
	
	@Autowired
	@Qualifier("transferServiceImpl")
	private TransferService transferService;	
	
	
	
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
		 		 
		 Map<String, Object> List	= campReservationService.listMyReservation(search, id);

		 
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
			
//			ArrayList<String> imgs = new ArrayList<String>();
			
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

//					imgs.add(storedFileName);
				
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

//			transfer.setPaymentImg(imgs);
			
			User user = (User) session.getAttribute("user");
			
			
			
			transfer.setTransferOr(user);

			transferService.addTransfer(transfer);

//		반장님꺼 뭘 건드려줘야함. 
			
		return "redirect:listTransfer";
	}// 등록 method 종료
	
	
	
	// 예약양도 목록 페이지 navigation	
	@RequestMapping(value = "listTransfer")	
	public String listTransfer(HttpSession session, Model model) throws Exception {

		System.out.println("listTransfer Start");

		User user = (User) session.getAttribute("user");

		if (user == null) {
			return "redirect:/";
		}
		
		 Map<String, Object> map = new HashMap<String, Object>();
		 
		 Search search = new Search();
		 	 
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
	public String getTransfer(@RequestParam("transferNo") int transferNo, HttpSession session, Model model) throws Exception {

		System.out.println("getTransfer Start");

		User user = (User) session.getAttribute("user");

		if (user == null) {
			return "redirect:/";
		}
					
		 Transfer transfer = transferService.getTransfer(transferNo);
			
		model.addAttribute("user", user);
		model.addAttribute("transfer", transfer);

		return "forward:/view/transfer/getTransfer.jsp";
	}
	
	 
	/*
	 * if 문으로 reservationno가 있으면 예약테이블을 건드리는 함수 실행 +
	 */
	/*
	 * TransferService transferService = new TransferService();
	 * 
	 * int TRANSFER = transferService.addTransfer(transfer);
	 */

}
