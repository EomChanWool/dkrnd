package apc.sl.prediction.defPer.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import apc.sl.prediction.defPer.service.DefPerService;
import apc.util.SearchVO;

@Service
public class DefPerServieImpl implements DefPerService {

	@Resource
	private DefPerMapper defPerMapper;

	@Override
	public Map<String, Object> selectProdCnt(SearchVO searchVO) {
		return defPerMapper.selectProdCnt(searchVO);
	}

	@Override
	public int selectDefPerToCnt(SearchVO searchVO) {
		return defPerMapper.selectDefPerToCnt(searchVO);
	}

	@Override
	public List<?> selectBadList(SearchVO searchVO) {
		return defPerMapper.selectBadList(searchVO);
	}
}
