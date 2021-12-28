package site.gamsung.service.camp;

import java.util.List;
import java.util.Map;

import site.gamsung.service.common.Search;
import site.gamsung.service.domain.CampReservation;
import site.gamsung.service.domain.MainSite;
import site.gamsung.service.domain.Payment;
import site.gamsung.service.domain.ReservationStatistics;

public interface CampReservationService {
	
	public void addReservation(CampReservation campReservation);
	
	public List<MainSite> listPossibleReservation(Map<String, Object> map);
	
	public Map<String, Object> listReservation(Search search, int campNo);
	
	public Map<String, Object> listMyReservation(Search search, String id);
	
	public ReservationStatistics getReservationStatistics();
	
	public Map<String, Object> listCampReservationStatisticsByDay(Search search); 
	
	public Map<String, Object> listCampReservationStatisticsByWeek(Search search);
	
	public Map<String, Object> listCampReservationStatisticsByMonth(Search search);
	
	public CampReservation getReservation(String reservationNo);
	
	public void updateReservation(CampReservation campReservation);
	
	public void cancleReservationApply(CampReservation campReservation);
	
	public void cancleReservationDo(Payment payment);
	
	public void sendMessage();
}
