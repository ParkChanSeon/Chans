package kr.chans.project.model;

/**
 * @author chan
 *
 */
public class ProjectVO {

	private String pNo; 		// 프로젝트 넘버 
	private String pTitle;		// 프로젝트 이름 
	private String pStartDate;	// 프로젝트 시작날짜 yyyy-MM
	private String pEndDate;	// 프로젝트 종료시간 HH:mm 
	private String pSummary;	// 프로젝트 요약 
	private String pDetail;		// 프로젝트 상세 
	
	private String pCreateDate;	// 등록 날짜
	private String pCreateTime; // 등록 시간 
	private String pModDate;	// 수정 날
	private String pModTime;	// 수정 시간 
	private String pCreateUser; // 작성자
	private String pModUser;
	private String pUseYn;
	
	
	
	public String getpUseYn() {
		return pUseYn;
	}
	
	public void setpUseYn(String pUseYn) {
		this.pUseYn = pUseYn;
	}
	public String getpNo() {
		return pNo;
	}
	public void setpNo(String pNo) {
		this.pNo = pNo;
	}
	public String getpTitle() {
		return pTitle;
	}
	public void setpTitle(String pTitle) {
		this.pTitle = pTitle;
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
	public String getpCreateUser() {
		return pCreateUser;
	}
	public void setpCreateUser(String pCreateUser) {
		this.pCreateUser = pCreateUser;
	}
	public String getpModUser() {
		return pModUser;
	}
	public void setpModUser(String pModUser) {
		this.pModUser = pModUser;
	}
	
	
	
	
	
	
}
