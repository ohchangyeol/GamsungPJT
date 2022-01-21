package site.gamsung.service.user.test;

import java.util.List;
import java.util.Properties;
import java.util.Random;

import javax.activation.CommandMap;
import javax.activation.DataHandler;
import javax.activation.DataSource;
import javax.activation.FileDataSource;
import javax.activation.MailcapCommandMap;
import javax.mail.Authenticator;
import javax.mail.BodyPart;
import javax.mail.Message;
import javax.mail.Multipart;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMessage.RecipientType;
import javax.mail.internet.MimeMultipart;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.web.multipart.MultipartFile;

import com.sun.mail.util.logging.MailHandler;

import site.gamsung.service.common.Search;
import site.gamsung.service.domain.User;
import site.gamsung.service.domain.UserWrapper;
import site.gamsung.service.user.UserService;
import site.gamsung.util.user.SHA256Util;
import site.gamsung.util.user.SendMailHtml;
import site.gamsung.util.user.MailAuth;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations =  {"classpath:config/context-common.xml",
//									"classpath:config/context-aspect.xml",
									"classpath:config/context-mybatis.xml",
									"classpath:config/context-transaction.xml"})
public class UserServiceTest {
	
	@Autowired
	@Qualifier("userServiceImpl")
	private UserService userService;

	//@Test
	public void testAddUser() throws Exception{
		
		User user = new User();
		
		user.setId("aa2@a.com");
		user.setNickName("나야나");
		user.setName("으어어");
		user.setPassword("aa");
		user.setRole("BUSINESS");
		user.setPhone("0099998888");
				
		userService.addUser(user);
		
		System.out.println(user.getSalt());
		System.out.println(user.getPassword());
		
		user=userService.getUser("test44@test.com");
		
		System.out.println("########### "+user);
	}
	
	//@Test
	public void testGetUser() throws Exception{
		User user= new User();
		user=userService.getUser("user2@gamsung.com");
		
		System.out.println("########### "+user);
	}
	
	//@Test
	public void testUpdateUser() throws Exception{
		
		//User user = userService.getUser("user1@gamsung.com");
		User user = userService.getUser("test11@nate.com");

		user.setName("이름변경2");
	//	user.setBusinessUserApprovalFlag("Y");
		
		userService.updateUser(user);
		//user=userService.getUser("test88@test.com");

		//user=userService.getUser("businessuser2@gamsung.com");
		System.out.println(user);

	}
	
	//@Test
	public void testListUserAll() throws Exception{
		
		Search search = new Search();
				
		UserWrapper userWrapper=userService.listUser(search);
		
		List<User> list = userWrapper.getUsers();
		Integer totalCount = userWrapper.getTotalCount();
		
		search.setCurrentPage(1);
	 	search.setPageSize(10);
		
		userWrapper = userService.listUser(search);
		
		list = userWrapper.getUsers();
		totalCount = (Integer)userWrapper.getTotalCount();	
		
		System.out.println(list);
		System.out.println(totalCount);
	}
	
	//@Test
	public void testListUserByRole() throws Exception{
		Search search = new Search();
		search.setCurrentPage(1);
		search.setPageSize(5);
		
		UserWrapper userWrapper=userService.listUser(search);
		
		List<User> list = userWrapper.getUsers();
		Integer totalCount = userWrapper.getTotalCount();
		
		search.setCurrentPage(1);
	 	search.setPageSize(5);
	 	search.setSearchCondition("3");
	 	//search.setSearchKeyword("");
		
		userWrapper = userService.listUser(search);
		
		list = userWrapper.getUsers();
		totalCount = (Integer)userWrapper.getTotalCount();	
		
		System.out.println(list);
		System.out.println(totalCount);
	}
	
	//@Test
	public void testCheckDuplication() throws Exception{
		
		User user = new User();
		user.setId("user1@gamsung.com");
		System.out.println(user);
		
		int result=userService.checkDuplication(user);
		
		System.out.println(result);
	}
	
	@Test
	public void testUpdatePassword() throws Exception{
		

		User user = userService.getUser("user11@gamsung.com");
		System.out.println(user);

		user.setPassword("11111111");
		
		userService.updateUser(user);
		
	}
	
	//@Test
//	public void testUpdateTempPassword() throws Exception{
//		
//		User user = new User();
//		String id = "muse1264@nate.com";
//		user = userService.getUser(id);
//		if(user.getSalt()==null || user.getSalt()=="") {
//			String newSalt=SHA256Util.generateSalt();
//			System.out.println(newSalt);
//			user.setSalt(newSalt);
//			userService.updateUser(user);
//			System.out.println(user);
//		}else {
//		
//		System.out.println(user);
//		System.out.println(user.getSalt());
//		}
//		userService.updateTempPassword(user);
//		
//	}
	
	//@Test
		public void testSendPhoneAuthNum() throws Exception{
			
			User user = new User();
			user=userService.getUser("muse1264@nate.com");
			
			Random rand  = new Random();
	        
	        String numStr = "";
	        
	        for(int i=0; i<4; i++) {
	        	
	            String num = Integer.toString(rand.nextInt(10));
	            
	            numStr += num;
	        }	   
	        
	        userService.sendPhoneAuthNum(user.getPhone(), numStr);	
		}
		
		//@Test
		public void testFindId() throws Exception{
			
			System.out.println("findId 시작");
			
			User user = new User();
			user.setName("비번14");
			user.setPhone("01001153333");
			
			System.out.println(user.getName());
			
			user.setId(userService.findId(user.getName(), user.getPhone()));
			
			System.out.println(user.getId());	
		}
		
		//@Test
		public void testFindPassword() throws Exception{
			
			User user = new User();
			user.setId("muse1264@nate.com");
			user.setName("으어어");
			user.setPhone("01001123333");
			
			userService.findPassword(user);
			
			System.out.println(user);
			
		}
		
		//@Test
		public void testAddSuspensionUser() throws Exception{
			 
			User user = new User();
			user.setId("user1@gamsung.com");
			user.setSuspensionContent("~~한 사유로 이용정지 됨");
			
			userService.addSuspensionUser(user);
			
		}
		
		//@Test
		public void testUpdateDormantGeneralUserConver() throws Exception{
			 
			User user = new User();
			user.setId("TEST@TEST.COM");
			
			userService.updateDormantGeneralUserConvert(user.getId());	
		}
		
		// @Test
		    public void sendMailTest() throws Exception{
			 Properties prop = System.getProperties();
			 
			 // 로그인시 TLS를 사용할 것인지 설정
				prop.put("mail.smtp.starttls.enable", "true");
		        
				// 이메일 발송을 처리해줄 SMTP서버
				prop.put("mail.smtp.host", "smtp.gmail.com");
		        
				// SMTP 서버의 인증을 사용한다는 의미
				prop.put("mail.smtp.auth", "true");
		        
				// TLS의 포트번호는 587이며 SSL의 포트번호는 465이다.
				prop.put("mail.smtp.port", "587");
				
				prop.put("mail.transport.protocol", "smtp");
				prop.put("mail.debug", "true");
				
				// soket문제와 protocol문제 해결
				prop.put("mail.smtp.ssl.trust", "smtp.gmail.com");
//				prop.put("mail.smtp.socketFactory.fallback", "false");
				prop.put("mail.smtp.ssl.protocols", "TLSv1.2");

				Authenticator auth = new MailAuth();
			
		        String subject = "test 메일";
		        //String content = "<h4>안녕하세요.</h4>" + "<img src='cid:images/addBusinessUserImg.png' alt =''>";
		        String from = "gamsungsite@gmail.com";
		        String to = "muse1264@nate.com";
		        Session session = Session.getDefaultInstance(prop, auth);
		        Transport transport = session.getTransport();
		        MimeMessage message = new MimeMessage(session);
		        message.setSubject(subject);
		        message.setFrom(new InternetAddress(from));
		        message.setRecipient(Message.RecipientType.TO, new InternetAddress(to));
		        
		        MimeMultipart multipart = new MimeMultipart("related");
//		        BodyPart messageBodyPart = new MimeBodyPart();
		        MimeBodyPart messageBodyPart = new MimeBodyPart();
		        
		        //String html = "<h3>안녕하세요</h3>\n";

		        String htmlText="<h3>안녕하세요</h3>\\n<img src=\"cid:image\">";
		      //  messageBodyPart.setContent(html, "text/html; charset=UTF-8");
		       // messageBodyPart.setContent(htmlText, "text/html");
		        messageBodyPart.setContent(htmlText, "text/html; charset=UTF-8");
		        multipart.addBodyPart(messageBodyPart);
		        
		        messageBodyPart=new MimeBodyPart();
		        DataSource fds=new FileDataSource("C:\\Users\\muse1\\OneDrive\\바탕 화면\\메인프로젝트\\KakaoTalk_20220113_170026607.jpg");
		        messageBodyPart.setDataHandler(new DataHandler(fds));
		        messageBodyPart.setHeader("Content-ID", "<image>");
		        
		        multipart.addBodyPart(messageBodyPart);
		        message.setContent(multipart);
		        transport.connect();
		        transport.sendMessage(message, message.getRecipients(Message.RecipientType.TO));
		        
		        transport.close();
		        
//		        try {
//		            MimeMessage mail = new MimeMessage(session);
//		            MimeMessageHelper mailHelper = new MimeMessageHelper(mail,true,"UTF-8");
//		            
//		            mailHelper.setFrom(from);
//		            mailHelper.setTo(to);
//		            mailHelper.setSubject(subject);
//		            mailHelper.setText(content, true);
//		           
//		            Transport.send(mail);
//		            
//		        } catch(Exception e) {
//		            e.printStackTrace();
//		        }
		        
		    }
		    
		  //  @Test
//		    public void TestSendMail() throws Exception{
//		    	SendMailHtml mail = new SendMailHtml();
//		    	String info = "[감성캠핑] 가입승인이 완료되었습니다.";
//				String text = "<img src=\\\"cid:image\\\"><div class=\"container\" style=\"width: 500px;font-family: 'Noto Sans KR', sans-serif; text-align: center; font-weight: 400;\">\r\n"
//						+ "    <div class=\"gamsung-title\" style=\"height: 100px;font-size: 36px;border-top: 1px solid #ddd;border-bottom: 1px solid #ddd; padding: 15px; box-sizing: border-box; font-weight: 700; margin-bottom: 15px;color: rgb(42, 99, 65);\">감성캠핑</div>\r\n"
//						+ "    <div class=\"color-text\">안녕하세요 감성캠핑입니다~</div>\r\n"
//						+ "    <div>가입승인이 왼료되었습니다:)</div>\r\n"
//						+ "    <div>승인이 완료되어 사이트 이용이 가능합니다 감사합니다~</div>\r\n"
//						+ "    <a href=\"http://127.0.0.1:8080\"><button class=\"w-btn-outline w-btn-green-outline\" type=\"button\" style=\"border: 3px solid #77af9c; color: darkgray; position: relative;\r\n"
//						+ "padding: 15px 30px; border-radius: 15px; font-family: 'paybooc-Light', sans-serif; box-shadow: 0 15px 35px rgb(0 0 0 / 20%);\r\n"
//						+ "text-decoration: none; font-weight: 600; transition: 0.25s; margin: 20px; box-sizing: border-box;\">감성캠핑 바로가기</button></a>";
//		    	mail.sendMailHtml("muse1264@nate.com", info, text);
//		    }
//		
		
	
}

