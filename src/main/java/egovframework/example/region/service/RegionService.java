package egovframework.example.region.service;

import java.util.List;

public interface RegionService {

	/* URL 연결 테스트 : 약국 목록 조회(5건만) */
	public List<RegionVO> selectRegionList() throws Exception;
	
}
