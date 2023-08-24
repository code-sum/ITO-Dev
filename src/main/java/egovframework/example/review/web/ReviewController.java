package egovframework.example.review.web;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import egovframework.example.review.service.ReviewService;
import egovframework.example.review.service.ReviewVO;


@Controller
@RequestMapping("/review/")
public class ReviewController {	
	
	@Autowired
	private ReviewService reviewService;
	
	// Set logger
    private final Logger logger = LogManager.getLogger(this.getClass());

    // Get class name for logger
    private final String className = this.getClass().toString();
	
	
    /**
	 * 약국 추천 게시판 초기화면 
	 */
	@RequestMapping("reviewIndex.do")
	public String reviewIndex(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
	         HttpServletResponse response, HttpSession session) throws Exception {
	      
	      logger.info("+ Start " + className + ".reviewIndex");
	      logger.info("   - paramMap : " + paramMap);
	      
	      logger.info("+ End " + className + ".reviewIndex");

	      return "review/reviewList";
	   }
	
}