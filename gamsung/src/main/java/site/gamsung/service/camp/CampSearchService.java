package site.gamsung.service.camp;

import java.util.Map;

import site.gamsung.service.common.Search;

public interface CampSearchService {
	
	public Map<String, Object> listCamp(Search search);
	
	public Map<String, Object> getCamp(int campNo);

	public Map<String, Object> getTopCamp();
		
}
