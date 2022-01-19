package site.gamsung.service.campbusiness.test;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import junit.framework.Assert;
import site.gamsung.service.campbusiness.CampBusinessService;
import site.gamsung.service.common.GoCampAPI;
import site.gamsung.service.common.Search;
import site.gamsung.service.domain.Camp;
import site.gamsung.service.domain.MainSite;
import site.gamsung.service.domain.SubSite;

/*
 *	FileName :  UserServiceTest.java
 * ㅇ JUnit4 (Test Framework) 과 Spring Framework 통합 Test( Unit Test)
 * ㅇ Spring 은 JUnit 4를 위한 지원 클래스를 통해 스프링 기반 통합 테스트 코드를 작성 할 수 있다.
 * ㅇ @RunWith : Meta-data 를 통한 wiring(생성,DI) 할 객체 구현체 지정
 * ㅇ @ContextConfiguration : Meta-data location 지정
 * ㅇ @Test : 테스트 실행 소스 지정
 */

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations =  {"classpath:config/context-common.xml",
									"classpath:config/context-aspect.xml",
									"classpath:config/context-mybatis.xml",
									"classpath:config/context-transaction.xml"})

public class CampBusinessTest {

	@Autowired(required = false)
	@Qualifier("campBusinessServiceImpl")
	private CampBusinessService campBusinessService;
	
	@Autowired
	@Qualifier("GoCampAPI")
	private GoCampAPI goCampAPI;
	
	//@Test
	public void testaddSubSite() throws Exception{
		
		Date testDate = new Date(2020,01,01);	
		
		SubSite testSubSite = new SubSite();
		testSubSite.setCampNo(10000);
		testSubSite.setSubSiteType("온수");
		testSubSite.setSubSiteRegDate(testDate);
		testSubSite.setSubSiteName("test 부가시설 이름");
		testSubSite.setSubSiteInfo("test 부가시설 설명");
		
		System.out.println("testSubSite : "+ testSubSite);
		
		campBusinessService.addSubSite(testSubSite);
		
		SubSite testSubSiteResult = campBusinessService.getSubSite(10005);
		
		System.out.println("testSubSiteResult : "+ testSubSiteResult);
		
	}
	
	@Test
	public void testAddGoCamp() throws Exception{
		goCampAPI.addData();
	}
	
	
}// end of class
