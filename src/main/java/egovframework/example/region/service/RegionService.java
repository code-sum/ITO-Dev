package egovframework.example.region.service;

import java.util.List;
import java.util.Map;

public interface RegionService {

	/** 시도별 약국 현황 목록 조회 */
	public List<RegionVO> pharmcntbyregion(RegionVO regionVO) throws Exception;
	
	/** 전체 약국 개수 */
	/*
	public int counttotal(Map<String, Object> paramMap) throws Exception;
	*/
	
}
