<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

	<body>
	
	
	<h2>${profileView.mb_nickname}</h2>
	<h2>${profileView.mb_fire}°C</h2>
	<h2>${profileView.age}대&nbsp;/&nbsp;${profileView.mb_gender}</h2>
	
	<button><a href="MemberBlock.do?mb_id=${profileView.mb_id}">차단</a></button>
	<button><a href="MemberBlockDelete.do?mb_id=${profileView.mb_id}">차단해제</a></button>
	
	
	</body>			

	<script></script>
	
	
</html>