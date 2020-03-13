package kr.chans.project.model;

/**
 * @author chan
 *
 */
public class ProjectVO {

	private String pNo; 		// 프로젝트 넘버 
	private String pName;		// 프로젝트 이름 
	private String pStartDate;	// 프로젝트 시작날짜 yyyy-MM
	private String pEndDate;	// 프로젝트 종료시간 HH:mm 
	private String pSummary;	// 프로젝트 요약 
	private String pDetail;		// 프로젝트 상세 
	private String pLogoImage;	// 프로젝트 로고 이미지
	private String pCreateDate;	// 등록 날짜
	private String pCreateTime; // 등록 시간 
	private String pModDate;	// 수정 날
	private String pModTime;	// 수정 시간 
	public String getpNo() {
		return pNo;
	}
	public void setpNo(String pNo) {
		this.pNo = pNo;
	}
	public String getpName() {
		return pName;
	}
	public void setpName(String pName) {
		this.pName = pName;
	}
	public String getpStartDate() {
		return pStartDate;
	}
	public void setpStartDate(String pStartDate) {
		this.pStartDate = pStartDate;
	}
	public String getpEndDate() {
		return pEndDate;
	}
	public void setpEndDate(String pEndDate) {
		this.pEndDate = pEndDate;
	}
	public String getpSummary() {
		return pSummary;
	}
	public void setpSummary(String pSummary) {
		this.pSummary = pSummary;
	}
	public String getpDetail() {
		return pDetail;
	}
	public void setpDetail(String pDetail) {
		this.pDetail = pDetail;
	}
	public String getpLogoImage() {
		return pLogoImage;
	}
	public void setpLogoImage(String pLogoImage) {
		this.pLogoImage = pLogoImage;
	}
	public String getpCreateDate() {
		return pCreateDate;
	}
	public void setpCreateDate(String pCreateDate) {
		this.pCreateDate = pCreateDate;
	}
	public String getpCreateTime() {
		return pCreateTime;
	}
	public void setpCreateTime(String pCreateTime) {
		this.pCreateTime = pCreateTime;
	}
	public String getpModDate() {
		return pModDate;
	}
	public void setpModDate(String pModDate) {
		this.pModDate = pModDate;
	}
	public String getpModTime() {
		return pModTime;
	}
	public void setpModTime(String pModTime) {
		this.pModTime = pModTime;
	}
	
	
	
	
	
}
