package egovframework.example.review.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.example.review.service.ReviewService;
import egovframework.example.review.service.ReviewVO;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;


@Service("ReviewService")
public class ReviewServiceImpl extends EgovAbstractServiceImpl implements ReviewService{

	@Resource(name="ReviewDAO")
	private ReviewDAO reviewDAO;
	
	@Override
	public List<?> SelectReviewList(ReviewVO vo) throws Exception {
		return reviewDAO.SelectReviewList(vo);
	}

}