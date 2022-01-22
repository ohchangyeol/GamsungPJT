package site.gamsung.service.community;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import site.gamsung.service.common.Search;
import site.gamsung.service.domain.Comment;
import site.gamsung.service.domain.Post;
import site.gamsung.service.domain.PostConcern;

public interface CommunityDAO {
	
	//게시물	
	public int addPost(Post post)throws Exception;
	public List<Post> listPost(HashMap<String, Object> map)throws Exception;
	public List<Post> MylistPost(HashMap<String, Object> map)throws Exception;
	public Post getPost(int postNo)throws Exception;
	public int updatePost(Post post)throws Exception;	
	public int deletePost(int postNo)throws Exception;	
	public int blindPost(int postNo)throws Exception;
	public int getTotalPost(HashMap<String, Object> map);
	
	//댓글
	public int addComment(Comment comment)throws Exception;
	public List<Comment> listComment(int postNo)throws Exception;
	public List<Post> listPostForComment(Search search)throws Exception;//my 댓글 List		
	public int updateComment(Comment comment)throws Exception;	
	public int deleteComment(int CommentNo)throws Exception;
	public int blindComment(int CommentNo)throws Exception;
	
	//추천	
	public int updateConcern(Map<String,Object> Map) throws Exception ;	
	public PostConcern Concernflag(PostConcern postConcern) throws Exception ;
	public Post updatetotalComment(int CommentNo) throws Exception;
	public Post updatetotalComment2(int postNo) throws Exception;
	public int totalConcern(int postNo) throws Exception;
	public int getTotalComment(Search search);
	
}
