package site.gamsung.service.camp.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import site.gamsung.service.camp.CampSearchDAO;
import site.gamsung.service.camp.CampSearchService;
import site.gamsung.service.common.Search;
import site.gamsung.service.domain.Camp;
import site.gamsung.service.domain.CampReservation;
import site.gamsung.service.domain.MainSite;
import site.gamsung.service.domain.SubSite;


@Service("campSearchServiceImpl")
@EnableTransactionManagement
public class CampSearchServiceImpl implements CampSearchService{
	
	@Autowired
	@Qualifier("campSearchDAOImpl")
	private CampSearchDAO campSearchDAO;

	public void setCampSearchDAO(CampSearchDAO campSearchDAO) {
		this.campSearchDAO = campSearchDAO;
	}

	public CampSearchServiceImpl() {
		System.out.println(this.getClass());
	}

	@Override
	public Map<String, Object> listCamp(Search search){
		
		List<Camp> list = campSearchDAO.listCamp(search);
		int totalCount = campSearchDAO.getTotalCount(search);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);
		map.put("totalCount", new Integer(totalCount));
	
		return map;
	}

	@Override
	@Transactional(propagation=Propagation.REQUIRES_NEW)
	public Map<String, Object> getCamp(int campNo){
		
		campSearchDAO.updateViewCount(campNo);
		
		Camp camp = campSearchDAO.getCamp(campNo);
		List<MainSite> mainSite = campSearchDAO.getMainSite(campNo);
		List<SubSite> subSite = campSearchDAO.getSubSite(campNo);
		List<String> mainSiteType = new ArrayList<String>();
		mainSiteType.add(mainSite.get(0).getMainSiteType());
		
		for (int i = 0; i < mainSite.size()-1; i++) {
			
			boolean k = true;
			
			for (int j = 0; j < mainSiteType.size(); j++) {
				if(mainSite.get(i).getMainSiteType().equals(mainSiteType.get(j))){
					k = false;
				}
			}
			if(k) {
				mainSiteType.add(mainSite.get(i).getMainSiteType());
			}
		}
		
				
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("camp", camp);
		map.put("mainSite", mainSite);
		map.put("subSite", subSite);
		map.put("mainSiteType", mainSiteType);
		
		return map;
	}
	
	@Override
	public Camp getCampByReservation(int campNo) {
		return campSearchDAO.getCamp(campNo);
	}

	@Override
	public MainSite getMainSite(CampReservation campReservation) {
		return campSearchDAO.getMainsiteByReservation(campReservation);
	}

	@Override
	public Map<String, Object> getTopCamp(){
		
		Camp topRating = campSearchDAO.getTopRatingCamp();
		Camp topView = campSearchDAO.getTopViewCamp();
		Camp topReservation = campSearchDAO.getTopReservationCamp();
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("topRating", topRating);
		map.put("topView", topView);
		map.put("topReservation", topReservation);
		
		return map;
	}

}
