package apc.sl.facility.voltage.web;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.DoubleSummaryStatistics;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import apc.sl.facility.voltage.service.VoltageService;
import apc.util.SearchVO;

@Controller
public class VoltageController {
	@Autowired
	private VoltageService voltageService;
	
	@RequestMapping("/sl/facility/voltage/voltageList.do")
	public String voltageList(@ModelAttribute("searchVO") SearchVO searchVO, ModelMap model, HttpSession session){
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
		
		
		List<Map<String, Object>> vList = voltageService.selectV(searchVO);
		List<Double> str = new ArrayList<Double>();
		
		for(int i=0;i<vList.size();i++) {
			Map<String, Object> temp = new HashMap<>();
			temp = vList.get(i);
			str.add(Double.parseDouble(temp.get("datavolt")+""));	
		}
		
		
		DoubleSummaryStatistics stats = str.stream().mapToDouble(Double::doubleValue).summaryStatistics();

		String aver = String.format("%.2f", stats.getAverage());
		
		System.out.println("평균 : " + aver);
		
		Map<String, Object> vList2 = new HashMap<>();
		if(str.size() != 0) {
		vList2.put("vAvg", aver);
		vList2.put("vMax", stats.getMax());
		vList2.put("vMin", stats.getMin());
		Map<String, Object> vList3 = voltageService.selectMiddle(searchVO);
		
		vList2.put("vMid", vList3.get("median"));
		
		}
		
		Map<String, Object> valList = voltageService.selectVal(searchVO);
		model.put("vList2", vList2);
		model.put("valList", valList);
		
		List<?> graphList = voltageService.selectGraphList(searchVO);
		
		System.out.println("그래프: " + graphList);
		
		model.put("graphList",graphList);
		
		
		
		return "sl/facility/voltage/voltageList";
	}

}
