package egovframework.example.dashboard.service.impl;

import java.util.List;
import java.util.Map;

import egovframework.example.dashboard.service.BoardVO;
import egovframework.example.dashboard.service.ComboVO;
import egovframework.rte.psl.dataaccess.mapper.Mapper;


@Mapper
public interface BoardMapper {
	
	/** 약국 대분류 */
	public List<ComboVO> selectlargelist(Map<String, Object> paramMap) throws Exception;
	
	/** 약국 중분류 */
	public List<ComboVO> selectmidlist(Map<String, Object> paramMap) throws Exception;
	
	/** 약국 대분류/중분류/소분류 콤보박스 */
	public List<ComboVO> selectsmalllist(Map<String, Object> paramMap) throws Exception;

	/** 약국 목록 조회 */
	public List<BoardVO> boardlist(Map<String, Object> paramMap) throws Exception;
	
	/** 약국 목록 카운트 조회  */
	public int countboardlist(Map<String, Object> paramMap) throws Exception;
	
	/** 약국 한건 조회  */
	public BoardVO boardselectone(int pharm_no) throws Exception;
	
}