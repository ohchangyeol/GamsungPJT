package site.gamsung.service.campbusiness.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import site.gamsung.service.campbusiness.CampBusinessDAO;
import site.gamsung.service.common.Page;
import site.gamsung.service.common.Search;
import site.gamsung.service.domain.Camp;
import site.gamsung.service.domain.MainSite;
import site.gamsung.service.domain.SubSite;


@Repository("campBusinessDAOImpl")
public class CampBusinessDAOImpl implements CampBusinessDAO{
	
	@Autowired
	@Qualifier("sqlSessionTemplate")
	private SqlSession sqlSession;
	
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	public CampBusinessDAOImpl() {
		System.out.println(this.getClass());
	}

	@Override
	public void addCamp(Camp camp) throws Exception {
		
	}

	@Override
	public void addMainSite(MainSite mainSite) throws Exception {
				
	}

	@Override
	public void addSubSite(SubSite subSite) throws Exception {
		
	}


}
