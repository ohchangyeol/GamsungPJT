package site.gamsung.service.campbusiness.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import site.gamsung.service.campbusiness.CampBusinessDAO;
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
	
	/*
	 * Camp
	 */	
	public int getTotalCount(Search search) throws Exception {
				
		if(search.getSearchItemType().equals("Camp")) {
			return sqlSession.selectOne("CampBusinessMapper.getTotalCountCamp", search);
		}
		
		if(search.getSearchItemType().equals("MainSite")) {
			return sqlSession.selectOne("CampBusinessMapper.getTotalCountMainSite", search);
		}
		
		if(search.getSearchItemType().equals("SubSite")) {
			return sqlSession.selectOne("CampBusinessMapper.getTotalCountSubSite", search);
		}
		
		return 0;
	}
			
	
	/*
	 * Camp
	 */	
	@Override
	public void addCamp(Camp camp) throws Exception {
		sqlSession.insert("CampBusinessMapper.addCamp", camp);
	}
	
	@Override
	public Camp getCamp(int campNo) throws Exception {
		return sqlSession.selectOne("CampBusinessMapper.getCamp", campNo);
	}

	@Override
	public void updateCamp(Camp camp) throws Exception {
		sqlSession.update("CampBusinessMapper.updateCamp", camp);		
	}

	@Override
	public List<Camp> listCamp(Search search) throws Exception {
		return sqlSession.selectList("CampBusinessMapper.listCamp", search);
	}

	@Override
	public void deleteCamp(int campNo) throws Exception {
		sqlSession.update("CampBusinessMapper.deleteCamp", campNo);		
	}
	
	@Override
	public int getCampNoById(String id) throws Exception{
		if(sqlSession.selectOne("CampBusinessMapper.getCampNoById", id) == null) {
			return 0;
		} else {
			return sqlSession.selectOne("CampBusinessMapper.getCampNoById", id);
		}
	}
	
	@Override
	public int getCampTempSaveById(String id) throws Exception{
		if(sqlSession.selectOne("CampBusinessMapper.getCampTempSaveById", id) == null) {
			return 0;
		} else {
			return sqlSession.selectOne("CampBusinessMapper.getCampTempSaveById", id);
		}
	}
	
	public int getRegNum(Camp camp) throws Exception{
		sqlSession.selectOne("CampBusinessMapper.getRegNumIn", camp);
		return sqlSession.selectOne("CampBusinessMapper.getRegNumOut", camp);		
	}

	
	/*
	 * MainSite
	 */
	@Override
	public void addMainSite(MainSite mainSite) throws Exception {
		sqlSession.insert("CampBusinessMapper.addMainSite", mainSite);
	}
	
	@Override
	public MainSite getMainSite(int mainSiteNo) throws Exception {
		return sqlSession.selectOne("CampBusinessMapper.getMainSite", mainSiteNo);
	}

	@Override
	public void updateMainSite(MainSite mainSite) throws Exception {
		sqlSession.update("CampBusinessMapper.updateMainSite", mainSite);		
	}

	@Override
	public List<MainSite> listMainSite(Search search) throws Exception {
		return sqlSession.selectList("CampBusinessMapper.listMainSite", search);
	}

	@Override
	public void deleteMainSite(int mainSiteNo) throws Exception {
		sqlSession.update("CampBusinessMapper.deleteMainSite", mainSiteNo);		
	}
	
	
	/*
	 * SubSite
	 */	
	@Override
	public void addSubSite(SubSite subSite) throws Exception {
		sqlSession.insert("CampBusinessMapper.addSubSite", subSite);
	}

	@Override
	public SubSite getSubSite(int subSiteNo) throws Exception {
		return sqlSession.selectOne("CampBusinessMapper.getSubSite", subSiteNo);
	}

	@Override
	public void updateSubSite(SubSite subSite) throws Exception {
		sqlSession.update("CampBusinessMapper.updateSubSite", subSite);		
	}

	@Override
	public List<SubSite> listSubSite(Search search) throws Exception {
		return sqlSession.selectList("CampBusinessMapper.listSubSite", search);
	}

	@Override
	public void deleteSubSite(int subSiteNo) throws Exception {
		sqlSession.delete("CampBusinessMapper.deleteSubSite", subSiteNo);		
	}
	
}
