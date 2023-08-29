package egovframework.example.system.service.impl;

import java.util.List;
import java.util.Map;

import egovframework.example.dashboard.service.BoardVO;
import egovframework.example.system.service.ComboVO;
import egovframework.rte.psl.dataaccess.mapper.Mapper;


@Mapper
public interface ComboMapper {

	/** 약국 대분류 */
	public List<ComboVO> selectlargelist(Map<String, Object> paramMap) throws Exception;
	
	/** 약국 중분류 */
	public List<ComboVO> selectmidlist(Map<String, Object> paramMap) throws Exception;
	
	/** 약국 대분류/중분류/소분류 콤보박스 */
	public List<ComboVO> selectsmalllist(Map<String, Object> paramMap) throws Exception;
	
}