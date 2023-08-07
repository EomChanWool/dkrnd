<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>    
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<%@ include file="../../header.jsp" %>

<body>
	<%@ include file="../../top.jsp" %>
	<%@ include file="menu.jsp" %>
	<script>
	function fn_regist(){
		
		var duUpperVal = parseFloat($('#duUpperVal').val());
		var duLowerVal = parseFloat($('#duLowerVal').val());
		
		if($('#duWelderNo').val() == ''){
			alert("설비구분을 확인 바랍니다.");
			return;
		}
		
		if($('#duFcdtType').val() == ''){
			alert("설비데이터구분을 확인 바랍니다.");
			return;
		}
		
		if($('#duUpperVal').val() == ''){
			alert("수동으로 진행하실 경우 상한선과 하한선을 모두 입력해주세요.");
			return;
		}
		
		if($('#duLowerVal').val() == ''){
			alert("수동으로 진행하실 경우 상한선과 하한선을 모두 입력해주세요.");
			return;
		}
		
		if($('#duIsAuto').val() == ''){
			alert("자동여부를 확인 바랍니다.");
			return;
		}
		
		if (duUpperVal < duLowerVal) {
			  alert("상한선보다 하한선이 클수 없습니다.");
			  return;
			}

		
		registForm.submit();
	}
	
	
	$(function() {
		
		$('#facility').addClass("on");
		
		$('#updownInfo').addClass("on");
		
		let msg = '${msg}';
		
		if(msg) {
			alert(msg);
		}
		
		
	});
	</script>

	<section>
		<h1 id="pageInfo">데이터 상하한 등록</h1>
		<form action="${pageContext.request.contextPath}/sl/facility/updown/registUpdownOk.do" name="registForm" method="post">
			<table class="user_table_edit">
				<tbody>
					<tr>
						<th>설비구분</th>
						<td>
							<select name="duWelderNo" id="duWelderNo">
								<option value="" <c:if test="${searchVO.searchCondition eq ''}">selected="selected"</c:if>>설비구분</option>
							    		<option value="6">PLASMA 1호기 좌</option>
							    		<option value="7">PLASMA 1호기 우</option>
							    		<option value="11">PLASMA 2호기 좌</option>
							    		<option value="12">PLASMA 2호기 우</option>
							</select>
						</td>
						<th>설비데이터구분</th>
						<td><select name="duFcdtType" id="duFcdtType">
								<option value="">설비데이터구분</option>
							    		<option value="1">전류</option>
							    		<option value="2">전압</option>
							    		<option value="3">가스량</option>
							    		<option value="4">용접시간</option>
							</select></td>
					</tr>
					<tr>
						<th>상한선</th>
						<td><input type="text" name="duUpperVal" id="duUpperVal"></td>
						<th>하한선</th>
						<td><input type="text" name="duLowerVal" id="duLowerVal"></td>
					</tr>
					<tr>
						<th>자동/수동</th>
						<td><select name="duIsAuto" id="duIsAuto">
								<option value="">자동여부</option>
							    		<option value="1">수동</option>
							    		<option value="2">자동</option>
							</select></td>
						<th></th>
						<td></td>
					</tr>
					
				</tbody>
			</table>
		</form>
		
		<div class="btn_bottom_wrap">
			<span class="btn_ok" onclick="fn_regist()">확인</span>
			<span class="btn_cancel" onclick="location.href='${pageContext.request.contextPath}/sl/facility/updown/updownList.do'">취소</span>
		</div>
	</section>
</body>
</html>