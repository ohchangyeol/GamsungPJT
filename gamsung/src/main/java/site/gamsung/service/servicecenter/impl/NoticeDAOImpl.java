package site.gamsung.service.servicecenter.impl;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

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
}
