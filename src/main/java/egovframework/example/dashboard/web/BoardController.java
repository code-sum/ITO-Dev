package egovframework.example.dashboard.web;

import java.util.List;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import egovframework.example.dashboard.service.BoardService;
import egovframework.example.dashboard.service.BoardVO;


@Controller
public class BoardController {
	private static Logger Logger = LoggerFactory.getLogger(BoardController.class);
	
	
	@Resource(name="BoardService")
	private BoardService boardService;
	
	
	/* URL 연결 테스트 : 약국 목록 조회(5건만) */
	@RequestMapping(value="/boardList.do")
	public String selectSearchList(BoardVO vo, Model model) throws Exception {
		Logger.debug("searchList......sdfsdfsdfsdfsdfsdfiojwioerjsodijdfijsdio...........");
		List<?> list = boardService.SelectBoardList(vo);
		
		System.out.println(list);

		model.addAttribute("list",list);
		return "dashboard/boardList";
	}
	
}