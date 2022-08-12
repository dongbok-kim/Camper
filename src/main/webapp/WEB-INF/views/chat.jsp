<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!doctype html>
<html>
	<head>
		<meta charset="utf-8"/>
		<title>Camper - 채팅</title>
		<script src="//code.jquery.com/jquery-latest.min.js"></script>
		<script src="resources/js/common.js" defer="defer"></script>
		<script src="resources/js/chat.js" defer="defer"></script>
		<link rel="stylesheet" href="resources/css/common.css" type="text/css"/>
		<link rel="stylesheet" href="resources/css/chat.css" type="text/css"/>
		<link rel="stylesheet" href="//fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap"/>
		<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css" />
	</head>
	<body>
		<div id="chat">
			<div id="left">
				<div id="notice">
					공지 메시지 영역
				</div>
				<div id="msgList">
					<p class="you"><span>상대방이 작성한 메시지</span></p>
					<p class="me"><span>내가 작성한 메시지</span></p>
					<p class="you"><span>상대방이 작성한 메시지</span></p>
					<p class="me"><span>내가 작성한 메시지</span></p>
				</div>
				<input type="text" />
			</div>
			<div id="right">
				현재 참여중인 회원 목록 영역 및 버튼 영역 등
			</div>
		</div>
	</body>
	<script></script>
</html>