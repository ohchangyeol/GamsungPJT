package site.gamsung.controller.user;

import java.io.File;
import java.io.PrintWriter;
import java.time.LocalDate;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import site.gamsung.service.common.Page;
import site.gamsung.service.common.Search;
import site.gamsung.service.domain.User;
import site.gamsung.service.domain.UserWrapper;
import site.gamsung.service.user.UserService;

@Controller
@RequestMapping("/user/*")
public class UserController {

	/// Field
	@Autowired
	@Qualifier("userServiceImpl")
	private UserService userService;

	public UserController() {
	}

	@Value("#{commonProperties['pageUnit']}")
	int pageUnit;
	@Value("#{commonProperties['pageSize']}")
	int pageSize;

	@RequestMapping(value = "addUser", method = RequestMethod.GET)
	public String addUser() throws Exception {

		System.out.println("/user/addUser:GET");

		return "forward:/view/user/addGeneralUser.jsp";
	}

	@RequestMapping(value = "addBusinessUser", method = RequestMethod.GET)
	public String addBusinessUser() throws Exception {

		System.out.println("/user/addBusinessUser:GET");

		return "forward:/view/user/addBusinessUser.jsp";
	}
	
	@RequestMapping(value = "addUser", method = RequestMethod.POST)
	public String addUser(@ModelAttribute("user") User user, MultipartFile businessImg, HttpSession session) {

		System.out.println("/user/addUser:POST");
	
		// user.setRole("GENERAL");
		System.out.println("user role"+user.getRole());
		if(user.getRole().equals("GENERAL")) {
			if(session.getAttribute("kakaoUser")!=null) {
				User kakaoUser = (User)session.getAttribute("kakaoUser");
				System.out.println("카카오유저 snsid"+kakaoUser.getSnsId());
				user.setSnsId(kakaoUser.getSnsId());
			}
			userService.addUser(user);
		}else {
			MultipartFile multpartfile=businessImg;
			String originalImg = multpartfile.getOriginalFilename();
			if(originalImg != null && originalImg !="") {
				//확장자 명만 추출
				String originalFileExtension = originalImg.substring(originalImg.lastIndexOf("."));
				
				String rootPath=session.getServletContext().getRealPath("/");
				System.out.println(rootPath);
				String attachPath="uploadfiles/userBusinessImg/";
				String storedFileName=UUID.randomUUID().toString().replaceAll("-", "")+originalFileExtension;
				
				System.out.println("rootPath :"+rootPath);
				System.out.println("attachPath :"+attachPath);
				System.out.println("storedFileName :"+storedFileName);
				
				File file = new File(rootPath+attachPath+storedFileName);
				
				System.out.println("file :"+file);
				try {	
				multpartfile.transferTo(file);
				
				user.setCampBusinessImg(storedFileName);
				
				userService.addUser(user);
				}catch(Exception e) {
					e.printStackTrace();
				}
			}
		}

		

		return "redirect:/";
	}

	@RequestMapping(value = "getUser", method = RequestMethod.GET)
	public String getUser(@ModelAttribute("userId") String id, Model model, HttpSession session) {

		System.out.println("/user/getUser:GET");

		User user = userService.getUser(id);
		User sessionUser = (User) session.getAttribute("user");

		model.addAttribute("user", user);

		if (session.getAttribute("user") == null) {
			return "/";
		}
		System.out.println(sessionUser.getRole());
		if (sessionUser.getRole().equals("ADMIN")) {
			if (user.getRole().equals("GENERAL")) {
				return "forward:/view/user/getGeneralUserUpdateAdmin.jsp";
			} else {
				return "forward:/view/user/getBusinessUserUpdateAdmin.jsp";
			}
		} else {
			if (user.getRole().equals("GENERAL")) {
				return "forward://user/myPage";
			} else {
				return "forward:/view/user/getBusinessUserUpdate.jsp";
			}
		}
	}

	@RequestMapping(value = "updateUser", method = RequestMethod.GET)
	public String updateUser(@RequestParam("id") String id, Model model) {

		System.out.println("/user/updateUser : GET");

		User user = userService.getUser(id);

		model.addAttribute("user", user);

		return "forward:/user/myPage";

	}

	@RequestMapping(value = "updateUser", method = RequestMethod.POST)
	public String updateUser(@ModelAttribute("user") User user, Model model, HttpSession session) {

		System.out.println("/user/updateUser : POST");

		System.out.println("입력된 User" + user);

		User dbUser = userService.getUser(user.getId());

		System.out.println("디비유저" + dbUser);
		System.out.println("유저 솔트값" + user.getSalt());
		System.out.println("유저 비밀번호" + user.getPassword());

		if (dbUser.getId().equals(user.getId())) {
			System.out.println("이프문 안이다");
			if (user.getPassword() == null || user.getPassword() == "") {
				System.out.println("패스워드가 널이다");
				user.setPassword(dbUser.getPassword());
				user.setSalt(dbUser.getSalt());
				System.out.println("db패스워드"+dbUser.getPassword());
			} else{
				System.out.println("널이 아니다");
				user.setPassword(user.getPassword());
				user.setSalt(dbUser.getSalt());
			}
			if(user.getCampBusinessImg()==null) {
				if(user.getCampBusinessImg()!=null) {
					System.out.println("캠프 이미지"+user.getCampBusinessImg());
				user.setCampBusinessImg(user.getCampBusinessImg());
			}
		}
		
		}

		userService.updateUser(user);

		// User upUser=userService.getUser(user.getId());

		User sessionUser = (User) session.getAttribute("user");

		model.addAttribute("user", user);

		if (session.getAttribute("user") == null) {
			return "/";
		}
		System.out.println(sessionUser.getRole());
		if (sessionUser.getRole().equals("ADMIN")) {
			if (user.getRole().equals("GENERAL")) {
				System.out.println("user role"+user.getRole());
				return "forward:/view/user/getGeneralUserUpdateAdmin.jsp";
			} else {
				return "forward:/view/user/getBusinessUserUpdateAdmin.jsp";
			}
		} else {
			session.setAttribute("user", user);
			if (user.getRole().equals("GENERAL")) {
				return "forward:/view/common/myPage.jsp";
			} else if(user.getRole().equals("BUSINESS")){
				return "forward:/view/user/getBusinessUserUpdate.jsp";
			}else {
				return "forward:/view/user/adminMyPage.jsp";
			}
		}

	}

	@RequestMapping(value = "login", method = RequestMethod.GET)
	public String login() throws Exception {

		System.out.println("/user/logon : GET");

		return "/";
	}

	@RequestMapping(value = "login", method = RequestMethod.POST)
	public String login(@ModelAttribute("user") User user, HttpSession session, HttpServletRequest req) {

		System.out.println("/user/login : POST");
		// Business Logic
		System.out.println(user);
		User dbUser = userService.getUser(user.getId());

		if (dbUser == null) {
			return "forward:/view/user/addGeneralUser.jsp";
		}


		System.out.println(dbUser);
		LocalDate now = LocalDate.now();
		String regDate = now.toString();
		Date currentDate = dbUser.getCurrentLoginRegDate();

		if (dbUser.getRole().equals("ADMIN")) {
			session.setAttribute("user", dbUser);
			return "forward:/admin";
		}

		String jsp = "/";

		if (dbUser != null) {
			System.out.println("로그인 시작");

			// 비밀번호를 확인하세요 있어야됨.

			if (dbUser.getNickName() != null) {
				jsp = "redirect:/";
			} else if (dbUser.getBusinessUserApprovalFlag() != null
					&& dbUser.getBusinessUserApprovalFlag().equals("Y")) {
				jsp = "redirect:/campBusiness/goSubMainCampBusiness";
			}
		}

		if (!(currentDate != null && regDate.equals(currentDate.toString()))) {
			userService.addLoginDate(dbUser);
		}

		session.setAttribute("user", dbUser);
		// System.out.println("컨트롤러에서 세션에 담기나"+(User)session.getAttribute("user"));
		return jsp;
	}

	@RequestMapping(value = "logout", method = RequestMethod.GET)
	public String logout(HttpSession session) {

		System.out.println("/user/logout : GET");

		System.out.println("세션에 담긴 토큰값"+(String) session.getAttribute("kakaoToken"));
		if ((String) session.getAttribute("kakaoToken") != null) {
			System.out.println("카카오 로그아웃시 토큰값"+session.getAttribute("kakaoToken"));
			userService.kakaoLogout((String) session.getAttribute("kakaoToken"));
		}
		session.invalidate();

		return "redirect:/";

	}

	@RequestMapping(value = "getKakaoAuthUrl", method = RequestMethod.GET)
	public @ResponseBody String getKakaoAuthUrl(HttpServletRequest request) {
		String reqUrl = "https://kauth.kakao.com/oauth/authorize"
				+ "?client_id=5069ddcbe63e1882c2df7cc176f1a96f"
				+ "&redirect_uri=http://localhost:8080/user/kakaoCallback"
				+ "&response_type=code";

		return reqUrl;
	}

	// 카카오 연동정보 조회
	@RequestMapping(value = "kakaoCallback")
	public String oauthKakao(@RequestParam(value = "code", required = false) String code, Model model,HttpSession session, HttpServletResponse res) {

		System.out.println("#########" + code);
		String accessToken = userService.getAccessToken(code);
		System.out.println("###access_Token#### : " + accessToken);

		HashMap<String, Object> userInfo = userService.getUserInfo(accessToken);
		System.out.println("###access_Token#### : " + accessToken);

		if((String) userInfo.get("email")==null) {
			userService.kakaoUnlink(accessToken);
			return "/";
		}else {		
		String email = (String) userInfo.get("email");
		System.out.println("###userInfo#### : " + userInfo.get("email"));
		System.out.println("###nickname#### : " + userInfo.get("nickname"));
		System.out.println("###sns_id#### : " + userInfo.get("snsId"));

		JSONObject kakaoInfo = new JSONObject(userInfo);
		model.addAttribute("kakaoInfo", kakaoInfo);
		System.out.println("카카오 인포" + kakaoInfo);
		User userEmail = userService.getUser(email);

			if (accessToken != null) {
				session.setAttribute("kakaoToken", accessToken);
			}

			if (userEmail == null) {
				User user = new User();
				if(userInfo.get("email")!=null) {
				user.setId(userInfo.get("email").toString());
				}
				user.setNickName(userInfo.get("nickname").toString());
				user.setSnsId(userInfo.get("snsId").toString());
				session.setAttribute("kakaoUser", user);
				return "forward:/view/user/addKakaoUser.jsp";
			} else {
				if (email.equals(userService.getUser(email).getId())) {
	
					if (userEmail.getSnsId() != null && userEmail.getSecessionRegDate() == null) {
						session.setAttribute("user", userEmail);
						return "redirect:/";
					}
				}
		}
	}
//		}catch(Exception e) {
//			e.printStackTrace();
//		}
		return "forward:/view/user/addKakaoUser.jsp";
	}


	@RequestMapping(value = "listUser/{info}")
	public String listUser(@ModelAttribute("search") Search search, Model model, HttpServletRequest request,
			@PathVariable("info") String info) throws Exception {

		System.out.println("/user/listUser : GET / POST");

		if (search.getCurrentPage() == 0) {
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);
		System.out.println("리스트 서치" + search);
		System.err.println(info);

		UserWrapper userWrapper = new UserWrapper();

		if (info.equals("list")) {

			System.out.println("이용중회원 리스트");
			// Business logic 수행
			userWrapper = userService.listUser(search);

		} else if (info.equals("reportSuspension")) {

			System.out.println("신고이용정지 리스트");
			userWrapper = userService.reportSuspencionListUser(search);

		} else if (info.equals("dormant")) {

			System.out.println("휴면 리스트");
			userWrapper = userService.dormantListUser(search);

		} else if (info.equals("secession")) {

			System.out.println("탙퇴 리스트");
			userWrapper = userService.secessionListUser(search);
		}

		List<User> list = userWrapper.getUsers();
		Integer totalCount = userWrapper.getTotalCount();

		list = userWrapper.getUsers();
		totalCount = (Integer) userWrapper.getTotalCount();
		Page resultPage = new Page(search.getCurrentPage(), totalCount, pageUnit, pageSize);

		System.out.println(list);
		System.out.println(totalCount);

		// Model 과 View 연결
		model.addAttribute("list", list);
		model.addAttribute("resultPage", resultPage);
		model.addAttribute("search", search);
		model.addAttribute("info", info);

		return "forward:/view/user/listUser.jsp";
	}

	@RequestMapping(value = "mypage", method = RequestMethod.GET)
	public String mypage() {

		System.out.println("/user/mypage : GET");

		return "forward:/view/common/myPage.jsp";

	}
	
	@RequestMapping(value = "adminMypage", method = RequestMethod.GET)
	public String adminMypage() {

		System.out.println("/user/adminMypage : GET");

		return "forward:/view/user/adminMyPage.jsp";

	}
	
//	@RequestMapping(value = "findIdPhoneAuthNum", method = RequestMethod.POST)
//	public String findIdPhoneAuthNum(@RequestBody User user, Model model) {
//
//		try {
//			String userId = userService.findId(user.getName(), user.getPhone());
//			if (userId == null) {
//				return "redirect:./addUser";
//			}
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//
//		model.addAttribute("phone", user.getPhone());
//		return "forward:./sendPhoneAuthNum";
//	}

}
