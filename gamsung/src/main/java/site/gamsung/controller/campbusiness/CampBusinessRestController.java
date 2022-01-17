package site.gamsung.controller.campbusiness;

import java.io.File;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import site.gamsung.service.common.Page;
import site.gamsung.service.common.Search;
import site.gamsung.service.domain.Camp;
import site.gamsung.service.domain.CampReservation;
import site.gamsung.service.domain.MainSite;
import site.gamsung.service.domain.Payment;
import site.gamsung.service.domain.ReservationCalendar;
import site.gamsung.service.domain.SubSite;
import site.gamsung.service.domain.User;
import site.gamsung.service.camp.CampReservationService;
import site.gamsung.service.campbusiness.CampBusinessService;

@Controller
@RequestMapping("/campBusiness/rest/*")
public class CampBusinessRestController {

	/// Field
	@Autowired
	@Qualifier("campBusinessServiceImpl")
	private CampBusinessService campBusinessService;
	
	// @Value("#{commonProperties['pageUnit']}")
	@Value("#{commonProperties['pageUnit'] ?: 10}")
	int pageUnit;

	// @Value("#{commonProperties['pageSize']}")
	@Value("#{commonProperties['pageSize'] ?: 5}")
	int pageSize;

	public CampBusinessRestController() {
		System.out.println(this.getClass());
	}
	
	@RequestMapping(value = "listCampReservationJSON", method = RequestMethod.GET)
	private @ResponseBody String listCampReservationJSON(@RequestParam("campNo") int campNo) throws Exception {
					
		System.out.println("listCampReservationJSON campNo : " + campNo);	
		
		List<CampReservation> campReservationList = campBusinessService.listCampReservationJSON(campNo);
		List<ReservationCalendar> newList = new ArrayList<ReservationCalendar>();

		String mainSiteName = null;
		String mainSiteType = null;
		String reservationUserName = null;
		int useNum = 0;				
		for (int i = 0; i < campReservationList.size(); i++) {
			
			ReservationCalendar oneRsvEvent = new ReservationCalendar();
			CampReservation oneReservation = campReservationList.get(i);
			mainSiteName = oneReservation.getMainSite().getMainSiteName();
			mainSiteType = oneReservation.getMainSite().getMainSiteType();
			reservationUserName = oneReservation.getReservationUserName();
			useNum = oneReservation.getUseNum();
			
			oneRsvEvent.setTitle( mainSiteName+"/"+mainSiteType+"/"+reservationUserName+"/"+useNum+"명");
			oneRsvEvent.setStart(oneReservation.getReservationStartDate());
			oneRsvEvent.setEnd(oneReservation.getReservationEndDate());
			oneRsvEvent.setUrl("/campGeneral/getMyReservation?reservationNo="+oneReservation.getReservationNo());
			
			String color = "";
			if(i % 4 == 0) {
				color = "blue";
				oneRsvEvent.setTextColor("white");
				
			} else if(i % 3 == 0) {
				color = "yellow";
				oneRsvEvent.setTextColor("black");
				
			} else if(i % 2 == 0) {
				color = "orange";
				oneRsvEvent.setTextColor("black");
				
			} else if(i % 1 == 0) {
				color = "green";
				oneRsvEvent.setTextColor("black");
			}
			
			oneRsvEvent.setColor(color);
			oneRsvEvent.setAllDay(false);
			
			System.out.println("paymentRecordList1 : "+i+" : " + oneReservation);
			newList.add(oneRsvEvent);
		}
		
		System.out.println("reservationList : "+campReservationList);
		System.out.println("newList : "+newList);
			
		Gson data = new GsonBuilder().serializeNulls().setDateFormat("yyyy-MM-dd").create();
			
		return data.toJson(newList);
	}
}
