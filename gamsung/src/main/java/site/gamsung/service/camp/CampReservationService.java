package site.gamsung.service.camp;

import java.util.List;
import java.util.Map;

import site.gamsung.service.common.Search;
import site.gamsung.service.domain.CampReservation;
import site.gamsung.service.domain.MainSite;
import site.gamsung.service.domain.Payment;
import site.gamsung.service.domain.ReservationStatistics;

public interface CampReservationService {
	
	public void addReservation(CampReservation campReservation) throws Exception;
	
	public List<MainSite> possibleReservationList(Map<String, Object> map) throws Exception;
	
	public Map<String, Object> listReservation(Search search, int campNo) throws Exception;
	
	public Map<String, Object> listMyReservation(Search search, String id) throws Exception;
	
	public ReservationStatistics getReservationStatistics() throws Exception;
	
	public Map<String, Object> listCampReservationStatisticsByDay(Search search) throws Exception; 
	
	public Map<String, Object> listCampReservationStatisticsByWeek(Search search) throws Exception;
	
	public Map<String, Object> listCampReservationStatisticsByMonth(Search search) throws Exception;
	
	public CampReservation getReservation(String reservationNo) throws Exception;
}
