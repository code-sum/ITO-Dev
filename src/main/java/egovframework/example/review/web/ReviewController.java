package egovframework.example.review.web;

import java.util.List;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import egovframework.example.review.service.ReviewService;
import egovframework.example.review.service.ReviewVO;


@Controller
public class ReviewController {
	private static Logger Logger = LoggerFactory.getLogger(ReviewController.class);
	
	
	@Resource(name="ReviewService")
	private ReviewService reviewService;
	
	
	@RequestMapping(value="/reviewList.do")
	public String selectDeptList(ReviewVO vo, Model model) throws Exception {
		Logger.debug("deptList......sdfsdfsdfsdfsdfsdfiojwioerjsodijdfijsdio...........");
		List<?> list = reviewService.SelectReviewList(vo);
		
		System.out.println(list);

		model.addAttribute("list", list);
		return "review/reviewList";
	}
	
}