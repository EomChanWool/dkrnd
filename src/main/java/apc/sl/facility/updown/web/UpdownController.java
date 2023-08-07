package apc.sl.facility.updown.web;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import apc.sl.facility.updown.service.UpdownService;
import apc.util.SearchVO;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

@Controller
public class UpdownController {

	@Autowired
	private UpdownService updownService;
	
	@RequestMapping("/sl/facility/updown/updownList.do")
	public String updownList(@ModelAttribute("searchVO") SearchVO searchVO, ModelMap model, HttpSession session) {
		int totCnt = updownService.selectUpdownListToCnt(searchVO);
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
		List<?> updownList = updownService.selectUpdownList(searchVO);
		model.put("udList", updownList);
		model.put("paginationInfo", paginationInfo);
		
		return "sl/facility/updown/updownList";
	}
	
	@RequestMapping("/sl/facility/updown/registUpdown.do")
	public String registUpdown(Model model) {
		
		return "sl/facility/updown/updownRegist";
	}
	
	@RequestMapping("/sl/facility/updown/registUpdownOk.do")
	public String registUpdownOk(@RequestParam Map<String,Object> map, RedirectAttributes redirectAttributes, HttpSession session) {
		
		int exists = updownService.selectUpdownExist(map);
		
		if(exists == 1) {
			redirectAttributes.addFlashAttribute("msg", "이미 등록된 제품코드 입니다.");
			return "redirect:/sl/facility/updown/registUpdown.do";
		}
		
		map.put("userId", session.getAttribute("user_id"));
		updownService.registUpdown(map);
		redirectAttributes.addFlashAttribute("msg","등록 되었습니다.");
		return "redirect:/sl/facility/updown/updownList.do";
	}
	
	@RequestMapping("/sl/facility/updown/modifyUpdown.do")
	public String modifyUpdown(@RequestParam Map<String,Object> map, ModelMap model) {
		Map<String, Object> detail = updownService.selcetUpdownInfo(map);
		model.put("udList", detail);
		return "sl/facility/updown/updownModify";
	}
	
	@RequestMapping("/sl/facility/updown/modifyUpdownOk.do")
	public String modifyUpdownOk(@RequestParam Map<String,Object> map, RedirectAttributes redirectAttributes, HttpSession session) {
		map.put("userId", session.getAttribute("user_id"));
		updownService.modifyUpdown(map);
		redirectAttributes.addFlashAttribute("msg", "수정 되었습니다");
		return "redirect:/sl/facility/updown/updownList.do";
	}
	
	@RequestMapping("/sl/facility/updown/deleteUpdown.do")
	public String deleteUpdown(@RequestParam Map<String, Object> map, RedirectAttributes redirectAttributes, HttpSession session) {
		updownService.deleteUpdown(map);
		redirectAttributes.addFlashAttribute("msg", "삭제 되었습니다");
		return "redirect:/sl/facility/updown/updownList.do";
	}
	
}
