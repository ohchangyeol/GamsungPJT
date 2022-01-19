package site.gamsung.common.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import site.gamsung.service.domain.User;


/*
 * FileName : LogonCheckInterceptor.java
 *  ㅇ Controller 호출전 interceptor 를 통해 선처리/후처리/완료처리를 수행
 *  	- preHandle() : Controller 호출전 선처리   
 * 			(true return ==> Controller 호출 / false return ==> Controller 미호출 ) 
 *  	- postHandle() : Controller 호출 후 후처리
 *    	- afterCompletion() : view 생성후 처리
 *    
 *    ==> 로그인한 회원이면 Controller 호출 : true return
 *    ==> 비 로그인한 회원이면 Controller 미 호출 : false return
 */
public class LogonCheckInterceptor extends HandlerInterceptorAdapter {

	///Field
	
	///Constructor
	public LogonCheckInterceptor(){
		System.out.println("\nCommon :: "+this.getClass()+"\n");		
	}
	
	///Method
	public boolean preHandle(	HttpServletRequest request,
								HttpServletResponse response, 
								Object handler) throws Exception {
		
		System.out.println("\n[ LogonCheckInterceptor start........]");
		
		//==> 로그인 유무확인
		HttpSession session = request.getSession();
		User user = (User)session.getAttribute("user");
		
		String uri = request.getRequestURI();
		System.out.println("uri : "+uri);
		
		//==> 로그인한 회원이라면...
		if(   user != null   )  {
			//==> 로그인 상태에서 접근 불가 URI
			System.err.println("인터셉터 user"+user);
//			if(user.getSnsId()!=null) {
//				System.out.println("인터셉터 카카오 맞는지"+user.getSnsId());
//				if(uri.indexOf("addUser") != -1) {
//					return true;
//				}
//			}
			
			if(		uri.indexOf("addUser") != -1 ||	uri.indexOf("login") != -1 		|| 
					uri.indexOf("kakaoCallback") != -1 ){
				request.getRequestDispatcher("/").forward(request, response);
				System.out.println("[ 로그인 상태.. 로그인 후 불필요 한 요구.... ]");
				System.out.println("[ LogonCheckInterceptor end........]\n");
				return false;
			}
			
			System.out.println("[ 로그인 상태 ... ]");
			System.out.println("[ LogonCheckInterceptor end........]\n");
			return true;
		}else{ //==> 미 로그인한 화원이라면...
			//==> 로그인 시도 중.....			

			if(		uri.indexOf("addUser") != -1 || uri.indexOf("sendEmailAuthNum") != -1 || uri.indexOf("findIdPhoneAuthNum") != -1 || uri.indexOf("login") != -1 || uri.indexOf("checkIdPassword") != -1 
					|| uri.indexOf("checkDuplication") != -1 || uri.indexOf("findId") != -1 || uri.indexOf("sendPhoneAuthNum") != -1 || uri.indexOf("updateDormantGeneralUserConvert") != -1
					|| uri.indexOf("findPassword") != -1 || uri.indexOf("getKakaoAuthUrl") != -1 || uri.indexOf("kakaoCallback") != -1 
					|| uri.indexOf("listCamp") != -1 || uri.indexOf("getCamp") != -1 || uri.indexOf("getCampNotice") != -1  || uri.indexOf("addBusinessUser") != -1 
					|| uri.indexOf("listCampQna") != -1 || uri.indexOf("listCampRatingReview") != -1 || uri.indexOf("listCampNotice") != -1 || uri.indexOf("getCampQna") != -1 
					|| uri.indexOf("listAdminAuctionProduct") != -1 || uri.indexOf("listAuctionProduct") != -1 || uri.indexOf("listWaitAuctionProduct") != -1 || uri.indexOf("infiniteScroll") != -1 || uri.indexOf("autoComplete") != -1 
					|| uri.indexOf("naverShoppingAPI") != -1 || uri.indexOf("video") != -1 || uri.indexOf("getAuctionProduct") != -1 || uri.indexOf("listAuctionRatingReview") != -1 
					|| uri.indexOf("realtime") != -1 || uri.indexOf("app") != -1 || uri.indexOf("topic") != -1 ) {
				System.out.println("[ 로그 시도 또는 비회원 접근가능 루트 .... ]");
				System.out.println("[ LogonCheckInterceptor end........]\n");
				return true;
			}
			
			request.getRequestDispatcher("/").forward(request, response);
			System.out.println("[ 로그인 이전 ... ]");
			System.out.println("[ LogonCheckInterceptor end........]\n");
			return false;
		}
		
		
		
		
		
		
		
		
	}
}//end of class