<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<% pageContext.setAttribute("newLine", "\n"); %>
<!doctype html>
<html>
	<head>
		<meta charset="utf-8"/>
		<title>Camper</title>
		<script src="//code.jquery.com/jquery-latest.min.js"></script>
		<script src="resources/js/common.js" defer="defer"></script>
		<link rel="stylesheet" href="resources/css/common.css" type="text/css"/>
		<link rel="stylesheet" href="//fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap"/>
		<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css" />
		<!--  jQuery UI CSS파일  -->
		<link rel="stylesheet" href="//code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />
		<!--  jQuery 기본 js파일 -->
		<script src="//ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
		<!--  jQuery UI 라이브러리 js파일 -->
		<script src="//code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
		<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	</head>
	<body>
		<div id="wrap">
			<header>
				<a href="/"><img src="resources/images/logo.jpg" id="logo" alt="Camper" /></a>
				<a href="campingList.go">캠핑장</a>
				<a href="crewTogetherList.do">크루모집</a>
				<div>
					<c:choose>
					<c:when test="${sessionScope.loginId ne null}">
					<c:if test="${mb_grade eq '회원'}">
					<a href="myChatList.do"><i class="xi-forum xi-2x"></i></a>
					<a href="myCampingLikeList.go"><i class="xi-heart xi-2x"></i></a>
					</c:if>
					<strong class="contextMenu contextMenuMember" data-id="${sessionScope.loginId}">${sessionScope.loginId}</strong> 님
					<c:choose>
					<c:when test="${sessionScope.mb_grade eq '회원'}">
					<a href="mypageInfo.go">마이페이지</a>
					</c:when>
					<c:otherwise>
					<a href="memberAdmList.go">관리자페이지</a>
					</c:otherwise>
					</c:choose>
					<span class="verticalBar">|</span> <a href="logout.do">로그아웃</a>
					</c:when>
					<c:otherwise>
					<a href="login.go">로그인</a> <span class="verticalBar">|</span> <a href="join.go">회원가입</a>
					</c:otherwise>
					</c:choose>
				</div>
			</header>
			<div id="container">