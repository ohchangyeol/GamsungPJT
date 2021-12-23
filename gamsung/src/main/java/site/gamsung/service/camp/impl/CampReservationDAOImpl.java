package site.gamsung.service.camp.impl;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import site.gamsung.service.camp.CampReservationDAO;
import site.gamsung.service.common.Search;
import site.gamsung.service.domain.CampReservation;
import site.gamsung.service.domain.MainSite;
import site.gamsung.service.domain.ReservationStatistics;

@Repository("campReservationDAOImpl")
public class CampReservationDAOImpl implements CampReservationDAO {

	@Autowired
	@Qualifier("sqlSessionTemplate")
	private SqlSession sqlSession;
	
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	public CampReservationDAOImpl() {
		System.out.println(this.getClass());
	}

	@Override
	public List<MainSite> listPossibleReservation(Map<String, Object> map) throws Exception {
		return sqlSession.selectList("CampReservationMapper.listPossibleReservation", map);
	}

	@Override
	public int addReservation(CampReservation campReservation) throws Exception {
		return sqlSession.insert("CampReservationMapper.addReservation", campReservation);
	}
	
	@Override
	public int updateMainSiteReservation(CampReservation campReservation) throws Exception {
		return sqlSession.update("CampReservationMapper.updateMainSiteReservation", campReservation);
	}

	@Override
	public boolean isSecessionUserReservationCondition(String id) throws Exception {
		
		List<CampReservation> list= sqlSession.selectList("CampReservationMapper.getReservationStatus", id);
		
		//리턴 값이 있으면 회원 탈퇴 불가 : flag false. 리턴 값이 없으면 회원 탈퇴 가능 : flag true.
		if(list.size() != 0) {
			return false;
		}else {
			return true;
		}
	}

	@Override
	public List<CampReservation> listReservation(Map<String, Object> map) throws Exception {
		return sqlSession.selectList("CampReservationMapper.listReservation", map);
	}

	@Override
	public int getTotalCount(Map<String, Object> map) throws Exception {
		return sqlSession.selectOne("CampReservationMapper.getTotalCount", map);
	}

	@Override
	public ReservationStatistics getReservationStatistics() throws Exception {
		return sqlSession.selectOne("CampReservationMapper.totalReservationStatistics");
	}

	@Override
	public List<ReservationStatistics> campReservationStatisticsByDay(Search search) throws Exception {
		return sqlSession.selectList("CampReservationMapper.campReservationStatisticsByDay", search);
	}

	@Override
	public List<ReservationStatistics> campReservationStatisticsByWeek(Search search) throws Exception {
		return sqlSession.selectList("CampReservationMapper.campReservationStatisticsByWeek", search);
	}

	@Override
	public List<ReservationStatistics> campReservationStatisticsByMonth(Search search) throws Exception {
		return sqlSession.selectList("CampReservationMapper.campReservationStatisticsByMonth", search);
	}

	@Override
	public int getTotalCampReservationCountByDay(Search search) throws Exception {
		return sqlSession.selectOne("CampReservationMapper.getTotalCampReservationCountByDay", search);
	}

	@Override
	public int getTotalCampReservationCountByWeek(Search search) throws Exception {
		return sqlSession.selectOne("CampReservationMapper.getTotalCampReservationCountByWeek", search);
	}

	@Override
	public int getTotalCampReservationCountByMonth(Search search) throws Exception {
		return sqlSession.selectOne("CampReservationMapper.getTotalCampReservationCountByMonth", search);
	}

	@Override
	public CampReservation getReservation(String reservationNo) throws Exception {
		return sqlSession.selectOne("CampReservationMapper.getReservation", reservationNo);
	}

	@Override
	public int updateReservation(CampReservation campReservation) throws Exception {
		return sqlSession.selectOne("CampReservationMapper.updateReservation", campReservation);
	}

}

