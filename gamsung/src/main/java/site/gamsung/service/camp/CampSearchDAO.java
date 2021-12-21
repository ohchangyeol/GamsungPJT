package site.gamsung.service.camp;

import java.util.List;

import site.gamsung.service.common.Search;
import site.gamsung.service.domain.Camp;
import site.gamsung.service.domain.MainSite;
import site.gamsung.service.domain.SubSite;

public interface CampSearchDAO {

	public List<Camp> listCamp(Search search) throws Exception;

	public int getTotalCount(Search search) throws Exception;
	
	public Camp getCamp(int campNo) throws Exception;
	
	public List<MainSite> getMainSite(int campNo) throws Exception;
	
	public List<SubSite> getSubSite(int campNo) throws Exception;
	
	public int updateViewCount(int campNo) throws Exception;
	
	public List<Camp> getEventCamp(Search search) throws Exception;
	
	public Camp getTopRatingCamp() throws Exception;
	
	public Camp getTopViewCamp() throws Exception;
	
	public Camp getTopReservationCamp() throws Exception;
	
}
