package egovframework.example.dashboard.service;

import java.util.List;
import java.util.Map;

public interface BoardService {
	
	/** 약국 목록 조회 (일단 30건만) */
	public List<BoardVO> boardlist(Map<String, Object> paramMap) throws Exception;
	
	/** 약국 목록 카운트 조회  */
	public int countboardlist(Map<String, Object> paramMap) throws Exception;
	
}
