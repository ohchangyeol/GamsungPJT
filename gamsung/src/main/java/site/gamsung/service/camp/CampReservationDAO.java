package site.gamsung.service.camp;

import java.util.List;
import java.util.Map;

import site.gamsung.service.domain.CampReservation;
import site.gamsung.service.domain.MainSite;
import site.gamsung.service.domain.ReservationStatistics;

public interface CampReservationDAO {

	public List<MainSite> possibleReservationList(Map<String, Object> map) throws Exception;
	
	public int addReservation(CampReservation campReservation) throws Exception;
	
	public int updateMainSiteReservationDate(CampReservation campReservation) throws Exception;
	
	public boolean isSecessionUserReservationCondition(String id) throws Exception;
	
	public List<CampReservation> listReservation(Map<String, Object> map) throws Exception;
	
	public int getTotalCount(Map<String, Object> map) throws Exception;
	
	public ReservationStatistics getReservationStatistics() throws Exception;
	
}
