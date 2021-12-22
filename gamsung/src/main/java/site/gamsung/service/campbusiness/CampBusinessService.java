package site.gamsung.service.campbusiness;

import java.util.Map;

import site.gamsung.service.common.Search;
import site.gamsung.service.domain.Camp;
import site.gamsung.service.domain.MainSite;
import site.gamsung.service.domain.SubSite;

public interface CampBusinessService {
	
	/*
	 * Camp
	 */
	
	public void addCamp(Camp camp) throws Exception;

	public Camp getCamp(int campNo) throws Exception;
	
	public void updateCamp(Camp camp) throws Exception;

	public Map<String,Object> listCamp(Search search) throws Exception;
	
	public void deleteCamp(int campNo) throws Exception;

	
	/*
	 * MainSite
	 */	
	
	public void addMainSite(MainSite mainSite) throws Exception;
	
	public MainSite getMainSite(int mainSiteNo) throws Exception;

	public void updateMainSite(MainSite mainSite) throws Exception;

	public Map<String,Object> listMainSite(Search search) throws Exception;
	
	public void deleteMainSite(int mainSiteNo) throws Exception;

	
	/*
	 * SubSite
	 */
	
	public void addSubSite(SubSite subSite) throws Exception;

	public SubSite getSubSite(int subSiteNo) throws Exception;

	public void updateSubSite(SubSite subSite) throws Exception;

	public Map<String,Object> listSubSite(Search search) throws Exception;
	
	public void deleteSubSite(int subSiteNo) throws Exception;

}
