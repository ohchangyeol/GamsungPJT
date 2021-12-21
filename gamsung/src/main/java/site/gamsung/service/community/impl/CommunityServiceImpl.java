package site.gamsung.service.community.impl;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import site.gamsung.service.common.Search;
import site.gamsung.service.community.CommunityDAO;
import site.gamsung.service.community.CommunityService;
import site.gamsung.service.domain.Comment;
import site.gamsung.service.domain.Post;


@Service("CommunityServiceImpl") 
//아래 CommunityServiceImpl Class를 (CommunityServiceImpl)의 이름으로 Bean 생성 
public class CommunityServiceImpl implements CommunityService {	
	
	 @Autowired
	 @Qualifier("CommunityDAOImpl") //@Repository("CommunityDAOImpl")을 호출.
	 private CommunityDAO communityDAO; // <-여기에 ↑ 대입 
	 
	  public void setCommunityDAO(CommunityDAO communityDAO) { 
	  this.communityDAO = communityDAO; 
	 }
	  
	///Constructor
		public CommunityServiceImpl() {
			System.out.println(this.getClass());
		} 
	  
    ///method  
	  
	 
	public int addPost(Post post) throws Exception {
		return communityDAO.addPost(post);
	}

	public HashMap<String, Object> listPost(Post post) throws Exception {
		
		int postNo = post.getPostNo();
		
		List<Post> list = communityDAO.listPost(post);
		
		int totalConcern = communityDAO.totalConcern(postNo);
		int totalComment = communityDAO.totalComment(postNo);
		
		HashMap<String,Object> map = new HashMap<String,Object>();
		map.put("list",list);
		map.put("totalConcern",totalConcern);
		map.put("totalComment",totalComment);
		
		return map;
	}

	public Post getPost(int postNo) throws Exception {
		return communityDAO.getPost(postNo);
	}

	public int updatePost(Post post) throws Exception {
		return communityDAO.updatePost(post);
	}

	public int deletePost(int postNo) throws Exception {
		return communityDAO.deletePost(postNo);
	}

	public int addComment(Comment comment) throws Exception {	
		return communityDAO.addComment(comment);
	}

	public List<Comment> listComment(int postNo) throws Exception {	
		return communityDAO.listComment(postNo);
	}

	public int updateComment(Comment comment) throws Exception {	
		return communityDAO.updateComment(comment);
	}

	public int deleteComment(int CommentNo) throws Exception {	
		return communityDAO.deleteComment(CommentNo);
	}
	
	public int updateConcern(int postNo, String userId, String concernFlag, String concernType) throws Exception {
			HashMap<String,Object> map = new HashMap<String,Object>();
		
		map.put("postNo", postNo);
		map.put("userId", userId);
		map.put("concernFlag", concernFlag);
		map.put("concernType", concernType);
		
		return communityDAO.updateConcern(map);
	}

}
