package egovframework.example.region.service.impl;

import org.apache.ibatis.annotations.Mapper;
import java.util.List;
import egovframework.example.region.service.RegionVO;


@Mapper
public interface RegionMapper {

	/* URL 연결 테스트 : 약국 목록 조회(5건만) */
	public List<RegionVO> selectRegionList() throws Exception;
	
}