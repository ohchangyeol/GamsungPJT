package site.gamsung.service.servicecenter.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import site.gamsung.service.common.Search;
import site.gamsung.service.domain.Notice;
import site.gamsung.service.servicecenter.NoticeDAO;

@Repository("noticeDAOImpl")
public class NoticeDAOImpl implements NoticeDAO {
	
	// Field
	@Autowired
	@Qualifier("sqlSessionTemplate")
	private SqlSession sqlSession;
	
	// Constructor
	public NoticeDAOImpl() {
		System.out.println("@Repository :: " + this.getClass());
	}
	
	//Setter
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	//add Method
	@Override
	public void addNotice(Notice notice) throws Exception {
		sqlSession.insert("NoticeMapper.addNotice", notice);
		
	}
	//get Method
	@Override
	public Notice getNotice(int noticeNo) throws Exception {
		return sqlSession.selectOne("NoticeMapper.getNotice", noticeNo);
		
	}

	@Override
	public List<Notice> listProductList(Search search) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList("NoticeMapper.listNotice", search);
	}
}
