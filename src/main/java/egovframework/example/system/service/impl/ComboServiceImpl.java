package egovframework.example.system.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;
import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;

import egovframework.example.system.service.ComboService;
import egovframework.example.system.service.ComboVO;


@Service
public class ComboServiceImpl implements ComboService {

	// Set logger
	private final Logger logger = LogManager.getLogger(this.getClass());
		
	// Get class name for logger
	private final String className = this.getClass().toString();
	
	@Autowired
	private ComboMapper comboMapper;
	
	/** 약국 대분류 */
	@Override
	public List<ComboVO> selectlargelist(Map<String, Object> paramMap) throws Exception {
		List<ComboVO> list = comboMapper.selectlargelist(paramMap);
		return list;
	}
	
	/** 약국 중분류 */
	@Override
	public List<ComboVO> selectmidlist(Map<String, Object> paramMap) throws Exception {
		List<ComboVO> list = comboMapper.selectmidlist(paramMap);
		return list;
	}
	
	/** 약국 대분류/중분류/소분류 콤보박스 */
	@Override
	public List<ComboVO> selectsmalllist(Map<String, Object> paramMap) throws Exception {
		List<ComboVO> list = comboMapper.selectsmalllist(paramMap);
		return list;
	}
	

}