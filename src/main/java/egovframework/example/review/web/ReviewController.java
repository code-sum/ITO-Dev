package egovframework.example.review.web;

import java.io.PrintWriter;

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
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

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
	 * 게시판 초기화면 
	 */
	@RequestMapping("reviewIndex.do")
	public String reviewIndex(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
	         HttpServletResponse response, HttpSession session) throws Exception {
	      
	      logger.info("+ Start " + className + ".reviewIndex");
	      logger.info("   - paramMap : " + paramMap);
	      
	      logger.info("+ End " + className + ".reviewIndex");

	      return "review/reviewList";
	   }
	
	
	/** 
	 * 게시판 목록 조회
	 */
	@RequestMapping("reviewlist.do")
	public String reviewlist(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
	         HttpServletResponse response, HttpSession session) throws Exception {
		
		logger.info("+ Start " + className + ".reviewlist");
        logger.info("   - paramMap : " + paramMap);
		
        int pagenum = Integer.parseInt((String) paramMap.get("pagenum"));
        int pageSize = Integer.parseInt((String) paramMap.get("pageSize"));
        int pageindex = (pagenum - 1) * pageSize;
        
        paramMap.put("pageSize", pageSize);
        paramMap.put("pageindex", pageindex);
        
        List<ReviewVO> reviewsearchlist = reviewService.reviewlist(paramMap);
        int totalcnt = reviewService.countreviewlist(paramMap);
        
        model.addAttribute("reviewsearchlist", reviewsearchlist);
        model.addAttribute("totalcnt", totalcnt);
        
        logger.info("+ End " + className + ".reviewlist");

        return "review/reviewListGrd";
	}
	
	
	/**
     * 게시판 한건 조회 
     */
	@RequestMapping("reviewselectone.do")
    public String reviewselectone(Model model, HttpServletRequest request) throws Exception {
        int review_no = Integer.parseInt(request.getParameter("review_no"));
        
        ReviewVO reviewVO = reviewService.reviewselectone(review_no);
        model.addAttribute("vo", reviewVO);
        
        return "review/reviewOne";
    }
	
	
	/**
     * 게시판 글생성 화면
     */
	@RequestMapping("insertview.do")
    public String insertview(){
        return "review/reviewInsert";
    }
	
	
	/**
     * 게시판 글생성
     * @ModelAttribute는 사용자가 요청시 전달하는 값을 오브젝트 형태로 매핑해주는 어노테이션
     */
	@RequestMapping("reviewinsert.do")
    public String write(@ModelAttribute("reviewVO") ReviewVO reviewVO) throws Exception {
		reviewService.reviewinsert(reviewVO);
        return "redirect:reviewIndex.do";
    }
	
	
	/**
     * 게시판 글수정 [저장] 버튼 클릭
     */
	@RequestMapping(value="reviewupdate.do", method=RequestMethod.POST)
	@ResponseBody
    public String reviewupdate(@RequestBody ReviewVO reviewVO) {
		try {
	        reviewService.reviewupdate(reviewVO);
	        return "success";
	    } catch (Exception e) {
	        e.printStackTrace();
	        return "failure";
	    }
    }
    
    
    /**
     * 게시판 비밀번호 확인 컨트롤러
     */
    @RequestMapping(value="checkPassword.do", method=RequestMethod.POST)
    public void checkPassword(HttpServletRequest request, HttpServletResponse response) throws Exception {
        // 클라이언트에서 전송한 데이터 받기
        String reviewNoStr = request.getParameter("review_no");
        String password = request.getParameter("password");

        // 결과를 기본적으로 false로 초기화
        boolean isPasswordCorrect = false;

        try {
            int reviewNo = Integer.parseInt(reviewNoStr);
            ReviewVO reviewVO = reviewService.reviewselectone(reviewNo);

            // DB에서 해당 게시물의 비밀번호를 가져와 입력한 비밀번호와 비교
            if (reviewVO != null && Integer.toString(reviewVO.getReview_password()).equals(password)) {
                isPasswordCorrect = true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        // 결과를 클라이언트 반환
        response.setContentType("text/plain; charset=UTF-8");
        PrintWriter out = response.getWriter();
        out.print(isPasswordCorrect);
        out.flush();
        out.close();
    }
  
    
    /**
     * 게시판 글삭제
     */
    @RequestMapping("reviewdelete.do")
    public String reviewdelete(HttpServletRequest request) throws Exception {
        int review_no = Integer.parseInt(request.getParameter("review_no"));
        reviewService.reviewdelete(review_no);
        return "redirect:reviewIndex.do";
    }
	
	
}