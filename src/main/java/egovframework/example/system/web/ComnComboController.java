package egovframework.example.system.web;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.HashMap;

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

import egovframework.example.system.service.ComboService;
import egovframework.example.system.service.ComboVO;


@Controller
@RequestMapping("/system/")
public class ComnComboController {
		
	@Autowired
	private ComboService comboService;
	
	// Set logger
    private final Logger logger = LogManager.getLogger(this.getClass());

    // Get class name for logger
    private final String className = this.getClass().toString();
	
	
    /**
	 *  약국 대분류/중분류/소분류 콤보박스 
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
			comComboModel = comboService.selectlargelist(paramMap);
		} else if("m".equals(ComType)) {
			// 지역구분_시군구 (중분류)
			comComboModel = comboService.selectmidlist(paramMap);
		} else if("s".equals(ComType)) {
			// 약국이름_목록 (소분류)
			comComboModel = comboService.selectsmalllist(paramMap);
		}
		
		Map<String, Object> resultMap = new HashMap<String, Object>();

		resultMap.put("list", comComboModel);
		
		logger.info("+ End " + className + ".pharCombo");
		
		return resultMap;
	}	

	
}