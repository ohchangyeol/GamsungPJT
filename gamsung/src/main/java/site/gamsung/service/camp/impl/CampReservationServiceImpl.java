package site.gamsung.service.camp.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import site.gamsung.service.camp.CampReservationService;
import site.gamsung.service.camp.CampReservationDAO;
import site.gamsung.service.domain.CampReservation;
import site.gamsung.service.domain.MainSite;

@Service("campReservationServiceImpl")
public class CampReservationServiceImpl implements CampReservationService {

	@Autowired
	@Qualifier("campReservationDAOImpl")
	private CampReservationDAO campReservationDAO;
		
	public void setCampReservationDAO(CampReservationDAO campReservationDAO) {
		this.campReservationDAO = campReservationDAO;
	}

	public CampReservationServiceImpl() {
		System.out.println(this.getClass());
	}

	@Override
	public List<MainSite> possibleReservationList(Map<String, Object> map) throws Exception {
		return campReservationDAO.possibleReservationList(map);
	}

	@Override
	public void addReservation(CampReservation campReservation) throws Exception {
		campReservationDAO.addReservation(campReservation);
		campReservationDAO.updateMainSiteReservationDate(campReservation);
	}

	
}
