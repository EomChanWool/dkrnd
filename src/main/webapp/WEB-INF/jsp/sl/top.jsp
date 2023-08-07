<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<header> 
	<div class="gnb">
		<div class="gnb_date">
			<span class="time" id="time"></span>
		</div>
		<div style="font-size: 20px;">(주)대경밴드</div>
		<div class="gnb_info">
			<span>${memberVO.mbName}님  접속중입니다</span>
			<span class="btn_logout" onclick="location.href='${pageContext.request.contextPath}/sl/logout.do'">로그아웃</span>
		</div>
	</div>
	
	<div class="lnb">
	<span>대경밴드 중소조선 R&D</span>
		<ul>
			<li id="facility" onclick="menuSet('facility');location.href='${pageContext.request.contextPath}/sl/facility/updown/updownList.do'">설비관리</li>
			<li id="prediction" onclick="menuSet('prediction');location.href='${pageContext.request.contextPath}/sl/prediction/defPer/defPerList.do'">예측정보</li>

			
			<li id="monitoring" onclick="menuSet('monitoring');location.href='${pageContext.request.contextPath}/sl/monitoring/dashBoard.do'">환경설정</li>
		</ul>
	</div>
</header> 