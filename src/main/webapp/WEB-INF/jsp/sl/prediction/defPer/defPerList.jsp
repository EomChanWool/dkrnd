<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ include file="../../header.jsp" %>

<body>
	<%@ include file="../../top.jsp" %>
	<%@ include file="menu.jsp" %>
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/echarts/5.2.2/echarts.min.js"></script>
	<script>
	function fn_pageview(pageNo) {
		listForm.pageIndex.value = pageNo;
	   	listForm.submit();
	}
	
	function fn_search_defPer(){
		
		listForm.submit();
	}
	
	
	
	$(function(){
		
		$('#prediction').addClass("on");
		
		
		/* $('select[name=searchCondition]').change(function(){
			listForm.submit();
		}); */
		
		
		
		let msg = '${msg}';
		if(msg) {
			alert(msg);
		}
		
		window.onresize = function() {
			location.reload();
		}
		
		/* console.log($('#searchEdDate').val()); */
	});
	
	
	
	
	
	</script>
	
	<section>
		<h1>불량 제품 제조 알림 현황</h1>
			<div class="btn_wrap">
				<div class="search">
					<form name ="listForm" class="listForm" action="${pageContext.request.contextPath}/sl/prediction/defPer/defPerList.do" method="post">
						<input type="hidden" name="pageIndex" value="<c:out value='${searchVO.pageIndex}'/>"/>
						<select  class="btn btn-secondary dropdown-toggle searchCondition" name="searchCondition" id="searchCondition">
										<option value="" <c:if test="${searchVO.searchCondition eq ''}">selected="selected"</c:if>>전체</option>
							    		<option value="6" <c:if test="${searchVO.searchCondition eq 6}">selected="selected"</c:if>>PLASMA 1호기 좌</option>
							    		<option value="7" <c:if test="${searchVO.searchCondition eq 7}">selected="selected"</c:if>>PLASMA 1호기 우</option>
							    		<option value="11" <c:if test="${searchVO.searchCondition eq 11}">selected="selected"</c:if>>PLASMA 2호기 좌</option>
							    		<option value="12" <c:if test="${searchVO.searchCondition eq 12}">selected="selected"</c:if>>PLASMA 2호기 우</option>
					    			</select>
					    <input class="btn btn-secondary searchDate" id="searchStDate" name="searchStDate" value="${searchVO.searchStDate}" type="date">
									<span class="dash" style="display: inline-block; float: left; margin: 0.5rem 0.3rem 0 0">~</span>
									<input class="btn btn-secondary searchDate" id="searchEdDate" name="searchEdDate" value="${searchVO.searchEdDate}" type="date">
						
					</form>
			    <span class="btn_search" id="searchBtn" onclick="fn_search_defPer()">검색</span>
				</div>
				
			</div>
			<table class="list_tb">
				<colgroup>
					<col span="3" width="calc(100% / 3)">
				</colgroup>
				<thead>
					<tr>
						<th style="font-size: 25px;">총 생산량</th>
						<th style="font-size: 25px;">불량 누적 개수</th>
						<th style="font-size: 25px;">불량률 계산 값</th>
						
					</tr>
				</thead>
				<tbody>
					
						<tr>
							<td style="font-size: 25px;">${prodList.outputCnt}</td>
							<td style="font-size: 25px;">${prodList.defectCnt}</td>
							<td style="font-size: 25px;">${prodList.percent}</td>
							
						</tr>
					
					
				</tbody>
			</table>
			
			<table class="list_tb" style="margin-top: 40px">
				<colgroup>
					<col span="3" width="calc(100% / 9)">
				</colgroup>
				<thead>
					<tr>
						<th>발생시간</th>
						<th>설비명</th>
						<th>전류 센서값</th>
						<th>전압 센서값</th>
						<th>가스량 센서값</th>
						<th>용접시간 센서값</th>
						<th>알림 확인 유무</th>
						<th>알림 확인자</th>
						<th>알림 확인 시간</th>
						
					</tr>
				</thead>
				<tbody>
					<c:forEach var="result" items="${badList}" varStatus="status">
						<tr>
							<td>${result.baDttm}</td>
							<td>${result.baWelderNo}</td>
							<td>${result.baDataamp}</td>
							<td>${result.baDatavolt}</td>
							<td>${result.baDatagas}</td>
							<td>${result.baDatatime}</td>
							<td>${result.baIsChecked}</td>
							<td>${result.userid}</td>
							<td>${result.baCheckDt}</td>
							
						</tr>
					</c:forEach>
					
				</tbody>
			</table>
			<div class="btn_page">
				<ui:pagination paginationInfo="${paginationInfo}" type="image" jsFunction="fn_pageview"/>
			</div>
	</section>
</body>

</html>