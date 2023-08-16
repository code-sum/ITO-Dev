package egovframework.example.sample.web;

import java.util.List;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import egovframework.example.sample.service.BoardService;
import egovframework.example.sample.service.BoardVO;


@Controller
public class BoardController {
	private static Logger Logger = LoggerFactory.getLogger(BoardController.class);
	
	
	@Resource(name="BoardService")
	private BoardService boardService;
	
	
	@RequestMapping(value="/boardList.do")
	public String selectDeptList(BoardVO vo, Model model) throws Exception {
		Logger.debug("deptList......sdfsdfsdfsdfsdfsdfiojwioerjsodijdfijsdio...........");
		List<?> list = boardService.SelectBoardList(vo);
		
		System.out.println(list);

		model.addAttribute("list",list);
		return "board/boardList";
	}
	
}