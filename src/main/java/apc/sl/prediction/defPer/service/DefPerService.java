package apc.sl.prediction.defPer.service;

import java.util.List;
import java.util.Map;

import apc.util.SearchVO;

public interface DefPerService {
	
	int selectDefPerToCnt(SearchVO searchVO);

	Map<String, Object> selectProdCnt(SearchVO searchVO);
	
	List<?> selectBadList(SearchVO searchVO);
	
}
