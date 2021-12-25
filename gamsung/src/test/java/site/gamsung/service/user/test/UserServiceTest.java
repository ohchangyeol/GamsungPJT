package site.gamsung.service.user.test;

import java.util.List;

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
		user.setId("test11@nate.com");
		user.setNickName("임시1");
		user.setName("비번11");
		user.setPassword("2222");
		user.setRole("GENERAL");
		user.setPhone("01001113333");
				
		userService.addUser(user);
		
		System.out.println(user.getSalt());
		System.out.println(user.getPassword());
		
		//user=userService.getUser("test1@test.com");
		
		System.out.println("########### "+user);
	}
	
	//@Test
	public void testGetUser() throws Exception{
		User user= new User();
		user=userService.getUser("businessuser1@gamsung.com");
		
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
	
	//@Test
	public void testUpdateTempPassword() throws Exception{
		
		User user = new User();
		String id = "muse1264@nate.com";
		user = userService.getUser(id);
		
		System.out.println(user);
		System.out.println(user.getSalt());
		
		userService.updateTempPassword(user);
	}
	
}
