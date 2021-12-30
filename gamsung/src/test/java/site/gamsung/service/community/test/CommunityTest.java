package site.gamsung.service.community.test;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.junit.Assert;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import site.gamsung.service.common.Search;
import site.gamsung.service.community.CommunityService;
import site.gamsung.service.domain.Comment;
import site.gamsung.service.domain.Post;
import site.gamsung.service.domain.PostConcern;
import site.gamsung.service.domain.User;

/*
 *	FileName :  CommunityTest.java
 * ㅇ JUnit4 (Test Framework) 과 Spring Framework 통합 Test( Unit Test)
 * ㅇ Spring 은 JUnit 4를 위한 지원 클래스를 통해 스프링 기반 통합 테스트 코드를 작성 할 수 있다.
 * ㅇ @RunWith : Meta-data 를 통한 wiring(생성,DI) 할 객체 구현체 지정
 * ㅇ @ContextConfiguration : Meta-data location 지정
 * ㅇ @Test : 테스트 실행 소스 지정
 */

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "classpath:config/context-common.xml", "classpath:config/context-mybatis.xml",
		"classpath:config/context-transaction.xml" })
public class CommunityTest {
	// ==>@RunWith,@ContextConfiguration 이용 Wiring, Test 할 instance DI

	@Autowired
	@Qualifier("communityServiceImpl")
	private CommunityService communityService;

	// @Test
	public void testAddPost() throws Exception {

		Post post = new Post();
		User user = new User();
		post.setHashtag1("오");
		post.setHashtag2("창");
		post.setHashtag3("열");
		post.setPostContent("잘생겼다귀엽다멋지다최고다");
		post.setPostType(2);

		user.setId("user2@gamsung.com");
		post.setWriter(user);

		int POST = communityService.addPost(post);

		post = communityService.getPost(27);

		System.out.println("POST:" + POST);

		System.out.println(post);

		// ==> API 확인

		Assert.assertEquals("오", post.getHashtag1());
		Assert.assertEquals("창", post.getHashtag2());
		Assert.assertEquals("열", post.getHashtag3());
		Assert.assertEquals("잘생겼다귀엽다멋지다최고다", post.getPostContent());
		Assert.assertEquals(2, post.getPostType());
		Assert.assertEquals("user2@gamsung.com", post.getWriter().getId());
	}

	// @Test
	public void testUpdatePost() throws Exception {

		Post post = communityService.getPost(27);
		User user = new User();

		post.setHashtag1("빛");
		post.setHashtag2("창");
		post.setHashtag3("열");
		post.setPostContent("최고의선생님뇌가섹시한게최고야");
		post.setPostType(2);
		user.setId("user2@gamsung.com");
		post.setWriter(user);

		communityService.updatePost(post);

		post = communityService.getPost(27);

		System.out.println("post:::::::::::::::::::::::::::::::::" + post);

		// ==> API 확인
		Assert.assertEquals("빛", post.getHashtag1());
		Assert.assertEquals("창", post.getHashtag2());
		Assert.assertEquals("열", post.getHashtag3());
		Assert.assertEquals("최고의선생님뇌가섹시한게최고야", post.getPostContent());
		Assert.assertEquals(2, post.getPostType());
		Assert.assertEquals("user2@gamsung.com", post.getWriter().getId());

	}

	//@Test
	public void testListPost() throws Exception {

		HashMap<String, Object> map = new HashMap<String, Object>();

		Search search = new Search();
		search.setCurrentPage(1);
		search.setPageSize(10);
		map.put("userId", "user2@gamsung.com");
		map.put("search", search);

		 List<Post> list = communityService.listPost(map);

		 //==> console 확인
		System.out.println("list::::::::::::::::"+list);


	
		System.out.println("=======================================");
		
		search.setCurrentPage(1); 
		search.setPageSize(10);
		search.setSearchCondition("3"); 
		search.setSearchKeyword("강아지");
		
		Post post = new Post();
		post.setPostType(2);
		map.put("userId", "user2@gamsung.com");
		map.put("search", search);
		map.put("post",post);
				 
		List<Post> list2 = communityService.listPost(map);
		 		 
		System.out.println("list(2)::::::::::"+list2);
		
	}

	// @Test
	public void testAddComment() throws Exception {

		Comment comment = new Comment();
		User user = new User();
		Post post = new Post();

		comment.setCommentContent("똥강아지");

		post.setPostNo(1);
		comment.setPostNo(post);
		user.setId("user2@gamsung.com");
		comment.setCommentWriter(user);

		int COMMENT = communityService.addComment(comment);

		System.out.println("COMMETN:::::" + COMMENT);

	}

	// @Test
	public void testAddConcern() throws Exception {

		int postNo = 1;
		String userId = "user5@gamsung.com";
		String concernType = "insert";

		int CONCERN = communityService.updateConcern(postNo, userId, concernType);

		System.out.println("CONCERN:::::" + CONCERN);

	}

	// @Test
	public void testListComment() throws Exception {

		int postNo = 1;

		List<Comment> Comment = communityService.listComment(postNo);

		System.out.println("Comment::::" + Comment);

	}

	// @Test
	public void testDeletePost() throws Exception {

		int blind = communityService.blindPost(7);
		int delete = communityService.deletePost(8);

		System.out.println("blind::::" + blind);
		System.out.println("delete::::" + delete);

	}

	// @Test
	public void testUpdateComment() throws Exception {

		Comment comment = new Comment();
		comment.setCommentContent("배고프다");
		comment.setCommentNo(159);

		int COMMENT = communityService.updateComment(comment);
		System.out.println("COMMENT:::::::::::::::::::::::::::::::::" + COMMENT);

	}

	// @Test
	public void testDeleteComment() throws Exception {

		int blind = communityService.blindComment(99);
		int delete = communityService.deleteComment(100);

		System.out.println("blind::::" + blind);
		System.out.println("delete::::" + delete);

	}

	// @Test
	public void testDeleteConcern() throws Exception {

		int postNo = 1;
		String userId = "user5@gamsung.com";
		String concernType = "Delete";

		int delete = communityService.updateConcern(postNo, userId, concernType);

		System.out.println("delete::::" + delete);

	}

	// @Test
	public void testConcernflag() throws Exception {

		PostConcern postConcern = new PostConcern();
		Post post = new Post();
		User user = new User();

		post.setPostNo(1);
		user.setId("user5@gamsung.com");

		postConcern.setPostNo(post);
		postConcern.setUserId(user);

		PostConcern Concernflag = communityService.Concernflag(postConcern);

		System.out.println("Concernflag::::" + Concernflag.getDeleteFlag());

	}

}
