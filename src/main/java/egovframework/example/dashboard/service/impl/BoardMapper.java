package egovframework.example.dashboard.service.impl;

import org.apache.ibatis.annotations.Mapper;
import java.util.List;
import egovframework.example.dashboard.service.BoardVO;


@Mapper
public interface BoardMapper {

	/* URL 연결 테스트 : 약국 목록 조회(5건만) */
	public List<BoardVO> selectBoardList() throws Exception;
	
}