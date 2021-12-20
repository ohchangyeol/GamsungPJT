package site.gamsung.service.user.test;

import java.util.Map;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import site.gamsung.service.common.Search;
import site.gamsung.service.domain.User;
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
		user.setId("test88@test.com");
		user.setNickName("닉네임");
		user.setName("이름");
		user.setPassword("2222");
		user.setRole("GENERAL");
		user.setPhone("01022223333");
		
		userService.addUser(user);
		
		//user=userService.getUser("test1@test.com");
		
		System.out.println("########### "+user);
	}
	
	//@Test
	public void testGetUser() throws Exception{
		User user= new User();
		user=userService.getUser("test88@test.com");
		
		System.out.println("########### "+user);
	}
	
	@Test
	public void testUpdateUser() throws Exception{
		
		User user = userService.getUser("user1@gamsung.com");
		
		user.setName("이름변경2");
		
		userService.updateUser(user);
		
		//user=userService.getUser("test88@test.com");
	}
	
	//@Test
	public void testListUserAll() throws Exception{
		
		Search search = new Search();
		search.setCurrentPage(1);
		search.setPageSize(1);
		Map<String, Object> map = userService.listUser(search);
		
		//List<Object> list = (List<Object>)map.get("list");
		
	
	}

}
