package apc.sl.facility.updown.service;

import java.util.List;
import java.util.Map;

import apc.util.SearchVO;

public interface UpdownService {

	int selectUpdownListToCnt(SearchVO searchVO);
	
	int selectUpdownExist(Map<String, Object> map);
	
	List<?> selectUpdownList(SearchVO searchVO);
	
	Map<String, Object> selcetUpdownInfo(Map<String, Object> map);
	
	void registUpdown(Map<String, Object> map);
	
	void modifyUpdown(Map<String, Object> map);
	
	void deleteUpdown(Map<String, Object> map);
	
}
