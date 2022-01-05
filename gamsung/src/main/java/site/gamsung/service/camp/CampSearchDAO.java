package site.gamsung.service.camp;

import java.util.List;

import site.gamsung.service.common.Search;
import site.gamsung.service.domain.Camp;
import site.gamsung.service.domain.CampReservation;
import site.gamsung.service.domain.MainSite;
import site.gamsung.service.domain.SubSite;

public interface CampSearchDAO {

	public List<Camp> listCamp(Search search);

	public int getTotalCount(Search search);
	
	public Camp getCamp(int campNo);
	
	public List<MainSite> getMainSite(int campNo);
	
	public MainSite getMainsiteByReservation(CampReservation campReservation);
	
	public List<SubSite> getSubSite(int campNo);
	
	public int updateViewCount(int campNo);
	
	public List<Camp> getEventCamp(Search search);
	
	public Camp getTopRatingCamp();
	
	public Camp getTopViewCamp();
	
	public Camp getTopReservationCamp();
	
}
