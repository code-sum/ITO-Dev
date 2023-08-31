package egovframework.example.region.service;

import java.util.List;
import java.util.Map;

public interface RegionService {

	/** 광역시도별 약국 개수 */
	public List<RegionVO> pharmacybyregion(Map<String, Object> paramMap) throws Exception;
	
	/** 전체 약국 개수 */
	/*
	public int counttotal(Map<String, Object> paramMap) throws Exception;
	*/
	
}
