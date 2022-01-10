package site.gamsung.service.camp;

import java.util.List;
import java.util.Map;

import site.gamsung.service.common.Search;
import site.gamsung.service.domain.CampReservation;
import site.gamsung.service.domain.MainSite;
import site.gamsung.service.domain.Payment;
import site.gamsung.service.domain.ReservationStatistics;

public interface CampReservationService {
	
	public CampReservation addTempReservation(CampReservation campReservation);
	
	public void updateMainSiteTemp(CampReservation campReservation);
	
	public void updateTempReservationToReal(CampReservation campReservation);
	
	public List<MainSite> listPossibleReservation(Map<String, Object> map);
	
	public Map<String, Object> listReservation(Search search, int campNo);
	
	public Map<String, Object> listMyReservation(Search search, String id);
	
	public List<CampReservation> listMyReservationTable(Search search);
	
	public ReservationStatistics getReservationStatistics();
	
	public Map<String, Object> listCampReservationStatisticsByDay(Search search); 
	
	public Map<String, Object> listCampReservationStatisticsByWeek(Search search);
	
	public Map<String, Object> listCampReservationStatisticsByMonth(Search search);
	
	public CampReservation getReservation(String reservationNo);
	
	public CampReservation getReservationByPayment(CampReservation campReservation);
	
	public CampReservation getCampIdByAppendPayment(CampReservation campReservation);
	
	public void updateReservation(CampReservation campReservation);
	
	public void cancleReservationApply(CampReservation campReservation);
	
	public void cancleReservationDo(Payment payment);
	
	public void updateReservationStatus(CampReservation campReservation);
	
	public void sendMessage();
	
	public void reservationCompleteUse();
	
	public void resetCount();
	
	public void resetTemp();
}
