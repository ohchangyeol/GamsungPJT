package site.gamsung.service.community;

import java.util.List;
import java.util.Map;

import site.gamsung.service.common.Search;
import site.gamsung.service.domain.Comment;
import site.gamsung.service.domain.Post;
import site.gamsung.service.domain.User;

public interface CommunityDAO {
	
	//게시물
	
	public int addPost(Post post)throws Exception;
	
	public List<Post> ListPost(Search search)throws Exception;
	
	public Post getPost(int postNo)throws Exception;

	public void updatePost(Post post)throws Exception;
	
	public int deletePost(int postNo)throws Exception;
	
	//댓글

	public int addComment(Comment comment)throws Exception;
	
	public List<Comment> listComment(int postNo)throws Exception;
	
	public void updateComment(Comment comment)throws Exception;
	
	public int deleteComment(int CommentNo)throws Exception;
	
	//추천
	
	public int addConcern(int postNo, String userId)throws Exception; // concern add + get concern 
	
	//ge concern을 만들어야할까? jsp에서 add호출시에 거기서 count를 가지고 오게 할 수 있지않을까? 
	
	public int getConcernCount(int postNo)throws Exception;
	
	//public int getConcern(Post postNo, User userId)throws Exception;
	
	public int deleteConcern(int postNo, String userId)throws Exception;
	
	
}
