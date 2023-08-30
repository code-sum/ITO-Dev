package egovframework.example.review.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;
import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;

import egovframework.example.dashboard.service.BoardVO;
import egovframework.example.review.service.ReviewService;
import egovframework.example.review.service.ReviewVO;


@Service
public class ReviewServiceImpl implements ReviewService {

	// Set logger
	private final Logger logger = LogManager.getLogger(this.getClass());
		
	// Get class name for logger
	private final String className = this.getClass().toString();
	
	@Autowired
	private ReviewMapper reviewMapper;
	
	/** 게시판 목록 조회 */
	@Override
	public List<ReviewVO> reviewlist(Map<String, Object> paramMap) throws Exception {
		return reviewMapper.reviewlist(paramMap);
	}
	
	/** 게시판 목록 카운트 조회  */
	@Override
	public int countreviewlist(Map<String, Object> paramMap) throws Exception {
		return reviewMapper.countreviewlist(paramMap);
	}
	
	/** 게시판 한건 조회  */
	@Override
	public ReviewVO reviewselectone(int review_no) throws Exception {
		return reviewMapper.reviewselectone(review_no);
	}
	
	/** 게시판 글생성 */
	@Override
    public void reviewinsert(ReviewVO reviewVO) throws Exception {
		reviewMapper.reviewinsert(reviewVO);
    }
	
	/** 게시판 글수정 */
	@Override
    public void reviewupdate(ReviewVO reviewVO) throws Exception {
		reviewMapper.reviewupdate(reviewVO);
    }
	
	/** 게시판 글삭제 */
	@Override
    public void reviewdelete(int review_no) throws Exception {
		reviewMapper.reviewdelete(review_no);
    }
	

}