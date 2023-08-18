package egovframework.example.review.service;

import java.util.List;

public interface ReviewService {
	
	/* 게시판 목록 조회 */
	public List<ReviewVO> selectReviewList() throws Exception;
	
}
