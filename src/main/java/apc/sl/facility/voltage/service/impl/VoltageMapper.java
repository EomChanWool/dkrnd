package apc.sl.facility.voltage.service.impl;

import java.util.List;
import java.util.Map;

import apc.util.SearchVO;
import egovframework.rte.psl.dataaccess.mapper.Mapper;

@Mapper("VoltageMapper")
public interface VoltageMapper {
	
	List<Map<String, Object>> selectV(SearchVO searchVO);
	
	Map<String,Object> selectMiddle(SearchVO searchVO);
	
	Map<String,Object> selectVal(SearchVO searchVO);
	
	List<?> selectGraphList(SearchVO searchVO);

}
