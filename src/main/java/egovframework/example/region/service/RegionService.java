package egovframework.example.region.service;

import java.util.List;
import java.util.Map;

public interface RegionService {

	/** 시각화(표) */
	public List<RegionVO> pharmcntbyregion(RegionVO regionVO) throws Exception;
	
	/** 시각화(차트) */
	public List<RegionVO> visualization(Map<String, Object> paramMap) throws Exception;
	
	/** 전체 약국 개수 */
	/*
	public int counttotal(Map<String, Object> paramMap) throws Exception;
	*/
	
}
