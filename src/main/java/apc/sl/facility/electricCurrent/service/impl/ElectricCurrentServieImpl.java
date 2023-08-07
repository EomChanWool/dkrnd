package apc.sl.facility.electricCurrent.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import apc.sl.facility.electricCurrent.service.ElecetricCurrentService;
import apc.util.SearchVO;

@Service
public class ElectricCurrentServieImpl implements ElecetricCurrentService {

	@Resource
	private ElectricCurrentMapper electricCurrentMapper;

	@Override
	public List<Map<String, Object>> selectEc(SearchVO searchVO) {
		return electricCurrentMapper.selectEc(searchVO);
	}

	@Override
	public Map<String, Object> selectMiddle(SearchVO searchVO) {
		return electricCurrentMapper.selectMiddle(searchVO);
	}

	@Override
	public Map<String, Object> selectVal(SearchVO searchVO) {
		return electricCurrentMapper.selectVal(searchVO);
	}

	@Override
	public List<?> selectGraphList(SearchVO searchVO) {
		return electricCurrentMapper.selectGraphList(searchVO);
	}

	
	
}
