package site.gamsung.service.campbusiness.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import site.gamsung.service.campbusiness.CampBusinessDAO;
import site.gamsung.service.campbusiness.CampBusinessService;
import site.gamsung.service.common.Page;
import site.gamsung.service.common.Search;
import site.gamsung.service.domain.Camp;
import site.gamsung.service.domain.MainSite;
import site.gamsung.service.domain.SubSite;


@Service("campBusinessServiceImpl")
public class CampBusinessServiceImpl implements CampBusinessService{
	
	///Field
	@Autowired
	@Qualifier("campBusinessDAOImpl")
	private CampBusinessDAO campBusinessDAO;
	
	public void setCampBusinessDAO(CampBusinessDAO campBusinessDAO) {
		this.campBusinessDAO = campBusinessDAO;
	}
	
	public CampBusinessServiceImpl() {
		System.out.println(this.getClass());
	}

	@Override
	public void addCamp(Camp camp) throws Exception {
		campBusinessDAO.addCamp(camp);
	}

	@Override
	public void addMainSite(MainSite mainSite) throws Exception {
		campBusinessDAO.addMainSite(mainSite);
	}

	@Override
	public void addSubSite(SubSite subSite) throws Exception {	
		campBusinessDAO.addSubSite(subSite);
	}

}
