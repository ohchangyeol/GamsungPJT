package service.camp.impl;

import java.util.Map;

import service.camp.CampSearchDAO;
import service.camp.CampSearchService;

public class CampSearchServiceImpl implements CampSearchService{
	
	private CampSearchDAO campSearchDAO;

	public void setCampSearchDAO(CampSearchDAO campSearchDAO) {
		this.campSearchDAO = campSearchDAO;
	}

	public CampSearchServiceImpl() {
		System.out.println(this.getClass());
	}

	@Override
	public Map<String, Object> listCamp(Search search) {
		
		return null;
	}

	@Override
	public Map<String, Object> getCamp(int campNo) {
		
		return null;
	}

	@Override
	public Map<String, Object> getTopCamp() {
		
		return null;
	}

}
