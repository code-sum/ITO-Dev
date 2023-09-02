package egovframework.example.dashboard.web;

import java.util.ArrayList;
import java.util.HashMap;
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
import org.springframework.web.bind.annotation.ResponseBody;

import egovframework.example.dashboard.service.BoardService;
import egovframework.example.dashboard.service.BoardVO;
import egovframework.example.dashboard.service.ComboVO;


@Controller
@RequestMapping("/dashboard/")
public class BoardController {
		
	@Autowired
	private BoardService boardService;
	
	// Set logger
    private final Logger logger = LogManager.getLogger(this.getClass());

    // Get class name for logger
    private final String className = this.getClass().toString();
	
	
	/**
	 * 대시보드 초기화면 
	 */
	@RequestMapping("mainIndex.do")
	public String mainIndex(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
	         HttpServletResponse response, HttpSession session) throws Exception {
	      
	      logger.info("+ Start " + className + ".mainIndex");
	      logger.info("   - paramMap : " + paramMap);
	      
	      logger.info("+ End " + className + ".mainIndex");

	      return "dashboard/boardList";
	   }
	
	
	/** 
	 * 약국 대분류/중분류/소분류 콤보박스 
	 */
	@RequestMapping("pharCombo.do")
	@ResponseBody
	public Map<String, Object> pharCombo (Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
			HttpServletResponse response, HttpSession session) throws Exception {
		
		logger.info("+ Start " + className + ".pharCombo");
		logger.info("   - paramMap : " + paramMap);

		String ComType = (String) paramMap.get("comtype");
			
		List<ComboVO> comComboModel = new ArrayList<>();
		
		logger.info("   - ComType : " + ComType);
		
		if("l".equals(ComType)) {
			// 지역구분_광역시도 (대분류)
			comComboModel = boardService.selectlargelist(paramMap);
		} else if("m".equals(ComType)) {
			// 지역구분_시군구 (중분류)
			comComboModel = boardService.selectmidlist(paramMap);
		} else if("s".equals(ComType)) {
			// 약국이름_목록 (소분류)
			comComboModel = boardService.selectsmalllist(paramMap);
		}
		
		Map<String, Object> resultMap = new HashMap<String, Object>();

		resultMap.put("list", comComboModel);
		
		logger.info("+ End " + className + ".pharCombo");
		
		return resultMap;
	}
	
	
	/** 
	 * 약국 목록 조회
	 */
	@RequestMapping("boardlist.do")
	public String boardlist(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
	         HttpServletResponse response, HttpSession session) throws Exception {
		
		logger.info("+ Start " + className + ".boardlist");
        logger.info("   - paramMap : " + paramMap);
		
        int pagenum = Integer.parseInt((String) paramMap.get("pagenum"));
        int pageSize = Integer.parseInt((String) paramMap.get("pageSize"));
        int pageindex = (pagenum - 1) * pageSize;
        
        paramMap.put("pageSize", pageSize);
        paramMap.put("pageindex", pageindex);
        
        List<BoardVO> boardsearchlist = boardService.boardlist(paramMap);
        int totalcnt = boardService.countboardlist(paramMap);
        
        model.addAttribute("boardsearchlist", boardsearchlist);
        model.addAttribute("totalcnt", totalcnt);
        
        logger.info("+ End " + className + ".boardlist");

        return "dashboard/boardListGrd";
	}
	
	
	/**
     * 약국 한건 조회 
     */
	@RequestMapping("boardselectone.do")
    public String boardselectone(Model model, HttpServletRequest request) throws Exception {
        int pharm_no = Integer.parseInt(request.getParameter("pharm_no"));
        
        BoardVO boardVO = boardService.boardselectone(pharm_no);
        model.addAttribute("vo", boardVO);
        
        return "dashboard/boardOne";
    }
     
}