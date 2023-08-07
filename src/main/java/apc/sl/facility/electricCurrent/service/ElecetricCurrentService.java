package apc.sl.facility.electricCurrent.service;

import java.util.List;
import java.util.Map;

import apc.util.SearchVO;

public interface ElecetricCurrentService {
	
	List<Map<String, Object>> selectEc(SearchVO searchVO);
	
	Map<String,Object> selectMiddle(SearchVO searchVO);
	
	Map<String,Object> selectVal(SearchVO searchVO);
	
	List<?> selectGraphList(SearchVO searchVO);

}
