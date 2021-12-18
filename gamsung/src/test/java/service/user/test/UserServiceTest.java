package service.user.test;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.Configuration;

import site.gamsung.service.domain.User;
import site.gamsung.service.user.UserService;

@RunWith(SpringJUnit4ClassRunner.class)

@Configuration(locations = { "classpath:config/context-*.xml" })

public class UserServiceTest {
	
	@Autowired
	@Qualifier("userServiceImpl")
	private UserService userService;

	@Test
	public void testAddUser() throws Exception{
		
		User user = new User();
		user.setId("test1@test.com");
		user.setNickName("단위테스트");
		user.setPassword("2222");
		user.setRole("GENERAL");
		user.setPhone("01022223333");
		
		userService.addUser(user);
		
		//user=userService.getUser("test1@test.com");
		
		System.out.println(user);
	}

}
