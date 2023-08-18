package egovframework.example.region.service.impl;

import java.util.List;
import egovframework.example.region.service.RegionVO;
import egovframework.rte.psl.dataaccess.mapper.Mapper;


@Mapper
public interface RegionMapper {

	/* URL 연결 테스트 : 약국 목록 조회(5건만) */
	public List<RegionVO> selectRegionList() throws Exception;
	
}