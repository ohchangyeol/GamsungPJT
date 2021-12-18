package site.gamsung.service.camp.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import site.gamsung.service.camp.CampSearchDAO;
import site.gamsung.service.camp.CampSearchService;
import site.gamsung.service.common.Search;
import site.gamsung.service.domain.Camp;


@Service("campSearchServiceImpl")
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
	public Map<String, Object> listCamp(Search search) throws Exception{
		
		List<Camp> list = campSearchDAO.listCamp(search);
		int totalCount = campSearchDAO.getTotalCount(search);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);
		map.put("totalCount", new Integer(totalCount));
		
		return map;
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
