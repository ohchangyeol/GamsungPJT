package site.gamsung.service.camp.impl;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import site.gamsung.service.camp.CampSearchDAO;

@Repository("campSearchDaoImpl")
public class CampSearchDAOImpl implements CampSearchDAO {

	@Autowired
	@Qualifier("sqlSessionTemplate")
	private SqlSession sqlSession;
	
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	public CampSearchDAOImpl() {
		System.out.println(this.getClass());
	}

}
