package egovframework.example.region.web;

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

import egovframework.example.region.service.RegionService;
import egovframework.example.region.service.RegionVO;


@Controller
@RequestMapping("/region/")
public class RegionController {	
	
	@Autowired
	private RegionService regionService;
	
	// Set logger
    private final Logger logger = LogManager.getLogger(this.getClass());

    // Get class name for logger
    private final String className = this.getClass().toString();
	
	
    /**
	 * 지역별 약국 현황 초기화면 
	 */
	@RequestMapping("regionIndex.do")
	public String regionIndex(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
	         HttpServletResponse response, HttpSession session) throws Exception {
	      
	      logger.info("+ Start " + className + ".regionIndex");
	      logger.info("   - paramMap : " + paramMap);
	      
	      List<RegionVO> pharmacybyregion = regionService.pharmacybyregion(paramMap);
	      /*
	      int totalcnt = regionService.counttotal(paramMap);
	      */
	        
	      model.addAttribute("pharmacybyregion", pharmacybyregion);
	      /*
	      model.addAttribute("totalcnt", totalcnt);
	      */
	      
	      logger.info("+ End " + className + ".regionIndex");

	      return "region/regionList";
	   }
	
}