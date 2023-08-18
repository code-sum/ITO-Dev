package egovframework.example.review.service.impl;

import org.apache.ibatis.annotations.Mapper;
import java.util.List;
import egovframework.example.review.service.ReviewVO;


@Mapper
public interface ReviewMapper {

	/* 게시판 목록 조회 */
	public List<ReviewVO> selectReviewList() throws Exception;
	
}