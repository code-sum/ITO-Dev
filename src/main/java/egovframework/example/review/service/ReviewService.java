package egovframework.example.review.service;

import java.util.List;
import java.util.Map;

import egovframework.example.review.service.ReviewVO;

public interface ReviewService {
	
	/** 게시판 목록 조회 */
	public List<ReviewVO> reviewlist(Map<String, Object> paramMap) throws Exception;
	
	/** 게시판 목록 카운트 조회  */
	public int countreviewlist(Map<String, Object> paramMap) throws Exception;
	
}
