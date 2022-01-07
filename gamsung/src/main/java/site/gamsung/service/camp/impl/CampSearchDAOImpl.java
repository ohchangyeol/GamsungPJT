package site.gamsung.service.camp.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import site.gamsung.service.camp.CampSearchDAO;
import site.gamsung.service.common.Search;
import site.gamsung.service.domain.Camp;
import site.gamsung.service.domain.CampReservation;
import site.gamsung.service.domain.MainSite;
import site.gamsung.service.domain.SubSite;

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
	public List<Camp> listCamp(Search search){
		return sqlSession.selectList("CampSearchMapper.listCamp", search);
	}

	@Override
	public int getTotalCount(Search search){
		return sqlSession.selectOne("CampSearchMapper.getTotalCount", search);
	}

	@Override
	public Camp getCamp(int campNo){
		return sqlSession.selectOne("CampSearchMapper.getCamp", campNo);
	}

	@Override
	public List<MainSite> getMainSite(int campNo){
		return sqlSession.selectList("CampSearchMapper.getMainSite", campNo);
	}

	@Override
	public MainSite getMainsiteByReservation(CampReservation campReservation) {
		return sqlSession.selectOne("CampSearchMapper.getMainsiteByReservation",campReservation);
	}

	@Override
	public List<SubSite> getSubSite(int campNo){
		return sqlSession.selectList("CampSearchMapper.getSubSite", campNo);
	}

	@Override
	public int updateViewCount(int campNo){
		return sqlSession.update("CampSearchMapper.updateViewCount", campNo);
	}

	@Override
	public Camp getTopRatingCamp(){
		return sqlSession.selectOne("CampSearchMapper.getTopRatingCamp");
	}

	@Override
	public Camp getTopViewCamp(){
		return sqlSession.selectOne("CampSearchMapper.getTopViewCamp");
	}

	@Override
	public Camp getTopReservationCamp(){
		return sqlSession.selectOne("CampSearchMapper.getTopReservationCamp");
	}

	@Override
	public List<Camp> getEventCamp(Search search){
		return sqlSession.selectList("CampSearchMapper.getEventCamp", search);
	}	
	
}
