package site.gamsung.service.domain;

import java.sql.Date;

import org.springframework.web.multipart.MultipartFile;

public class MainSite {

	/*
	주요시설 번호
	캠핑장 등록번호
	주요시설 유형
	블라인드 유무
	주요시설 명
	구역 번호
	구역 크기
	기본 사용인원수
	최대 사용인원수
	기본인원 금액
	추가인원 금액
	주차가능대수
	상세정보
	에약 시작일자
	예약 종료일자
	예약자 이름
	주요시설 등록일자
	주요시설 이미지1
	주요시설 이미지2
	주요시설 이미지3
	캠핑장 명
	*/
	
	/// Field
	private int mainSiteNo;
	private int campNo;
	private String mainSiteType;
	private boolean deleteFlag;
	private String mainSiteName;
	private String mainSiteSection;
	private String mainSiteSize;
	private int mainSiteMinCapacity;
	private int mainSiteMaxCapacity;
	private int mainSiteMinPrice;
	private int mainSiteAddPrice;
	private int mainSiteParkingSize;
	private String mainSiteInfo;
	private Date mainSiteReservationStart;
	private Date mainSiteReservationEnd;
	private String mainSiteReservationUserName;
	private Date mainSiteRegDate;
	private String mainSiteImg1;
	private String mainSiteImg2;
	private String mainSiteImg3;
	private String campName;
	private MultipartFile mainSiteImgFile1;
	private MultipartFile mainSiteImgFile2;
	private MultipartFile mainSiteImgFile3;	
	
	
	/// Default Constructor
	public MainSite() {
		
	}
	
	/// Getter / Setter
	public int getMainSiteNo() {
		return mainSiteNo;
	}

	public void setMainSiteNo(int mainSiteNo) {
		this.mainSiteNo = mainSiteNo;
	}

	public int getCampNo() {
		return campNo;
	}

	public void setCampNo(int campNo) {
		this.campNo = campNo;
	}

	public String getMainSiteType() {
		return mainSiteType;
	}

	public void setMainSiteType(String mainSiteType) {
		this.mainSiteType = mainSiteType;
	}

	public boolean isDeleteFlag() {
		return deleteFlag;
	}

	public void setDeleteFlag(boolean deleteFlag) {
		this.deleteFlag = deleteFlag;
	}

	public String getMainSiteName() {
		return mainSiteName;
	}

	public void setMainSiteName(String mainSiteName) {
		this.mainSiteName = mainSiteName;
	}

	public String getMainSiteSection() {
		return mainSiteSection;
	}

	public void setMainSiteSection(String mainSiteSection) {
		this.mainSiteSection = mainSiteSection;
	}

	public String getMainSiteSize() {
		return mainSiteSize;
	}

	public void setMainSiteSize(String mainSiteSize) {
		this.mainSiteSize = mainSiteSize;
	}

	public int getMainSiteMinCapacity() {
		return mainSiteMinCapacity;
	}

	public void setMainSiteMinCapacity(int mainSiteMinCapacity) {
		this.mainSiteMinCapacity = mainSiteMinCapacity;
	}

	public int getMainSiteMaxCapacity() {
		return mainSiteMaxCapacity;
	}

	public void setMainSiteMaxCapacity(int mainSiteMaxCapacity) {
		this.mainSiteMaxCapacity = mainSiteMaxCapacity;
	}

	public int getMainSiteMinPrice() {
		return mainSiteMinPrice;
	}

	public void setMainSiteMinPrice(int mainSiteMinPrice) {
		this.mainSiteMinPrice = mainSiteMinPrice;
	}

	public int getMainSiteAddPrice() {
		return mainSiteAddPrice;
	}

	public void setMainSiteAddPrice(int mainSiteAddPrice) {
		this.mainSiteAddPrice = mainSiteAddPrice;
	}

	public int getMainSiteParkingSize() {
		return mainSiteParkingSize;
	}

	public void setMainSiteParkingSize(int mainSiteParkingSize) {
		this.mainSiteParkingSize = mainSiteParkingSize;
	}

	public String getMainSiteInfo() {
		return mainSiteInfo;
	}

	public void setMainSiteInfo(String mainSiteInfo) {
		this.mainSiteInfo = mainSiteInfo;
	}

	public Date getMainSiteReservationStart() {
		return mainSiteReservationStart;
	}

	public void setMainSiteReservationStart(Date mainSiteReservationStart) {
		this.mainSiteReservationStart = mainSiteReservationStart;
	}

	public Date getMainSiteReservationEnd() {
		return mainSiteReservationEnd;
	}

	public void setMainSiteReservationEnd(Date mainSiteReservationEnd) {
		this.mainSiteReservationEnd = mainSiteReservationEnd;
	}

	public String getMainSiteReservationUserName() {
		return mainSiteReservationUserName;
	}

	public void setMainSiteReservationUserName(String mainSiteReservationUserName) {
		this.mainSiteReservationUserName = mainSiteReservationUserName;
	}

	public Date getMainSiteRegDate() {
		return mainSiteRegDate;
	}

	public void setMainSiteRegDate(Date mainSiteRegDate) {
		this.mainSiteRegDate = mainSiteRegDate;
	}

	public String getMainSiteImg1() {
		return mainSiteImg1;
	}

	public void setMainSiteImg1(String mainSiteImg1) {
		this.mainSiteImg1 = mainSiteImg1;
	}

	public String getMainSiteImg2() {
		return mainSiteImg2;
	}

	public void setMainSiteImg2(String mainSiteImg2) {
		this.mainSiteImg2 = mainSiteImg2;
	}

	public String getMainSiteImg3() {
		return mainSiteImg3;
	}

	public void setMainSiteImg3(String mainSiteImg3) {
		this.mainSiteImg3 = mainSiteImg3;
	}

	public String getCampName() {
		return campName;
	}

	public void setCampName(String campName) {
		this.campName = campName;
	}
	
	public MultipartFile getMainSiteImgFile1() {
		return mainSiteImgFile1;
	}

	public void setMainSiteImgFile1(MultipartFile mainSiteImgFile1) {
		this.mainSiteImgFile1 = mainSiteImgFile1;
	}

	public MultipartFile getMainSiteImgFile2() {
		return mainSiteImgFile2;
	}

	public void setMainSiteImgFile2(MultipartFile mainSiteImgFile2) {
		this.mainSiteImgFile2 = mainSiteImgFile2;
	}

	public MultipartFile getMainSiteImgFile3() {
		return mainSiteImgFile3;
	}

	public void setMainSiteImgFile3(MultipartFile mainSiteImgFile3) {
		this.mainSiteImgFile3 = mainSiteImgFile3;
	}

	// Override toString
	public String toString() {
		return "\n -- MainSite --"
			+ "\n [mainSiteNo] : " + mainSiteNo
			+ "\n [campNo] : " + campNo
			+ "\n [mainSiteType] : " + mainSiteType
			+ "\n [deleteFlag] : " + deleteFlag				
			+ "\n [mainSiteName] : " + mainSiteName
			+ "\n [mainSiteSection] : " + mainSiteSection 
			+ "\n [mainSiteSize] : " + mainSiteSize 
			+ "\n [mainSiteMinCapacity] : " + mainSiteMinCapacity 
			+ "\n [mainSiteMaxCapacity] : " + mainSiteMaxCapacity 
			+ "\n [mainSiteMinPrice] : " + mainSiteMinPrice 
			+ "\n [mainSiteAddPrice] : " + mainSiteAddPrice 
			+ "\n [mainSiteParkingSize] : " + mainSiteParkingSize 
			+ "\n [mainSiteInfo] : " + mainSiteInfo
			+ "\n [mainSiteReservationStart] : " + mainSiteReservationStart
			+ "\n [mainSiteReservationEnd] : " + mainSiteReservationEnd
			+ "\n [mainSiteReservationUserName] : " + mainSiteReservationUserName
			+ "\n [mainSiteRegDate] : " + mainSiteRegDate
			+ "\n [mainSiteImg1] : " + mainSiteImg1 
			+ "\n [mainSiteImg2] : " + mainSiteImg2 
			+ "\n [mainSiteImg3] : " + mainSiteImg3
			+ "\n [campName] : " + campName
			+ "\n [mainSiteImgFile1] : " + mainSiteImgFile1
			+ "\n [mainSiteImgFile2] : " + mainSiteImgFile2
			+ "\n [mainSiteImgFile3] : " + mainSiteImgFile3
			+ "\n ---------------- \n";
	}

}// end of class
