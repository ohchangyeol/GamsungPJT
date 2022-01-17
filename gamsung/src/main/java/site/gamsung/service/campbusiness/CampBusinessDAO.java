package site.gamsung.service.campbusiness;

import java.util.List;

import site.gamsung.service.common.Search;
import site.gamsung.service.domain.Camp;
import site.gamsung.service.domain.MainSite;
import site.gamsung.service.domain.Notice;
import site.gamsung.service.domain.Qna;
import site.gamsung.service.domain.SubSite;
import site.gamsung.service.domain.CampReservation;

public interface CampBusinessDAO {
	
	/*
	 * Common
	 */	
	public int getRegNum(String type, Object obj) throws Exception;
	
	public int getTotalCount(Search search) throws Exception ;
	
		
	/*
	 * Camp
	 */	
	public void addCamp(Camp camp) throws Exception;

	public Camp getCamp(int campNo) throws Exception;
	
	public void updateCamp(Camp camp) throws Exception;

	public List<Camp> listCamp(Search search) throws Exception;
	
	public void deleteCamp(int campNo) throws Exception;
	
	public int getCampNoById(String id) throws Exception;
	
	public int getCampTempSaveById(String id) throws Exception;
	
	public List<CampReservation> listCampReservationJSON(int campNo) throws Exception;
	
	public boolean isSecessionCampReservationCondition(String id) throws Exception;
	
	/*
	 * MainSite
	 */		
	public void addMainSite(MainSite mainSite) throws Exception;
	
	public MainSite getMainSite(int mainSiteNo) throws Exception;

	public void updateMainSite(MainSite mainSite) throws Exception;

	public List<MainSite> listMainSite(Search search) throws Exception;
	
	public void deleteMainSite(int mainSiteNo) throws Exception;

	
	/*
	 * SubSite
	 */	
	public void addSubSite(SubSite subSite) throws Exception;

	public SubSite getSubSite(int subSiteNo) throws Exception;

	public void updateSubSite(SubSite subSite) throws Exception;

	public List<SubSite> listSubSite(Search search) throws Exception;
	
	public void deleteSubSite(int subSiteNo) throws Exception;
	
	
	/*
	 * Q&A
	 */	
	public void addCampQnaQuestion(Qna qna) throws Exception;
	
	public void addCampQnaAnswer(Qna qna) throws Exception;

	public Qna getCampQna(int qnaNo) throws Exception;

	public List<Qna> listCampQna(int campNo) throws Exception;
	
	public List<Qna> listCampQnaById(String userId) throws Exception;	
		
	
	/*
	 * Notice
	 */	
	public void addCampNotice(Notice notice) throws Exception;

	public Notice getCampNotice(int noticeNo) throws Exception;

	public void updateCampNotice(Notice notice) throws Exception;

	public List<Notice> listCampNotice(int campNo) throws Exception;
	
	public void deleteCampNotice(int noticeNo) throws Exception;

}
