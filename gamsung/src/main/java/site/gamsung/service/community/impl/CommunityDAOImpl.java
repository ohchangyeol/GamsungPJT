package site.gamsung.service.community.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import site.gamsung.service.common.Search;
import site.gamsung.service.community.CommunityDAO;
import site.gamsung.service.domain.Comment;
import site.gamsung.service.domain.Post;
import site.gamsung.service.domain.User;


@Repository("CommunityDAOImpl")
public class CommunityDAOImpl implements CommunityDAO {

	//Field
	@Autowired
	@Qualifier("sqlSessionTemplate")
	private SqlSession sqlSession;
	
	
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
	public List<Post> ListPost(Search search) throws Exception {
		return sqlSession.selectList("CommunityMapper.listPost", search);
	}

	@Override
	public Post getPost(int postNo) throws Exception {
		return sqlSession.selectOne("CommunityMapper.getPost", postNo);
	}

	@Override
	public void updatePost(Post post) throws Exception {
		sqlSession.update("CommunityMapper.updatePost", post);		
	}

	@Override
	public int deletePost(int postNo) throws Exception {
		return sqlSession.update("CommunityMapper.updatePost", postNo);
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
	public void updateComment(Comment comment) throws Exception {
		sqlSession.update("CommunityMapper.updateComment", comment);		
	}

	@Override
	public int deleteComment(int CommentNo) throws Exception {
		return sqlSession.update("CommunityMapper.deleteComment", CommentNo);
	}

	@Override
	public int addConcern(int postNo, String userId) throws Exception {
		return sqlSession.insert("CommunityMapper.addConcern", product);
	}

	@Override
	public int getConcernCount(int postNo) throws Exception {
		return sqlSession.selectOne("CommunityMapper.getConcernCount", postNo);
	}

	@Override
	public int deleteConcern(int postNo, String userId) throws Exception {
		return sqlSession.update("CommunityMapper.deleteConcern", product);
	}

}
