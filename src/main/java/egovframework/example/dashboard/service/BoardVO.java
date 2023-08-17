package egovframework.example.dashboard.service;

public class BoardVO {
	
	/* 대상 테이블 : tb_pharm */
	private int pharm_no;  // 약국번호
	private String pharm_name;  // 약국이름
	private int sido_code;  // 시도코드
	private String sido_name;  // 시도코드명
	private int sigungu_code;  // 시군구코드
	private String sigungu_name;  // 시군구코드명
	private int pharm_zip;  // 약국 우편번호
	private String pharm_add;  // 약국 주소
	private String pharm_tel;  // 약국 전화번호
	private String pharm_open;  // 약국 개설일자
	private String pharm_x;  // 약국 좌표(x)
	private String pharm_y;  // 약국 좌표(y)
	
	
	public int getPharm_no() {
		return pharm_no;
	}
	public void setPharm_no(int pharm_no) {
		this.pharm_no = pharm_no;
	}
	public String getPharm_name() {
		return pharm_name;
	}
	public void setPharm_name(String pharm_name) {
		this.pharm_name = pharm_name;
	}
	public int getSido_code() {
		return sido_code;
	}
	public void setSido_code(int sido_code) {
		this.sido_code = sido_code;
	}
	public String getSido_name() {
		return sido_name;
	}
	public void setSido_name(String sido_name) {
		this.sido_name = sido_name;
	}
	public int getSigungu_code() {
		return sigungu_code;
	}
	public void setSigungu_code(int sigungu_code) {
		this.sigungu_code = sigungu_code;
	}
	public String getSigungu_name() {
		return sigungu_name;
	}
	public void setSigungu_name(String sigungu_name) {
		this.sigungu_name = sigungu_name;
	}
	public int getPharm_zip() {
		return pharm_zip;
	}
	public void setPharm_zip(int pharm_zip) {
		this.pharm_zip = pharm_zip;
	}
	public String getPharm_add() {
		return pharm_add;
	}
	public void setPharm_add(String pharm_add) {
		this.pharm_add = pharm_add;
	}
	public String getPharm_tel() {
		return pharm_tel;
	}
	public void setPharm_tel(String pharm_tel) {
		this.pharm_tel = pharm_tel;
	}
	public String getPharm_open() {
		return pharm_open;
	}
	public void setPharm_open(String pharm_open) {
		this.pharm_open = pharm_open;
	}
	public String getPharm_x() {
		return pharm_x;
	}
	public void setPharm_x(String pharm_x) {
		this.pharm_x = pharm_x;
	}
	public String getPharm_y() {
		return pharm_y;
	}
	public void setPharm_y(String pharm_y) {
		this.pharm_y = pharm_y;
	}
	
}
