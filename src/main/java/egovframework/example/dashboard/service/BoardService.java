package egovframework.example.dashboard.service;

import java.util.List;

public interface BoardService {
	
	/* URL 연결 테스트 : 약국 목록 조회(5건만) */
	public List<?> SelectBoardList(BoardVO vo) throws Exception;
	
}
