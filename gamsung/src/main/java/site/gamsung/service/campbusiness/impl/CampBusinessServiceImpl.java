package site.gamsung.service.campbusiness.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import site.gamsung.service.campbusiness.CampBusinessDAO;
import site.gamsung.service.campbusiness.CampBusinessService;
import site.gamsung.service.common.Page;
import site.gamsung.service.common.Search;
import site.gamsung.service.domain.Camp;
import site.gamsung.service.domain.MainSite;
import site.gamsung.service.domain.Notice;
import site.gamsung.service.domain.Qna;
import site.gamsung.service.domain.SubSite;
import site.gamsung.service.domain.CampReservation;


@Service("campBusinessServiceImpl")
@EnableTransactionManagement
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
	
	
	/*
	 *  Common	
	 */
	@Override
	@Transactional(propagation=Propagation.REQUIRES_NEW)	
	public int getRegNum(String type, Object obj) throws Exception{
		return campBusinessDAO.getRegNum(type, obj);
	}
	
	
	/*
	 *  Camp	
	 */	
	@Override
	public void addCamp(Camp camp) throws Exception {
		campBusinessDAO.addCamp(camp);
	}
	
	@Override
	public Camp getCamp(int campNo) throws Exception {
		return campBusinessDAO.getCamp(campNo);
	}
	
	@Override
	public void updateCamp(Camp camp) throws Exception {
		campBusinessDAO.updateCamp(camp);
	}

	@Override
	public Map<String, Object> listCamp(Search search) throws Exception {
		List<Camp> list= campBusinessDAO.listCamp(search);
		int totalCount = campBusinessDAO.getTotalCount(search);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list );
		map.put("totalCount", new Integer(totalCount));
		
		return map;
	}

	@Override
	public void deleteCamp(int campNo) throws Exception {
		campBusinessDAO.deleteCamp(campNo);
	}
	
	@Override
	public int getCampNoById(String id) throws Exception{
		return campBusinessDAO.getCampNoById(id);
	}
	
	@Override
	public int getCampTempSaveById(String id) throws Exception {
		return campBusinessDAO.getCampTempSaveById(id);
	}
	
	@Override
	public List<CampReservation> listCampReservationJSON(int campNo) throws Exception {
		return campBusinessDAO.listCampReservationJSON(campNo);
	}
		
	
	/*
	 *  MainSite
	 */	
	@Override
	public void addMainSite(MainSite mainSite) throws Exception {
		campBusinessDAO.addMainSite(mainSite);
	}
	
	@Override
	public MainSite getMainSite(int mainSiteNo) throws Exception {
		return campBusinessDAO.getMainSite(mainSiteNo);
	}
	
	@Override
	public void updateMainSite(MainSite mainSite) throws Exception {
		campBusinessDAO.updateMainSite(mainSite);	
	}

	@Override
	public Map<String, Object> listMainSite(Search search) throws Exception {
		List<MainSite> list= campBusinessDAO.listMainSite(search);
		int totalCount = campBusinessDAO.getTotalCount(search);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list );
		map.put("totalCount", new Integer(totalCount));
		
		return map;
	}
	
	@Override
	public void deleteMainSite(int mainSiteNo) throws Exception {
		campBusinessDAO.deleteMainSite(mainSiteNo);	
	}

	
	/*
	 *  SubSite
	 */	
	@Override
	public void addSubSite(SubSite subSite) throws Exception {	
		campBusinessDAO.addSubSite(subSite);
	}

	@Override
	public SubSite getSubSite(int subSiteNo) throws Exception {
		return campBusinessDAO.getSubSite(subSiteNo);
	}

	
	@Override
	public void updateSubSite(SubSite subSite) throws Exception {
		campBusinessDAO.updateSubSite(subSite);		
	}

	@Override
	public Map<String, Object> listSubSite(Search search) throws Exception {
		List<SubSite> list= campBusinessDAO.listSubSite(search);
		int totalCount = campBusinessDAO.getTotalCount(search);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list );
		map.put("totalCount", new Integer(totalCount));
		
		return map;
	}

	@Override
	public void deleteSubSite(int subSiteNo) throws Exception {
		campBusinessDAO.deleteSubSite(subSiteNo);	
	}
	
	
	/*
	 * Q&A
	 */	
	public void addCampQnaQuestion(Qna qna) throws Exception{
		campBusinessDAO.addCampQnaQuestion(qna);
	}
	
	public void addCampQnaAnswer(Qna qna) throws Exception{
		campBusinessDAO.addCampQnaAnswer(qna);
	}
	
	public Qna getCampQna(int qnaNo) throws Exception{
		return campBusinessDAO.getCampQna(qnaNo);
	}
	
	public List<Qna> listCampQna(int campNo) throws Exception{
		return campBusinessDAO.listCampQna(campNo);
	}
	
	public List<Qna> listCampQnaById(String userId) throws Exception{
		return campBusinessDAO.listCampQnaById(userId);
	}

	
	/*
	 * Notice
	 */	
	public void addCampNotice(Notice notice) throws Exception{
		campBusinessDAO.addCampNotice(notice);
	}

	public Notice getCampNotice(int noticeNo) throws Exception{
		return campBusinessDAO.getCampNotice(noticeNo);
	}
	

	public void updateCampNotice(Notice notice) throws Exception{
		campBusinessDAO.updateCampNotice(notice);
	}

	public List<Notice> listCampNotice(int campNo) throws Exception{
		return campBusinessDAO.listCampNotice(campNo);
	}
	
	
	public void deleteCampNotice(int noticeNo) throws Exception{
		campBusinessDAO.deleteCampNotice(noticeNo);
	}

}
