package egovframework.example.dashboard.service.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import egovframework.example.dashboard.service.BoardVO;
import egovframework.rte.psl.dataaccess.EgovAbstractDAO;


@Repository("BoardDAO")
public class BoardDAO extends EgovAbstractDAO{

	/* URL 연결 테스트 : 약국 목록 조회(5건만) */
	public List<?> SelectBoardList(BoardVO vo) {
		return (List<?>) list("boardDAO.SelectBoardList",vo);
	}
	
}