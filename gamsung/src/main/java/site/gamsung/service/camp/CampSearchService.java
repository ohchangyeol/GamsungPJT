package site.gamsung.service.camp;

import java.util.Map;

import site.gamsung.service.common.Search;

public interface CampSearchService {
	
	public Map<String, Object> listCamp(Search search) throws Exception;
	
	public Map<String, Object> getCamp(int campNo) throws Exception;

	public Map<String, Object> getTopCamp() throws Exception;
		
}
