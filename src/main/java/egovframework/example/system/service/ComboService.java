package egovframework.example.system.service;

import java.util.List;
import java.util.Map;

public interface ComboService {
	
	/** 약국 대분류 */
	public List<ComboVO> selectlargelist(Map<String, Object> paramMap) throws Exception;
	
	/** 약국 중분류 */
	public List<ComboVO> selectmidlist(Map<String, Object> paramMap) throws Exception;
	
	/** 약국 대분류/중분류/소분류 콤보박스 */
	public List<ComboVO> selectsmalllist(Map<String, Object> paramMap) throws Exception;

}
