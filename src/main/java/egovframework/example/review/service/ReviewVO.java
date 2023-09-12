package egovframework.example.review.service;

public class ReviewVO {
	
	/* 대상 테이블 : tb_review */
	private int review_no;  // 글번호
	private String review_title;  // 글제목
	private String review_content;  // 글내용
	private int review_password;  // 글비밀번호
	private String review_created_at;  // 글작성일 ... DATE 형식이어도 VO 선언할 땐 String 으로 받을 수 있다.
	private String review_writer;  // 글작성자
	
	
	public int getReview_no() {
		return review_no;
	}
	public void setReview_no(int review_no) {
		this.review_no = review_no;
	}
	public String getReview_title() {
		return review_title;
	}
	public void setReview_title(String review_title) {
		this.review_title = review_title;
	}
	public String getReview_content() {
		return review_content;
	}
	public void setReview_content(String review_content) {
		this.review_content = review_content;
	}
	public int getReview_password() {
		return review_password;
	}
	public void setReview_password(int review_password) {
		this.review_password = review_password;
	}
	public String getReview_created_at() {
		return review_created_at;
	}
	public void setReview_created_at(String review_created_at) {
		this.review_created_at = review_created_at;
	}
	public String getReview_writer() {
		return review_writer;
	}
	public void setReview_writer(String review_writer) {
		this.review_writer = review_writer;
	}
	
}
