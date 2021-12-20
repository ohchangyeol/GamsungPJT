package site.gamsung.service.campbusiness;

import site.gamsung.service.domain.Camp;
import site.gamsung.service.domain.MainSite;
import site.gamsung.service.domain.SubSite;

public interface CampBusinessDAO {
	
	public void addCamp(Camp camp) throws Exception;
	
	
	
	
	public void addMainSite(MainSite mainSite) throws Exception;
	
	
	
	
	public void addSubSite(SubSite subSite) throws Exception;
	
	public SubSite getSubSite(int subSiteNo) throws Exception;

}
