package egovframework.example.review.service.impl;

import java.util.List;
import egovframework.example.review.service.ReviewVO;
import egovframework.rte.psl.dataaccess.mapper.Mapper;


@Mapper
public interface ReviewMapper {

	/* 게시판 목록 조회 */
	public List<ReviewVO> selectReviewList() throws Exception;
	
}