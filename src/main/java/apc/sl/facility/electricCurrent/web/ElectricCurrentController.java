package apc.sl.facility.electricCurrent.web;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.DoubleSummaryStatistics;
import java.util.HashMap;
import java.util.IntSummaryStatistics;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import apc.sl.facility.electricCurrent.service.ElecetricCurrentService;
import apc.util.SearchVO;

@Controller
public class ElectricCurrentController {
	
	@Autowired
	ElecetricCurrentService elecetricCurrentService;

	@RequestMapping("/sl/facility/electricCurrent/electricCurrentList.do")
	public String electricCurrent(@ModelAttribute("searchVO") SearchVO searchVO, ModelMap model, HttpSession session){
		LocalDate now = LocalDate.now();
		
		// 포맷 정의
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
 
        // 포맷 적용
        String formatedNow = now.format(formatter);
        
        if(searchVO.getSearchCondition().equals("")) {
        	searchVO.setSearchCondition("6");
        }
		if(searchVO.getSearchStDate().equals("")) {
			searchVO.setSearchStDate(formatedNow);
		}
		if(searchVO.getSearchEdDate().equals("")) {
			searchVO.setSearchEdDate(formatedNow);
		}
		
		
		List<Map<String, Object>> ecList = elecetricCurrentService.selectEc(searchVO);
		List<Double> str = new ArrayList<Double>();
		
		for(int i=0;i<ecList.size();i++) {
			Map<String, Object> temp = new HashMap<>();
			temp = ecList.get(i);
			str.add(Double.parseDouble(temp.get("dataamp")+""));	
		}
		
		
		DoubleSummaryStatistics stats = str.stream().mapToDouble(Double::doubleValue).summaryStatistics();

		String aver = String.format("%.2f", stats.getAverage());
		
		System.out.println("평균 : " + aver);
		
		Map<String, Object> ecList2 = new HashMap<>();
		if(str.size() != 0) {
		ecList2.put("ecAvg", aver);
		ecList2.put("ecMax", stats.getMax());
		ecList2.put("ecMin", stats.getMin());
		Map<String, Object> ecList3 = elecetricCurrentService.selectMiddle(searchVO);
		
		ecList2.put("ecMid", ecList3.get("median"));
		
		}
		
		Map<String, Object> valList = elecetricCurrentService.selectVal(searchVO);
		model.put("ecList2", ecList2);
		model.put("valList", valList);
		
		List<?> graphList = elecetricCurrentService.selectGraphList(searchVO);
		
		System.out.println("그래프: " + graphList);
		
		model.put("graphList",graphList);
		
		
		
		return "sl/facility/electricCurrent/electricCurrentList";
	}
}
