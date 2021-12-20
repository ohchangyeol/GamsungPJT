package site.gamsung.service.camp;

import java.util.List;
import java.util.Map;

import site.gamsung.service.common.Search;
import site.gamsung.service.domain.CampReservation;
import site.gamsung.service.domain.MainSite;

public interface CampReservationDAO {

	public List<MainSite> possibleReservationList(Map<String, Object> map) throws Exception;
	
	public int addReservation(CampReservation campReservation) throws Exception;
	
	public int updateMainSiteReservationDate(CampReservation campReservation) throws Exception;
	
	public boolean isSecessionUserReservationCondition(String id) throws Exception;
	
	public List<CampReservation> listReservation(Search search, int campNo) throws Exception;
	
	public List<CampReservation> listMyReservation(Search search, String id) throws Exception;
	
}
