package site.gamsung.service.camp.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import site.gamsung.service.camp.CampSearchDAO;
import site.gamsung.service.common.Search;
import site.gamsung.service.domain.Camp;

@Repository("campSearchDAOImpl")
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

	@Override
	public List<Camp> listCamp(Search search) throws Exception {
		return sqlSession.selectList("CampSearchMapper.listCamp", search);
	}

	@Override
	public int getTotalCount(Search search) throws Exception {
		return sqlSession.selectOne("CampSearchMapper.getTotalCount",search);
	}
	
	
	

}
