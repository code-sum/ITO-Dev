package egovframework.example.review.service;

import java.util.List;

/* 게시판 목록 조회 */
public interface ReviewService {
	public List<?> SelectReviewList(ReviewVO vo) throws Exception;
}
