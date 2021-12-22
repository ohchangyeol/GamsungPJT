package site.gamsung.service.camp.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import site.gamsung.service.camp.CampReservationService;
import site.gamsung.service.common.Search;
import site.gamsung.service.camp.CampReservationDAO;
import site.gamsung.service.domain.CampReservation;
import site.gamsung.service.domain.MainSite;
import site.gamsung.service.domain.Payment;
//import site.gamsung.service.domain.ReservationStatistics;
import site.gamsung.service.payment.PaymentDAO;

@Service("campReservationServiceImpl")
public class CampReservationServiceImpl implements CampReservationService {

	/*
	 * @Autowired
	 * 
	 * @Qualifier("campReservationDAOImpl")
	 */
	private CampReservationDAO campReservationDAO;
	
	@Autowired
	@Qualifier("paymentDAOImpl")
	private PaymentDAO paymentDAO;
		
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
	public void addReservation(CampReservation campReservation, Payment payment) throws Exception {
		campReservationDAO.addReservation(campReservation);
		//paymentDAO.addMakePayment(payment);
		campReservationDAO.updateMainSiteReservationDate(campReservation);
	}

	@Override
	public Map<String, Object> listReservation(Search search, int campNo) throws Exception {
		
		Map<String, Object> requestMap = new HashMap<String, Object>();
		requestMap.put("search", search);
		requestMap.put("campNo", campNo);
		
		List<CampReservation> list = campReservationDAO.listReservation(requestMap);
		int totalCount = campReservationDAO.getTotalCount(requestMap);
		
		Map<String, Object> responseMap = new HashMap<String, Object>();
		responseMap.put("list", list);
		responseMap.put("totalCount", totalCount);
		
		return responseMap;
	}

	@Override
	public Map<String, Object> listMyReservation(Search search, String id) throws Exception {
		
		Map<String, Object> requestMap = new HashMap<String, Object>();
		requestMap.put("search", search);
		requestMap.put("id", id);
		
		List<CampReservation> list = campReservationDAO.listReservation(requestMap);
		int totalCount = campReservationDAO.getTotalCount(requestMap);
		
		Map<String, Object> responseMap = new HashMap<String, Object>();
		responseMap.put("list", list);
		responseMap.put("totalCount", totalCount);
		
		return responseMap;
	}

//	@Override
//	public ReservationStatistics getReservationStatistics() throws Exception {
//		return campReservationDAO.getReservationStatistics();
//	}
//	
	
}
