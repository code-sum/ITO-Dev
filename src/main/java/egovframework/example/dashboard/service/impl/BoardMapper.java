package egovframework.example.dashboard.service.impl;

import java.util.List;
import egovframework.example.dashboard.service.BoardVO;
import egovframework.rte.psl.dataaccess.mapper.Mapper;


@Mapper
public interface BoardMapper {

	/* URL 연결 테스트 : 약국 목록 조회(5건만) */
	public List<BoardVO> selectBoardList() throws Exception;
	
}