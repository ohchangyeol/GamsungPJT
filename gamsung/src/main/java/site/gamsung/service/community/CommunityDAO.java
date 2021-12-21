package site.gamsung.service.community;

import java.util.List;
import java.util.Map;


import site.gamsung.service.domain.Comment;
import site.gamsung.service.domain.Post;

public interface CommunityDAO {
	
	//게시물
	
	public int addPost(Post post)throws Exception;
	
	public List<Post> listPost(Post post)throws Exception;
	
	public Post getPost(int postNo)throws Exception;

	public int updatePost(Post post)throws Exception;
	
	public int deletePost(int postNo)throws Exception;
	
	public int totalConcern(int postNo) throws Exception;
	
	public int totalComment(int postNo) throws Exception;
	
	//댓글

	public int addComment(Comment comment)throws Exception;
	
	public List<Comment> listComment(int postNo)throws Exception;
	
	public int updateComment(Comment comment)throws Exception;
	
	public int deleteComment(int CommentNo)throws Exception;
	
	//추천
	
	public int updateConcern(Map<String,Object> Map) throws Exception ;
	

}
