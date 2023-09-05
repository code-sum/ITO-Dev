package egovframework.example.dashboard.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;
import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;

import egovframework.example.dashboard.service.BoardService;
import egovframework.example.dashboard.service.BoardVO;


@Service
public class BoardServiceImpl implements BoardService {

	// Set logger
	private final Logger logger = LogManager.getLogger(this.getClass());
		
	// Get class name for logger
	private final String className = this.getClass().toString();
	
	@Autowired
	private BoardMapper boardMapper;
	
	
	/** 약국 목록 조회 */
	@Override
	public List<BoardVO> boardlist(Map<String, Object> paramMap) throws Exception {
		return boardMapper.boardlist(paramMap);
	}
	
	/** 약국 목록 카운트 조회  */
	@Override
	public int countboardlist(Map<String, Object> paramMap) throws Exception {
		return boardMapper.countboardlist(paramMap);
	}
	
	/** 약국 한건 조회 */
    @Override
	public BoardVO boardselectone(int pharm_no) throws Exception {
		return boardMapper.boardselectone(pharm_no);
	}
	

}