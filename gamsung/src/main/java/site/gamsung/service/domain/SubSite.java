package site.gamsung.service.domain;

import java.sql.Date;

import org.springframework.web.multipart.MultipartFile;

public class SubSite {
	
	/*
	부가시설 번호
	캠핑장 등록번호
	부가시설 유형
	부가시설 등록일자
	부가시설 명
	상세정보
	부가시설 이미지
	캠핑장 명
	*/
	
	/// Field
	private int subSiteNo;
	private int campNo;
	private String subSiteType;
	private Date subSiteRegDate;
	private String subSiteName;
	private String subSiteInfo;
	private String subSiteImg;
	private String campName;
	private MultipartFile subSiteImgFile;

	
	/// Default Constructor
	public SubSite() {
		
	}
	
	/// Getter / Setter	
	public int getSubSiteNo() {
		return subSiteNo;
	}

	public void setSubSiteNo(int subSiteNo) {
		this.subSiteNo = subSiteNo;
	}

	public int getCampNo() {
		return campNo;
	}

	public void setCampNo(int campNo) {
		this.campNo = campNo;
	}

	public String getSubSiteType() {
		return subSiteType;
	}

	public void setSubSiteType(String subSiteType) {
		this.subSiteType = subSiteType;
	}

	public Date getSubSiteRegDate() {
		return subSiteRegDate;
	}

	public void setSubSiteRegDate(Date subSiteRegDate) {
		this.subSiteRegDate = subSiteRegDate;
	}

	public String getSubSiteName() {
		return subSiteName;
	}

	public void setSubSiteName(String subSiteName) {
		this.subSiteName = subSiteName;
	}

	public String getSubSiteInfo() {
		return subSiteInfo;
	}

	public void setSubSiteInfo(String subSiteInfo) {
		this.subSiteInfo = subSiteInfo;
	}

	public String getSubSiteImg() {
		return subSiteImg;
	}

	public void setSubSiteImg(String subSiteImg) {
		this.subSiteImg = subSiteImg;
	}

	public String getCampName() {
		return campName;
	}

	public void setCampName(String campName) {
		this.campName = campName;
	}

	public MultipartFile getSubSiteImgFile() {
		return subSiteImgFile;
	}

	public void setSubSiteImgFile(MultipartFile subSiteImgFile) {
		this.subSiteImgFile = subSiteImgFile;
	}

	// Override toString
	public String toString() {
		return "\n -- SubSite --"
			+ "\n [subSiteNo] : " + subSiteNo
			+ "\n [campNo] : " + campNo
			+ "\n [subSiteType] : " + subSiteType
			+ "\n [subSiteRegDate] : " + subSiteRegDate
			+ "\n [subSiteName] : " + subSiteName				
			+ "\n [subSiteInfo] : " + subSiteInfo
			+ "\n [subSiteImg] : " + subSiteImg 
			+ "\n [campName] : " + campName
			+ "\n [subSiteImgFile] : " + subSiteImgFile
			+ "\n ---------------- \n";
	}		

}// end of class
