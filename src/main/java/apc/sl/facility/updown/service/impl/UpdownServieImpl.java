package apc.sl.facility.updown.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import apc.sl.facility.updown.service.UpdownService;
import apc.util.SearchVO;

@Service
public class UpdownServieImpl implements UpdownService {

	@Resource
	private UpdownMapper updownMapper;

	@Override
	public int selectUpdownListToCnt(SearchVO searchVO) {
		return updownMapper.selectUpdownListToCnt(searchVO);
	}

	@Override
	public List<?> selectUpdownList(SearchVO searchVO) {
		return updownMapper.selectUpdownList(searchVO);
	}

	@Override
	public void registUpdown(Map<String, Object> map) {
		updownMapper.registUpdown(map);
	}

	@Override
	public Map<String, Object> selcetUpdownInfo(Map<String, Object> map) {
		return updownMapper.selcetUpdownInfo(map);
	}

	@Override
	public void modifyUpdown(Map<String, Object> map) {
		updownMapper.modifyUpdown(map);
	}

	@Override
	public void deleteUpdown(Map<String, Object> map) {
		updownMapper.deleteUpdown(map);
	}

	@Override
	public int selectUpdownExist(Map<String, Object> map) {
		return updownMapper.selectUpdownExist(map);
	}
	
}
