package site.gamsung.service.camp;

import java.util.Map;

import site.gamsung.service.common.Search;
import site.gamsung.service.domain.Camp;
import site.gamsung.service.domain.CampReservation;
import site.gamsung.service.domain.MainSite;

public interface CampSearchService {
	
	public Map<String, Object> listCamp(Search search);
	
	public Map<String, Object> getCamp(int campNo);
	
	public MainSite getMainSite(CampReservation campReservation);
	
	public Camp getCampByReservation(int campNo);

	public Map<String, Object> getTopCamp();
		
}
