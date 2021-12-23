package site.gamsung.service.servicecenter.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import site.gamsung.service.servicecenter.ReportDAO;
import site.gamsung.service.servicecenter.ReportService;

@Service("reportServiceImpl")
public class ReportServiceImpl implements ReportService {
	
	// Field
	@Autowired
	@Qualifier("reportDAOImpl")
	private ReportDAO reportDAO;

	// Constructor
	public ReportServiceImpl() {
		// TODO Auto-generated constructor stub
	}
	
	
	
}
