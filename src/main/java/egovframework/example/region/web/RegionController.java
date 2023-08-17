package egovframework.example.region.web;

import java.util.List;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import egovframework.example.region.service.RegionService;
import egovframework.example.region.service.RegionVO;


@Controller
public class RegionController {
	
	private static Logger Logger = LoggerFactory.getLogger(RegionController.class);
	
	
	@Resource(name="RegionService")
	private RegionService regionService;
	
	
	/* URL 연결 테스트 : 약국 목록 조회(5건만) */
	@RequestMapping(value="/regionList.do")
	public String selectPharList(RegionVO vo, Model model) throws Exception {
		Logger.debug("pharList......sdfsdfsdfsdfsdfsdfiojwioerjsodijdfijsdio...........");
		List<?> list = regionService.SelectRegionList(vo);
		
		System.out.println(list);

		model.addAttribute("list",list);
		return "region/regionList";
		
	}
	
}