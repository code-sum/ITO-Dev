package egovframework.example.dashboard.service.impl;

import java.util.List;
import java.util.Map;

import egovframework.example.dashboard.service.BoardVO;
import egovframework.example.dashboard.service.RevVO;
import egovframework.rte.psl.dataaccess.mapper.Mapper;


@Mapper
public interface BoardMapper {
	
	/** 게시판 최신글 목록 조회 */
	public List<RevVO> revlist(Map<String, Object> paramMap) throws Exception;
	
	/** 시각화(Word Cloud) */
	public List<RevVO> wordcloud(Map<String, Object> paramMap) throws Exception;

	/** 약국 목록 조회 */
	public List<BoardVO> boardlist(Map<String, Object> paramMap) throws Exception;
	
	/** 약국 목록 카운트 조회  */
	public int countboardlist(Map<String, Object> paramMap) throws Exception;
	
	/** 약국 한건 조회  */
	public BoardVO boardselectone(int pharm_no) throws Exception;
	
}