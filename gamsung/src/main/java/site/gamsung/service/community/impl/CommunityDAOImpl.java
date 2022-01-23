package site.gamsung.service.community.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import site.gamsung.service.common.Search;
import site.gamsung.service.community.CommunityDAO;
import site.gamsung.service.domain.Comment;
import site.gamsung.service.domain.Post;
import site.gamsung.service.domain.PostConcern;
import site.gamsung.service.domain.User;


@Repository("communityDAOImpl")
public class CommunityDAOImpl implements CommunityDAO {

	//Field
	@Autowired
	@Qualifier("sqlSessionTemplate")
	private SqlSession sqlSession;
	public void setSqlSession(SqlSession sqlSession) {
		System.out.println("sqlSessions"+sqlSession);
		this.sqlSession = sqlSession;
	}
	
	
	//Constructor
	public CommunityDAOImpl() {
		System.out.println(this.getClass());
	}

	
	//Method
	
	@Override
	public int addPost(Post post) throws Exception {
	return sqlSession.insert("CommunityMapper.addPost", post);
	}

	@Override
	public List<Post> listPost(HashMap<String, Object> map) throws Exception {
		return sqlSession.selectList("CommunityMapper.listPost", map);
	}
	@Override
	public List<Post> MylistPost(HashMap<String, Object> map) throws Exception {
		return sqlSession.selectList("CommunityMapper.MylistPost", map);
	}

	@Override
	public Post getPost(int postNo) throws Exception {
		return sqlSession.selectOne("CommunityMapper.getPost", postNo);
	}

	@Override
	public int updatePost(Post post) throws Exception {
		return sqlSession.update("CommunityMapper.updatePost", post);		
	}

	@Override
	public int deletePost(int postNo) throws Exception {
		return sqlSession.update("CommunityMapper.deletePost", postNo);
	}
	
	@Override
	public int blindPost(int postNo) throws Exception {
		return sqlSession.update("CommunityMapper.blindPost", postNo);
	}
	

	@Override
	public int addComment(Comment comment) throws Exception {
		return sqlSession.insert("CommunityMapper.addComment", comment);
	}

	@Override
	public List<Comment> listComment(int postNo) throws Exception {
		return sqlSession.selectList("CommunityMapper.listComment", postNo);
	}

	@Override
	public int updateComment(Comment comment) throws Exception {
		return sqlSession.update("CommunityMapper.updateComment", comment);		
	}

	@Override
	public int deleteComment(int CommentNo) throws Exception {
		return sqlSession.update("CommunityMapper.deleteComment", CommentNo);
	}
	
	@Override
	public int blindComment(int CommentNo) throws Exception {
		return sqlSession.update("CommunityMapper.blindComment", CommentNo);
	}

	public int updateConcern(Map<String,Object> Map) throws Exception {
		
		String concernType = (String) Map.get("concernType");// 동작 insert / delete
		
		if(concernType.equals("insert")){
			return sqlSession.insert("CommunityMapper.addConcern", Map);	
		}else {
			return sqlSession.delete("CommunityMapper.deleteConcern", Map);	
		}
		
	}

	@Override
	public PostConcern Concernflag(PostConcern postConcern) throws Exception {
		return sqlSession.selectOne("CommunityMapper.ConcernFlag", postConcern);
	}


	@Override
	public Post updatetotalComment(int CommentNo) throws Exception {
		return sqlSession.selectOne("CommunityMapper.updatetotalComment", CommentNo);
	}


	@Override
	public Post updatetotalComment2(int postNo) throws Exception {
		return sqlSession.selectOne("CommunityMapper.updatetotalComment2", postNo);
	}


	@Override
	public List<Post> listPostForComment(Search search) throws Exception {
		return sqlSession.selectList("CommunityMapper.listPostForComment", search);
	}
	
	@Override
	public int totalConcern (int postNo) throws Exception {
		return sqlSession.selectOne("CommunityMapper.totalConcern", postNo);
	}


	@Override
	public int getTotalPost(HashMap<String, Object> map) {
		return sqlSession.selectOne("CommunityMapper.getTotalPost", map);
	}


	@Override
	public int getTotalComment(Search search) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("CommunityMapper.getTotalComment", search);
	}
	
	
}
