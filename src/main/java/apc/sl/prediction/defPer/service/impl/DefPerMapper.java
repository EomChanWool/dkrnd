package apc.sl.prediction.defPer.service.impl;

import java.util.List;
import java.util.Map;

import apc.util.SearchVO;
import egovframework.rte.psl.dataaccess.mapper.Mapper;

@Mapper("DefPerMapper")
public interface DefPerMapper {
	
	int selectDefPerToCnt(SearchVO searchVO);

	Map<String, Object> selectProdCnt(SearchVO searchVO);
	
	List<?> selectBadList(SearchVO searchVO);
}
