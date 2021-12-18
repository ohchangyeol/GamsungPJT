package site.gamsung.service.servicecenter.impl;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import site.gamsung.service.domain.Notice;
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
		// TODO Auto-generated constructor stub
		System.out.println("@Service :: "+this.getClass());
	}

	@Override
	public void addNotice(Notice notice) throws Exception {
		// TODO Auto-generated method stub
		noticeDAO.addNotice(notice);
	}
	
	
	

}
