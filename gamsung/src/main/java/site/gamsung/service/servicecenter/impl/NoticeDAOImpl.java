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
	
	
	@Override
	public void addNotice(Notice notice) throws Exception {
		sqlSession.insert("NoticeMapper.addNotice", notice);
		
	}
	@Override
	public Notice getNotice(int noticeNo) throws Exception {
		return sqlSession.selectOne("NoticeMapper.getNotice", noticeNo);
	}

	@Override
	public List<Notice> listNotice(Search search) throws Exception {
		return sqlSession.selectList("NoticeMapper.listNotice", search);
	}

	@Override
	public void updateNotice(Notice notice) throws Exception {
		sqlSession.update("NoticeMapper.updateNotice", notice);	
	}

	@Override
	public void updateViewCount(int noticeNo) throws Exception {
		sqlSession.update("NoticeMapper.viewCount", noticeNo);	
		
	}

	@Override
	public void deleteNotice(int noticeNo) throws Exception {
		sqlSession.update("NoticeMapper.deleteNotice", noticeNo);
	}

	@Override
	public int getTotalCount(Search search) throws Exception {
		return sqlSession.selectOne("NoticeMapper.getTotalCount", search);
	}
}
