package site.gamsung.service.community.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import site.gamsung.service.common.Search;
import site.gamsung.service.community.CommunityDAO;
import site.gamsung.service.community.CommunityService;
import site.gamsung.service.domain.Comment;
import site.gamsung.service.domain.Post;
import site.gamsung.service.domain.PostConcern;


@Service("communityServiceImpl") 
//아래 CommunityServiceImpl Class를 (CommunityServiceImpl)의 이름으로 Bean 생성 
public class CommunityServiceImpl implements CommunityService {	
	
	 @Autowired
	 @Qualifier("communityDAOImpl") //@Repository("CommunityDAOImpl")을 호출.
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

	public List<Post> listPost(HashMap<String, Object> map) throws Exception {
		
		List<Post> list = communityDAO.listPost(map);
		
		return list;
	}
	
	public List<Post> MylistPost(HashMap<String, Object> map) throws Exception {
		
		List<Post> list = communityDAO.MylistPost(map);
		
		return list;
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

	public int blindPost(int postNo) throws Exception {
		return communityDAO.blindPost(postNo);
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
	
	public int blindComment(int CommentNo) throws Exception {	
		return communityDAO.blindComment(CommentNo);
	}
	

	
	
	
	public int updateConcern(int postNo, String userId, String concernType) throws Exception {
			HashMap<String,Object> map = new HashMap<String,Object>();
		
		map.put("postNo", postNo);
		map.put("userId", userId);
		map.put("concernType", concernType);
		
		return communityDAO.updateConcern(map);
	}

	public PostConcern Concernflag(PostConcern postConcern) throws Exception {	
		return communityDAO.Concernflag(postConcern);
	}


	public Post updatetotalComment(int CommentNo) throws Exception {
		return communityDAO.updatetotalComment(CommentNo);
	}

	@Override
	public Post updatetotalComment2(int postNo) throws Exception {
		return communityDAO.updatetotalComment2(postNo);
	}

	@Override
	public int totalConcern (int postNo) throws Exception {
		return communityDAO.totalConcern(postNo);
	}
	
	@Override
	public List<Post> listPostForComment(Search search) throws Exception {
		return communityDAO.listPostForComment(search);
	}
	
	@Override
	public int getTotalPost (HashMap<String, Object> map) throws Exception {
		return communityDAO.getTotalPost(map);
	}
	
	@Override
	public int getTotalComment (Search search) throws Exception {
		return communityDAO.getTotalComment(search);
	}
}
