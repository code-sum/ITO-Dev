package egovframework.example.region.service.impl;

import java.util.List;
import java.util.Map;

import egovframework.example.region.service.RegionVO;
import egovframework.rte.psl.dataaccess.mapper.Mapper;


@Mapper
public interface RegionMapper {

	/** 광역시도별 약국 개수 */
	public List<RegionVO> pharmcntbyregion(RegionVO regionVO) throws Exception;
	
	/** 전체 약국 개수 */
	/*
	public int counttotal(Map<String, Object> paramMap) throws Exception;
	*/
	
}