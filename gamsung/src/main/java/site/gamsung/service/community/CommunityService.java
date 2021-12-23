package site.gamsung.service.community;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import site.gamsung.service.common.Search;
import site.gamsung.service.domain.Comment;
import site.gamsung.service.domain.Post;

public interface CommunityService {
	
	//게시물
	
		public int addPost(Post post)throws Exception; //게시물 등록
		
		public Map<String, Object> listPost(Post post)throws Exception; //게시물 List
		//여기서 총 추천수 그리고 현재 로그인된 아이디로 해당 게시물을 추천눌렀는지 안눌렀는지의 여부까지 전부다 가지고 올거야
		
		public Post getPost(int postNo)throws Exception; //게시물 상세

		public int updatePost(Post post)throws Exception;//게시물 수정
		
		public int deletePost(int postNo)throws Exception;//게시물 Blind
		
		//댓글

		public int addComment(Comment comment)throws Exception;//댓글 등록
		
		public List<Comment> listComment(int postNo)throws Exception;//댓글 List
		
		public int updateComment(Comment comment)throws Exception;//댓글 수정
		
		public int deleteComment(int CommentNo)throws Exception;//댓글 Blind
		
		//추천
		
		public int updateConcern(int postNo, String userId, String concernFlag, String concernType)throws Exception; //추천 Flag

}
