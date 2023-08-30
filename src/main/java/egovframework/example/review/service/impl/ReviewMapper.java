package egovframework.example.review.service.impl;

import java.util.List;
import java.util.Map;

import egovframework.example.dashboard.service.BoardVO;
import egovframework.example.review.service.ReviewVO;
import egovframework.rte.psl.dataaccess.mapper.Mapper;


@Mapper
public interface ReviewMapper {
	
	/** 게시판 목록 조회 */
	public List<ReviewVO> reviewlist(Map<String, Object> paramMap) throws Exception;
	
	/** 게시판 목록 카운트 조회  */
	public int countreviewlist(Map<String, Object> paramMap) throws Exception;
	
	/** 게시판 한건 조회  */
	public ReviewVO reviewselectone(int review_no) throws Exception;
	
	/** 게시판 글생성 */
	public void reviewinsert(ReviewVO reviewVO) throws Exception;
	
}