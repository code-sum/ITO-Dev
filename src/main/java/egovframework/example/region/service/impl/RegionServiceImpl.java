package egovframework.example.region.service.impl;

import java.util.List;
import java.util.Map;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import egovframework.example.region.service.RegionService;
import egovframework.example.region.service.RegionVO;


@Service
public class RegionServiceImpl implements RegionService {
	
	// Set logger
	private final Logger logger = LogManager.getLogger(this.getClass());
		
	// Get class name for logger
	private final String className = this.getClass().toString();

	@Autowired
	private RegionMapper regionMapper;
	
	/** 시각화(표) */
	@Override
	public List<RegionVO> pharmcntbyregion(RegionVO regionVO) throws Exception {
		return regionMapper.pharmcntbyregion(regionVO);
	}
	
	/** 시각화(차트) */
	@Override
	public List<RegionVO> visualization(Map<String, Object> paramMap) throws Exception {
		List<RegionVO> list = regionMapper.visualization(paramMap);
		return list;
	}
	
	/** 전체 약국 개수 */
	/*
	@Override
	public int counttotal(Map<String, Object> paramMap) throws Exception {
		return regionMapper.counttotal(paramMap);
	}
	*/

}