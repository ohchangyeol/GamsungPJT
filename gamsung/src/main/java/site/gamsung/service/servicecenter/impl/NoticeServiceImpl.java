package site.gamsung.service.servicecenter.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import site.gamsung.service.common.Search;
import site.gamsung.service.domain.Notice;
import site.gamsung.service.domain.NoticeWrapper;
import site.gamsung.service.servicecenter.NoticeDAO;
import site.gamsung.service.servicecenter.NoticeService;


@Service("noticeServiceImpl")
public class NoticeServiceImpl implements NoticeService {
	
	// Field
	@Autowired
	@Qualifier("noticeDAOImpl")
	private NoticeDAO noticeDAO;
	
	// Constructor
	public NoticeServiceImpl() {
		System.out.println("@Service :: "+this.getClass());
	}

	@Override
	public void addNotice(Notice notice) throws Exception {
		noticeDAO.addNotice(notice);
	}

	@Override
	public Notice getNotice(int noticeNo) throws Exception {
		return noticeDAO.getNotice(noticeNo);
	}
	
	@Override
	public void updateNotice(Notice notice) throws Exception {
		noticeDAO.updateNotice(notice);
	}

	@Override
	public void updateViewCount(int noticeNo ) throws Exception {
		noticeDAO.updateViewCount(noticeNo);
	}

	@Override
	public void deleteNotice(int noticeNo) throws Exception {
		noticeDAO.deleteNotice(noticeNo);
	}

	@Override
	public NoticeWrapper listNotice(Search search) throws Exception {
		return new NoticeWrapper(noticeDAO.listNotice(search), noticeDAO.getTotalCount(search));
	}

	
	
	
	
	
	

}
