package egovframework.example.region.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.example.region.service.RegionService;
import egovframework.example.region.service.RegionVO;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;


@Service("RegionService")
public class RegionServiceImpl extends EgovAbstractServiceImpl implements RegionService{

	@Resource(name="RegionDAO")
	private RegionDAO regionDAO;
	
	/* URL 연결 테스트 : 약국 목록 조회(5건만) */
	@Override
	public List<?> SelectRegionList(RegionVO vo) throws Exception {
		return regionDAO.SelectRegionList(vo);
	}

}