<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ include file="../../header.jsp" %>

<body>
	<%@ include file="../../top.jsp" %>
	<%@ include file="menu.jsp" %>
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script>
	function fn_pageview(pageNo) {
		listForm.pageIndex.value = pageNo;
	   	listForm.submit();
	}
	
	function fn_search_updown(){
		listForm.submit();
	}
	
	function fn_searchAll_updown(){
		listForm.searchCondition.value = "";
		listForm.searchCondition2.value = "";
		listForm.searchCondition3.value = "";
		listForm.pageIndex.value = 1;
		listForm.submit();
	}
	
	function fn_modify_updown_go(duId){
		listForm.duId.value = duId;
		listForm.action = "${pageContext.request.contextPath}/sl/facility/updown/modifyUpdown.do";
		listForm.submit();
	}
	
	function fn_regist(){
		listForm.action = "${pageContext.request.contextPath}/sl/facility/updown/registUpdown.do";
		listForm.submit();
	}
	
	function fn_delete_updown(duId){
		
		if(confirm("삭제하시겠습니까?")){
			listForm.duId.value = duId;
			listForm.action = "${pageContext.request.contextPath}/sl/facility/updown/deleteUpdown.do";
			listForm.submit();
		}
		
	}
	
	$(function(){
		
		$('#facility').addClass("on");
		
		$('#updownInfo').addClass("on");
		
		/* $('select[name=searchCondition]').change(function(){
			listForm.submit();
		}); */
		
		
		
		let msg = '${msg}';
		if(msg) {
			alert(msg);
		}
	});
	</script>
	
	<section>
		<h1>데이터 상하한 관리</h1>
			<div class="btn_wrap">
				<div class="search">
					<form name ="listForm" class="listForm" action="${pageContext.request.contextPath}/sl/facility/updown/updownList.do" method="post">
						<input type="hidden" name="pageIndex" value="<c:out value='${searchVO.pageIndex}'/>"/>
						<input type="hidden" name="duId"/>
						<select  class="btn btn-secondary dropdown-toggle searchCondition" name="searchCondition" id="searchCondition">
							    		<option value="" <c:if test="${searchVO.searchCondition eq ''}">selected="selected"</c:if>>설비구분</option>
							    		<option value="6" <c:if test="${searchVO.searchCondition eq 6}">selected="selected"</c:if>>PLASMA 1호기 좌</option>
							    		<option value="7" <c:if test="${searchVO.searchCondition eq 7}">selected="selected"</c:if>>PLASMA 1호기 우</option>
							    		<option value="11" <c:if test="${searchVO.searchCondition eq 11}">selected="selected"</c:if>>PLASMA 2호기 좌</option>
							    		<option value="12" <c:if test="${searchVO.searchCondition eq 12}">selected="selected"</c:if>>PLASMA 2호기 우</option>
					    			</select>
					    <select  class="btn btn-secondary dropdown-toggle searchCondition" name="searchCondition2" id="searchCondition2">
							    		<option value="" <c:if test="${searchVO.searchCondition2 eq ''}">selected="selected"</c:if>>설비데이터구분</option>
							    		<option value="1" <c:if test="${searchVO.searchCondition2 eq 1}">selected="selected"</c:if>>전류</option>
							    		<option value="2" <c:if test="${searchVO.searchCondition2 eq 2}">selected="selected"</c:if>>전압</option>
							    		<option value="3" <c:if test="${searchVO.searchCondition2 eq 3}">selected="selected"</c:if>>가스량</option>
							    		<option value="4" <c:if test="${searchVO.searchCondition2 eq 4}">selected="selected"</c:if>>용접시간</option>
					    			</select>
					     <select  class="btn btn-secondary dropdown-toggle searchCondition" name="searchCondition3" id="searchCondition3">
							    		<option value="" <c:if test="${searchVO.searchCondition3 eq ''}">selected="selected"</c:if>>자동여부</option>
							    		<option value="1" <c:if test="${searchVO.searchCondition3 eq 1}">selected="selected"</c:if>>수동</option>
							    		<option value="2" <c:if test="${searchVO.searchCondition3 eq 2}">selected="selected"</c:if>>자동</option>
					    			</select>
						
					</form>
			    <span class="btn_search" id="searchBtn" onclick="fn_search_updown()">검색</span>
			    <span class="btn_list" id="btn_list" onclick="fn_searchAll_updown()">전체목록</span>
				</div>
				<div class="btn_right">
					<span class="btn_add" onclick="fn_regist()">등록</span>
				</div>
			</div>
			<table class="list_tb">
				<colgroup>
					<col span="6" width="calc(100% / 6)">
				</colgroup>
				<thead>
					<tr>
						<th>번호</th>
						<th>설비구분</th>
						<th>설비데이터구분</th>
						<th>상/하한선</th>
						<th>자동여부(수동/자동)</th>
						
						<th>수정/삭제</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="result" items="${udList}" varStatus="status">
						<tr>
							<td>${result.rNum}</td>
							<td><c:if test="${result.duWelderNo eq 12}">PLASMA 1호기 우</c:if>
								<c:if test="${result.duWelderNo eq 11}">PLASMA 2호기 좌</c:if>
								<c:if test="${result.duWelderNo eq 6}">PLASMA 1호기 좌</c:if>
								<c:if test="${result.duWelderNo eq 7}">PLASMA 1호기 우</c:if></td>
							<td><c:if test="${result.duFcdtType eq 1}">전류</c:if>
								<c:if test="${result.duFcdtType eq 2}">전압</c:if>
								<c:if test="${result.duFcdtType eq 3}">가스량</c:if>
								<c:if test="${result.duFcdtType eq 4}">용접시간</c:if></td>
							<td>${result.duUpperVal} ~ ${result.duLowerVal}</td>
							<td><c:if test="${result.duIsAuto eq 1}">수동</c:if>
								<c:if test="${result.duIsAuto eq 2}">자동</c:if>
							</td>
							
								<td class="list_btn" onclick="event.cancelBubble=true">
								<span class="btn_tEdit" onclick="fn_modify_updown_go('${result.duId}')">수정</span>
								<span class="btn_tDelete" onclick="fn_delete_updown('${result.duId}')">삭제</span>
							</td>
						</tr>
					</c:forEach>
					<c:if test="${empty udList}"><tr><td colspan='6'>결과가 없습니다.</td><del></del></c:if>
				</tbody>
			</table>
			<div class="btn_page">
				<ui:pagination paginationInfo="${paginationInfo}" type="image" jsFunction="fn_pageview"/>
			</div>	
	</section>
</body>
</html>