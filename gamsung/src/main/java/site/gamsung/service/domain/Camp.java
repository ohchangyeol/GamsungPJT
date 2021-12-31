package site.gamsung.service.domain;

import java.sql.Date;

import org.springframework.web.multipart.MultipartFile;

public class Camp {

	/*
	캠핑장등록번호
	회원ID
	임시저장 유무
		0-등록번호 발급 미완료
		1-등록번호 발급 완료 
		2-임시저장
		3-저장완료

	블라인드 유무
	캠핑장 요약정보
	캠핑장 상세정보
	캠핑장 지도이미지
	캠핑장 이미지1
	캠핑장 이미지2
	캠핑장 이미지3
	캠핑장 이미지4
	캠핑장 이미지5
	당월 조회수
	전월 조회수
	예약수
	캠핑장 등록일자
	테마1
	테마2
	자연1
	자연2
	운영1
	운영2
	캠핑장 평점
	 */
	
	/// Field
	private int campNo;
	private User user;
	private int campTempSave;
	private boolean deleteFlag;
	private String campSummery;
	private String campDetail;
	private String campMapImg;
	private String campImg1;
	private String campImg2;
	private String campImg3;
	private String campImg4;
	private String campImg5;
	private int campViewCountCurrentMonth;
	private int campReservationCount;
	private Date campRegDate;
	private String campTheme1;
	private String campTheme2;
	private String campNature1;
	private String campNature2;
	private String campOperation1;
	private String campOperation2;
	private double campRate;	
	private MultipartFile campMapFile;
	private MultipartFile campImgFile1;
	private MultipartFile campImgFile2;
	private MultipartFile campImgFile3;
	private MultipartFile campImgFile4;
	private MultipartFile campImgFile5;
	
	/// Default Constructor
	public Camp() {
		
	}
	
	/// Getter / Setter
	public int getCampNo() {
		return campNo;
	}

	public void setCampNo(int campNo) {
		this.campNo = campNo;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public int getCampTempSave() {
		return campTempSave;
	}

	public void setCampTempSave(int campTempSave) {
		this.campTempSave = campTempSave;
	}

	public boolean isDeleteFlag() {
		return deleteFlag;
	}

	public void setDeleteFlag(boolean deleteFlag) {
		this.deleteFlag = deleteFlag;
	}

	public String getCampSummery() {
		return campSummery;
	}

	public void setCampSummery(String campSummery) {
		this.campSummery = campSummery;
	}

	public String getCampDetail() {
		return campDetail;
	}

	public void setCampDetail(String campDetail) {
		this.campDetail = campDetail;
	}

	public String getCampMapImg() {
		return campMapImg;
	}

	public void setCampMapImg(String campMapImg) {
		this.campMapImg = campMapImg;
	}

	public String getCampImg1() {
		return campImg1;
	}

	public void setCampImg1(String campImg1) {
		this.campImg1 = campImg1;
	}

	public String getCampImg2() {
		return campImg2;
	}

	public void setCampImg2(String campImg2) {
		this.campImg2 = campImg2;
	}

	public String getCampImg3() {
		return campImg3;
	}

	public void setCampImg3(String campImg3) {
		this.campImg3 = campImg3;
	}

	public String getCampImg4() {
		return campImg4;
	}

	public void setCampImg4(String campImg4) {
		this.campImg4 = campImg4;
	}

	public String getCampImg5() {
		return campImg5;
	}

	public void setCampImg5(String campImg5) {
		this.campImg5 = campImg5;
	}

	public int getCampViewCountCurrentMonth() {
		return campViewCountCurrentMonth;
	}

	public void setCampViewCountCurrentMonth(int campViewCountCurrentMonth) {
		this.campViewCountCurrentMonth = campViewCountCurrentMonth;
	}

	public int getCampReservationCount() {
		return campReservationCount;
	}

	public void setCampReservationCount(int campReservationCount) {
		this.campReservationCount = campReservationCount;
	}

	public Date getCampRegDate() {
		return campRegDate;
	}

	public void setCampRegDate(Date campRegDate) {
		this.campRegDate = campRegDate;
	}

	public String getCampTheme1() {
		return campTheme1;
	}

	public void setCampTheme1(String campTheme1) {
		this.campTheme1 = campTheme1;
	}

	public String getCampTheme2() {
		return campTheme2;
	}

	public void setCampTheme2(String campTheme2) {
		this.campTheme2 = campTheme2;
	}

	public String getCampNature1() {
		return campNature1;
	}

	public void setCampNature1(String campNature1) {
		this.campNature1 = campNature1;
	}

	public String getCampNature2() {
		return campNature2;
	}

	public void setCampNature2(String campNature2) {
		this.campNature2 = campNature2;
	}

	public String getCampOperation1() {
		return campOperation1;
	}

	public void setCampOperation1(String campOperation1) {
		this.campOperation1 = campOperation1;
	}

	public String getCampOperation2() {
		return campOperation2;
	}

	public void setCampOperation2(String campOperation2) {
		this.campOperation2 = campOperation2;
	}

	public double getCampRate() {
		return campRate;
	}

	public void setCampRate(double campRate) {
		this.campRate = campRate;
	}

	public MultipartFile getCampMapFile() {
		return campMapFile;
	}

	public void setCampMapFile(MultipartFile campMapFile) {
		this.campMapFile = campMapFile;
	}

	public MultipartFile getCampImgFile1() {
		return campImgFile1;
	}

	public void setCampImgFile1(MultipartFile campImgFile1) {
		this.campImgFile1 = campImgFile1;
	}

	public MultipartFile getCampImgFile2() {
		return campImgFile2;
	}

	public void setCampImgFile2(MultipartFile campImgFile2) {
		this.campImgFile2 = campImgFile2;
	}

	public MultipartFile getCampImgFile3() {
		return campImgFile3;
	}

	public void setCampImgFile3(MultipartFile campImgFile3) {
		this.campImgFile3 = campImgFile3;
	}

	public MultipartFile getCampImgFile4() {
		return campImgFile4;
	}

	public void setCampImgFile4(MultipartFile campImgFile4) {
		this.campImgFile4 = campImgFile4;
	}

	public MultipartFile getCampImgFile5() {
		return campImgFile5;
	}

	public void setCampImgFile5(MultipartFile campImgFile5) {
		this.campImgFile5 = campImgFile5;
	}	
	
	// Override toString
	public String toString() {
		return "\n -- Camp --"
			+ "\n [campNo] : " + campNo
			+ "\n [User] : " + user
			+ "\n [campTempSave] : " + campTempSave
			+ "\n [deleteFlag] : " + deleteFlag				
			+ "\n [campSummery] : " + campSummery
			+ "\n [campDetail] : " + campDetail 
			+ "\n [campMapImg] : " + campMapImg 
			+ "\n [campImg1] : " + campImg1 
			+ "\n [campImg2] : " + campImg2 
			+ "\n [campImg3] : " + campImg3 
			+ "\n [campImg4] : " + campImg4 
			+ "\n [campImg5] : " + campImg5 
			+ "\n [campViewCountCurrentMonth] : " + campViewCountCurrentMonth
			+ "\n [campReservationCount] : " + campReservationCount
			+ "\n [campRegDate] : " + campRegDate
			+ "\n [campTheme1] : " + campTheme1
			+ "\n [campTheme2] : " + campTheme2 
			+ "\n [campNature1] : " + campNature1 
			+ "\n [campNature2] : " + campNature2 
			+ "\n [campOperation1] : " + campOperation1 
			+ "\n [campOperation2] : " + campOperation2 
			+ "\n [campRate] : " + campRate 			
			+ "\n [campMapFile] : " + campMapFile 
			+ "\n [campImgFile1] : " + campImgFile1 
			+ "\n [campImgFile2] : " + campImgFile2 
			+ "\n [campImgFile3] : " + campImgFile3 
			+ "\n [campImgFile4] : " + campImgFile4 
			+ "\n [campImgFile5] : " + campImgFile5 					
			+ "\n ---------------- \n";
	}
	
}// end of class
