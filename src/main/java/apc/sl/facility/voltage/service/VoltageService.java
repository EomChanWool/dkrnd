package apc.sl.facility.voltage.service;

import java.util.List;
import java.util.Map;

import apc.util.SearchVO;

public interface VoltageService {

	List<Map<String, Object>> selectV(SearchVO searchVO);
	
	Map<String,Object> selectMiddle(SearchVO searchVO);
	
	Map<String,Object> selectVal(SearchVO searchVO);
	
	List<?> selectGraphList(SearchVO searchVO);
}
