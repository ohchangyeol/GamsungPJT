package site.gamsung.service.camp;

import java.util.List;
import java.util.Map;

import site.gamsung.service.domain.CampReservation;
import site.gamsung.service.domain.MainSite;

public interface CampReservationService {
	
	public void addReservation(CampReservation campReservation) throws Exception;
	
	public List<MainSite> possibleReservationList(Map<String, Object> map) throws Exception;
	
}
