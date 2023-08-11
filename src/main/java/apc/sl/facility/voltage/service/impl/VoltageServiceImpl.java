package apc.sl.facility.voltage.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import apc.sl.facility.voltage.service.VoltageService;
import apc.util.SearchVO;

@Service
public class VoltageServiceImpl implements VoltageService {

	@Resource
	private VoltageMapper VoltageMapper; 
	
	@Override
	public List<Map<String, Object>> selectV(SearchVO searchVO) {
		return VoltageMapper.selectV(searchVO);
	}

	@Override
	public Map<String, Object> selectMiddle(SearchVO searchVO) {
		return VoltageMapper.selectMiddle(searchVO);
	}

	@Override
	public Map<String, Object> selectVal(SearchVO searchVO) {
		return VoltageMapper.selectVal(searchVO);
	}

	@Override
	public List<?> selectGraphList(SearchVO searchVO) {
		return VoltageMapper.selectGraphList(searchVO);
	}

}
