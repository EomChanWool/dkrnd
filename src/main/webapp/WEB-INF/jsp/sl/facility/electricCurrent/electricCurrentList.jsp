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
	
	function fn_search_electricCurrent(){
		var date1 = $('#searchEdDate').val();
		var date1_arr = date1.split("-");
		var date2 = $('#searchStDate').val();
		var date2_arr = date2.split("-");
		
		var edDate = new Date(date1_arr[0],date1_arr[1],date1_arr[2]);
		var stDate = new Date(date2_arr[0],date2_arr[1],date2_arr[2]);
		
		var btMs = edDate.getTime() - stDate.getTime();
		var btDay = btMs / (1000*60*60*24);
		
		if(btDay > 30){
			alert("30일 단위로만 검색가능합니다.");
			return;
		}
		
		listForm.submit();
	}
	
	/* function fn_searchAll_electricCurrent(){
		listForm.searchCondition.value = "";
		listForm.searchStDate.value = "";
		listForm.searchEdDate.value = "";
		listForm.pageIndex.value = 1;
		listForm.submit();
	} */
	
	
	
	$(function(){
		
		$('#facility').addClass("on");
		
		$('#electricCurrent').addClass("on");
		
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
		<h1>전류 센서 현황</h1>
			<div class="btn_wrap">
				<div class="search">
					<form name ="listForm" class="listForm" action="${pageContext.request.contextPath}/sl/facility/electricCurrent/electricCurrentList.do" method="post">
						<input type="hidden" name="duId"/>
						<select  class="btn btn-secondary dropdown-toggle searchCondition" name="searchCondition" id="searchCondition">
							    		<option value="6" <c:if test="${searchVO.searchCondition eq 6}">selected="selected"</c:if>>PLASMA 1호기 좌</option>
							    		<option value="7" <c:if test="${searchVO.searchCondition eq 7}">selected="selected"</c:if>>PLASMA 1호기 우</option>
							    		<option value="11" <c:if test="${searchVO.searchCondition eq 11}">selected="selected"</c:if>>PLASMA 2호기 좌</option>
							    		<option value="12" <c:if test="${searchVO.searchCondition eq 12}">selected="selected"</c:if>>PLASMA 2호기 우</option>
					    			</select>
					    <input class="btn btn-secondary searchDate" id="searchStDate" name="searchStDate" value="${searchVO.searchStDate}" type="date">
									<span class="dash" style="display: inline-block; float: left; margin: 0.5rem 0.3rem 0 0">~</span>
									<input class="btn btn-secondary searchDate" id="searchEdDate" name="searchEdDate" value="${searchVO.searchEdDate}" type="date">
						
					</form>
			    <span class="btn_search" id="searchBtn" onclick="fn_search_electricCurrent()">검색</span>
				</div>
				
			</div>
			<table class="list_tb">
				<colgroup>
					<col span="6" width="calc(100% / 6)">
				</colgroup>
				<thead>
					<tr>
						<th style="font-size: 25px;">평균</th>
						<th style="font-size: 25px;">중위수</th>
						<th style="font-size: 25px;">최댓값</th>
						<th style="font-size: 25px;">최솟값</th>
						<th style="font-size: 25px;">상한선</th>
						
						<th style="font-size: 25px;">하한선</th>
					</tr>
				</thead>
				<tbody>
					
						<tr>
							<td style="font-size: 25px;">${ecList2.ecAvg}</td>
							<td style="font-size: 25px;">${ecList2.ecMid}</td>
							<td style="font-size: 25px;">${ecList2.ecMax}</td>
							<td style="font-size: 25px;">${ecList2.ecMin}</td>
							<td style="font-size: 25px;">${valList.duUpperVal}</td>
							<td style="font-size: 25px;">${valList.duLowerVal}</td>
						</tr>
					
					
				</tbody>
			</table>
			<div id="graph" style="width: 100%; height:500px;"></div>
	</section>
</body>
<script>
var chartDom = document.getElementById('graph');
var myChart = echarts.init(chartDom);
var option;

let date = [];

let ecAvg = [];


const dataMin = 0;
const dataMax = 0;
const dataInterval = 1000;

<c:forEach items="${graphList}" var="list">
	date.push('${list.wdDt}');
	ecAvg.push('${list.avgDataamp}');
</c:forEach>






option = {
		  tooltip: {
		    trigger: 'axis',
//			    formatter: '{b0}<br>{a0} : {c0} EA<br>{a1} : {c1} EA<br>{a2} : {c2} EA',
			},
		    axisPointer: {
		    	type: 'cross',
		    	axis: "auto",
		    	crossStyle: {
		        	color: '#999'
	    	}
		  },
		  toolbox: {
		    feature: {
		      dataView: { show: false, readOnly: false },
		      magicType: { show: false, type: ['line', 'bar'] },
		      restore: { show: false },
		      saveAsImage: { show: true }
		    }
		  },
		  legend: {
		    data: ['평균값']
		  },
		  xAxis: [
		    {
		      type: 'category',
		      data: date,
		      axisPointer: {
		        type: 'shadow'
		      }
		    }
		  ],
		  yAxis: [
		    {
		      type: 'value',
		      name: '평균',
		     
		      
		      axisLabel: {
		        formatter: '{value}'
		      }
		    }
		  ],
		  series: [
		    {
		      name: '평균',
		      type: 'bar',
		      tooltip: {
		        valueFormatter: function (value) {
		          return value;
		        }
		      },
		      data: ecAvg
		    }
		  ]
		};
option && myChart.setOption(option);

</script>
</html>