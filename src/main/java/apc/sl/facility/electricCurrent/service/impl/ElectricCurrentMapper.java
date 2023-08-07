package apc.sl.facility.electricCurrent.service.impl;

import java.util.List;
import java.util.Map;

import apc.util.SearchVO;
import egovframework.rte.psl.dataaccess.mapper.Mapper;

@Mapper("electricCurrentMapper")
public interface ElectricCurrentMapper {
	
	List<Map<String, Object>> selectEc(SearchVO searchVO);
	
	Map<String,Object> selectMiddle(SearchVO searchVO);
	
	Map<String,Object> selectVal(SearchVO searchVO);
	
	List<?> selectGraphList(SearchVO searchVO);

}
