package egovframework.example.review.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import egovframework.example.review.service.ReviewService;
import egovframework.example.review.service.ReviewVO;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;


@Service
public class ReviewServiceImpl implements ReviewService {

	@Autowired
	private ReviewMapper reviewMapper;
	
	/* 게시판 목록 조회 */
	@Override
	public List<ReviewVO> selectReviewList() throws Exception {
		return reviewMapper.selectReviewList();
	}

}