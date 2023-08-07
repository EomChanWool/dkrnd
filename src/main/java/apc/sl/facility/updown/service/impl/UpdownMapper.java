package apc.sl.facility.updown.service.impl;

import java.util.List;
import java.util.Map;

import apc.util.SearchVO;
import egovframework.rte.psl.dataaccess.mapper.Mapper;

@Mapper("UpdownMapper")
public interface UpdownMapper {

	int selectUpdownListToCnt(SearchVO searchVO);
	
	int selectUpdownExist(Map<String, Object> map);
	
	List<?> selectUpdownList(SearchVO searchVO);
	
	Map<String, Object> selcetUpdownInfo(Map<String, Object> map);
	
	void registUpdown(Map<String, Object> map);
	
	void modifyUpdown(Map<String, Object> map);
	
	void deleteUpdown(Map<String, Object> map);
	
}
