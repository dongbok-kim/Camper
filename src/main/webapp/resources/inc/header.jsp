<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
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
	</head>
	<body>
		<div id="wrap">
			<header>
				<a href="/"><img src="resources/images/logo.jpg" id="logo" alt="Camper" /></a>
				<a href="campingList.go">캠핑장</a>
				<a href="">크루모집</a>
				<div>
					<a href=""><i class="xi-forum xi-2x"></i></a>
					<a href=""><i class="xi-heart xi-2x"></i></a>
					<a href="">로그인</a> <span class="verticalBar">|</span> <a href="">회원가입</a>
					<strong class="contextMenu contextMenuMember" data-id="wjtjald">wjtjald</strong> 님 <a href="">마이페이지</a> <span class="verticalBar">|</span> <a href="">로그아웃</a>
					<strong class="contextMenu contextMenuMember" data-id="admin">admin</strong> 님 <a href="">관리자페이지</a> <span class="verticalBar">|</span> <a href="">로그아웃</a>
				</div>
			</header>
			<div id="container">