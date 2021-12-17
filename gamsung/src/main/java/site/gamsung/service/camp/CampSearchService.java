package service.camp;

import java.util.Map;

public interface CampSearchService {
	
	public Map<String, Object> listCamp(Search search) throw Exception;
	
	public Map<String, Object> getCamp(int campNo) throw Exception;
	
	public Map<String, Object> getTopCamp() throw Exception;
}
