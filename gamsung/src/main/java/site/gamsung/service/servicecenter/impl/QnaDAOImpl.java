package site.gamsung.service.servicecenter.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import site.gamsung.service.common.Search;
import site.gamsung.service.domain.Qna;
import site.gamsung.service.servicecenter.QnaDAO;

@Repository("qnaDAOImpl")
public class QnaDAOImpl implements QnaDAO {

	// Field
	@Autowired
	@Qualifier("sqlSessionTemplate")
	private SqlSession sqlSession;
	// Constructor
	public QnaDAOImpl() {
		System.out.println("@Repository :: " + this.getClass());
	}
	
	// Setter
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	@Override
	public void addQuestion(Qna qna) throws Exception {
		sqlSession.insert("QnaMapper.addQuestion", qna);
	}

	@Override
	public void addAnswer(Qna qna) throws Exception {
		sqlSession.update("QnaMapper.addAnswer", qna);
	}

	@Override
	public Qna getQna(int qnaNo) throws Exception {
		return sqlSession.selectOne("QnaMapper.getQna", qnaNo);
	}

	@Override
	public List<Qna> listQna(Search search) throws Exception {
		return sqlSession.selectList("QnaMapper.listQna", search);
	}

	@Override
	public void updateViewCount(int qnaNo) throws Exception {
		sqlSession.update("QnaMapper.viewCount", qnaNo );
	}

	@Override
	public void deleteQna(int qnaNo) throws Exception {
		 sqlSession.update("QnaMapper.deleteQna", qnaNo );
	}

	@Override
	public int getTotalCount(Search search) throws Exception {
		return sqlSession.selectOne("QnaMapper.getTotalCount",search);
	}

	@Override
	public int notTotalCountQna() throws Exception {
		return sqlSession.selectOne("QnaMapper.notTotalcount");
	}

	
}
