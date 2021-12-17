package site.gamsung.service.servicecenter.impl;

import org.springframework.stereotype.Service;

import site.gamsung.service.servicecenter.NoticeDAO;
import site.gamsung.service.servicecenter.NoticeService;


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
