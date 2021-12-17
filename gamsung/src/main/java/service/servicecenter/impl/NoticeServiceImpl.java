package service.servicecenter.impl;

import org.springframework.stereotype.Service;

import service.servicecenter.NoticeDAO;
import service.servicecenter.NoticeService;

@Service("noticeServiceImpl")
public class NoticeServiceImpl implements NoticeService {
	
	// Field
	private NoticeDAO noticeDAO;
	
	// Constructor
	public NoticeServiceImpl() {
		// TODO Auto-generated constructor stub
		System.out.println(this.getClass());
	}

}
