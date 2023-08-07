<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>SF_SKACE</title>

    <!-- Custom fonts for this template -->
    <!-- <link href="/resources/conf/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet"> -->

    <!-- Custom styles for this template -->
    <!-- <link href="/resources/conf/css/sb-admin-2.min.css" rel="stylesheet"> -->
    <link type="text/css" rel="stylesheet" href="/resources/conf/css/common.css?ver=<?=time()?>" />
  	<link type="text/css" rel="stylesheet" href="/resources/conf/css/content.css?ver=<?=time()?>" />
  	<link type="text/css" rel="stylesheet" href="/resources/conf/css/login.css?ver=<?=time()?>" />

    <!-- Custom styles for this page -->
    <!-- <link href="/resources/conf/vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet"> -->
	 
</head>
<header>
	<div class="gnb">
		<div class="gnb_date">
			<span>2023-01-01 (일) 12:00:00</span>
		</div>
		<div class="gnb_info">
			<span>개인정보변경</span>
			<span>로그아웃</span>
		</div>
	</div>
	<div class="lnb">
		<span class="ci_skace"></span>
		<ul>
			<li class="on">모니터링</li>
			<li>기준정보관리</li>
			<li>생산관리</li>
			<li>설비관리</li>
			<li>공정관리</li>
			<li>영업관리</li>
			<li>출하관리</li>
		</ul>
	</div>
</header> --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>

<c:set var="now_date" value="<%=new java.util.Date()%>" />
<c:set var="sysTimes"><fmt:formatDate value="${now_date}" pattern="yyyyMMddhhmmss" /></c:set>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>SF_SKACE</title>
		<link type="text/css" rel="stylesheet" href="<c:url value='/resources/conf/css/common.css?ver=${sysTimes}' />" />
		<link type="text/css" rel="stylesheet" href="<c:url value='/resources/conf/css/content.css?ver=${sysTimes}' />" />
		<script type="text/javascript" src="<c:url value='/resources/js/jquery.js?ver=${sysTimes}'/>"></script>
		<script type="text/javascript" src="<c:url value='/resources/js/header.js?ver=${sysTimes}'/>"></script>
	</head>