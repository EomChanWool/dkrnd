<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<nav>
	<ul>
		<li id="updownInfo" onclick="menuSet('updownInfo');location.href='${pageContext.request.contextPath}/sl/facility/updown/updownList.do'">데이터상하한관리</li>
		<li id="electricCurrent" onclick="menuSet('electricCurrent');location.href='${pageContext.request.contextPath}/sl/facility/electricCurrent/electricCurrentList.do'">전류센서현황</li>
		<li id="orderPlaceList" onclick="menuSet('orderPlaceList');location.href='${pageContext.request.contextPath}/sa/basicCompanyInfo/orderPlaceList.do'">전압센서현황</li>
		<li id="orderPlaceList" onclick="menuSet('orderPlaceList');location.href='${pageContext.request.contextPath}/sa/basicCompanyInfo/orderPlaceList.do'">가스량센서현황</li>
		<li id="orderPlaceList" onclick="menuSet('orderPlaceList');location.href='${pageContext.request.contextPath}/sa/basicCompanyInfo/orderPlaceList.do'">용접시간센서현황</li>
	</ul>
</nav>