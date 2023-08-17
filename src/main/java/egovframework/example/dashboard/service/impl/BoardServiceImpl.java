package egovframework.example.dashboard.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.example.dashboard.service.BoardService;
import egovframework.example.dashboard.service.BoardVO;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;


@Service("BoardService")
public class BoardServiceImpl extends EgovAbstractServiceImpl implements BoardService{

	@Resource(name="BoardDAO")
	private BoardDAO boardDAO;
	
	/* URL 연결 테스트 : 약국 목록 조회(5건만) */
	@Override
	public List<?> SelectBoardList(BoardVO vo) throws Exception {
		return boardDAO.SelectBoardList(vo);
	}

}