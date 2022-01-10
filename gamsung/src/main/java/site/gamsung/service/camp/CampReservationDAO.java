package site.gamsung.service.camp;

import java.util.List;
import java.util.Map;

import site.gamsung.service.common.Search;
import site.gamsung.service.domain.CampReservation;
import site.gamsung.service.domain.MainSite;
import site.gamsung.service.domain.ReservationStatistics;

public interface CampReservationDAO {

	public List<MainSite> listPossibleReservation(Map<String, Object> map);
	
	public int addReservation(CampReservation campReservation);
	
	public int updateMainSiteTemp(CampReservation campReservation);
	
	public int updateMainSiteReservation(CampReservation campReservation);
	
	public int updateCampReservationCount(int campNo);
	
	public boolean isSecessionUserReservationCondition(String id);
	
	public List<CampReservation> listReservation(Map<String, Object> map);
	
	public List<CampReservation> listMyReservationTable(Search search);
	
	public int getTotalCount(Map<String, Object> map);
	
	public ReservationStatistics getReservationStatistics();
	
	public List<ReservationStatistics> campReservationStatisticsByDay(Search search);
	
	public List<ReservationStatistics> campReservationStatisticsByWeek(Search search);
	
	public List<ReservationStatistics> campReservationStatisticsByMonth(Search search);
	
	public int getTotalCampReservationCountByDay(Search search);
	
	public int getTotalCampReservationCountByWeek(Search search);
	
	public int getTotalCampReservationCountByMonth(Search search);
	
	public CampReservation getReservation(String reservationNo);
	
	public int updateReservation(CampReservation campReservation);
	
	public CampReservation getReservationByPayment(CampReservation campReservation);
	
	public CampReservation getCampIdByAppendPayment(CampReservation campReservation);
	
	public List<CampReservation> sendMessageInfo();
	
	public void resetCount();
	
	public void resetTemp();
	
	public void deleteTemp();
}
