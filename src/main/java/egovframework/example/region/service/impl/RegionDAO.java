package egovframework.example.region.service.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import egovframework.example.region.service.RegionVO;
import egovframework.rte.psl.dataaccess.EgovAbstractDAO;


@Repository("RegionDAO")
public class RegionDAO extends EgovAbstractDAO{

	/* URL 연결 테스트 : 약국 목록 조회(5건만) */
	public List<?> SelectRegionList(RegionVO vo) {
		return (List<?>) list("regionDAO.SelectRegionList",vo);
	}
	
}