package site.gamsung.service.user.test;

import java.util.List;
import java.util.Random;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import site.gamsung.service.common.Search;
import site.gamsung.service.domain.User;
import site.gamsung.service.domain.UserWrapper;
import site.gamsung.service.user.UserService;
import site.gamsung.util.user.SHA256Util;


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
		
		user.setId("test55@nate.com");
		user.setNickName("나야나");
		user.setName("으어어");
		user.setPassword("a");
		user.setRole("BUSINESS");
		user.setPhone("01001123333");
				
		userService.addUser(user);
		
		System.out.println(user.getSalt());
		System.out.println(user.getPassword());
		
		user=userService.getUser("test44@test.com");
		
		System.out.println("########### "+user);
	}
	
	//@Test
	public void testGetUser() throws Exception{
		User user= new User();
		user=userService.getUser("test1@test.com");
		
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
		search.setCurrentPage(1);
		search.setPageSize(5);
		
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
		userService.checkDuplication(user);
	}
	
	//@Test
	public void testUpdatePassword() throws Exception{
		
		User user = userService.getUser("test8@test.com");
		user.setPassword("3333");
		
		userService.updateUser(user);
		
	}
	
	@Test
	public void testUpdateTempPassword() throws Exception{
		
		User user = new User();
		String id = "businessuser1@gamsung.com";
		user = userService.getUser(id);
		if(user.getSalt()==null) {
			SHA256Util salt=new SHA256Util();
			String newSalt=salt.generateSalt();
			user.setSalt(newSalt.toString());
			userService.updateUser(user);
		}else {
		
		System.out.println(user);
		System.out.println(user.getSalt());
		}
		userService.updateTempPassword(user);
		
	}
	
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
		
		
	
}

