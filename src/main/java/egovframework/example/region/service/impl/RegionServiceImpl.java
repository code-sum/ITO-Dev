package egovframework.example.region.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import egovframework.example.region.service.RegionService;
import egovframework.example.region.service.RegionVO;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;


@Service
public class RegionServiceImpl implements RegionService {

	@Autowired
	private RegionMapper regionMapper;
	
	/* URL 연결 테스트 : 약국 목록 조회(5건만) */
	@Override
	public List<RegionVO> selectRegionList() throws Exception {
		return regionMapper.selectRegionList();
	}

}