package apc.sl.prediction.defPer.web;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;


import apc.sl.prediction.defPer.service.DefPerService;
import apc.util.SearchVO;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

@Controller
public class DefPerController {

	@Autowired
	private DefPerService defPerService;
	
	@RequestMapping("/sl/prediction/defPer/defPerList.do")
	public String defPerList(@ModelAttribute("searchVO")SearchVO searchVO, ModelMap model, HttpSession session) {
		LocalDate now = LocalDate.now();
		// 포맷 정의
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
 
        // 포맷 적용
        String formatedNow = now.format(formatter);
		int totCnt = defPerService.selectDefPerToCnt(searchVO);
		/** pageing setting */
		searchVO.setPageSize(10);
		PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(searchVO.getPageIndex()); // 현재 페이지 번호
		paginationInfo.setRecordCountPerPage(10); // 한 페이지에 게시되는 게시물 건수
		paginationInfo.setPageSize(searchVO.getPageSize()); // 페이징 리스트의 사이즈
		paginationInfo.setTotalRecordCount(totCnt);
		
		searchVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
		searchVO.setLastIndex(paginationInfo.getLastRecordIndex());
		searchVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());
		
//		if(searchVO.getSearchCondition().equals("")) {
//			searchVO.setSearchCondition("6");
//		}
		if(searchVO.getSearchStDate().equals("")) {
			searchVO.setSearchStDate(formatedNow);
		}
		if(searchVO.getSearchEdDate().equals("")) {
			searchVO.setSearchEdDate(formatedNow);
		}
		
		
		
		List<?> badList = defPerService.selectBadList(searchVO);
		
		
		
		Map<String, Object> prodList = defPerService.selectProdCnt(searchVO);
		
		
		String num1 = prodList.get("outputCnt")+"";
		
		String num2 = prodList.get("defectCnt")+"";
		
		float num3 = Float.valueOf(num2)/Float.valueOf(num1) * 100;
		
		String num4 = String.format("%.2f", num3);
		
		prodList.put("percent", num4);
		
		System.out.println("프로드리스트 : " + prodList);
		System.out.println("배드리스트 : " + badList);
		model.put("prodList",prodList);
		model.put("badList", badList);
		model.put("paginationInfo", paginationInfo);
		
		
		return "sl/prediction/defPer/defPerList";
	}
	
}
