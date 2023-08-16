package egovframework.example.sample.service.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import egovframework.example.sample.service.BoardVO;
import egovframework.rte.psl.dataaccess.EgovAbstractDAO;

// test
@Repository("BoardDAO")
public class BoardDAO extends EgovAbstractDAO{

	public List<?> SelectBoardList(BoardVO vo) {
		return (List<?>) list("boardDAO.SelectBoardList",vo);
	}
	
}