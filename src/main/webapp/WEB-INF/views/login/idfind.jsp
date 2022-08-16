<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="/resources/inc/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기 페이지</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<style></style>
</head>
<body>
	<h3>ID 찾기</h3>
		<form action="idFind.do">
		<table>
			<tr>
				<th>이름</th>
				<td>
					<input type="text"  name = "name"/>  
				</td>
			</tr>
			<tr>
				<th>이메일</th>
				<td>
					<input type="email"  name = "email"/>
				</td>
			</tr>
		</table>
		<div>
			<input type="submit" value="ID찾기" onclick="location.href='##'" />
			<!-- 아이디찾기 명령어-->
			<input type="button" value="취소" onclick="location.href='login.go'" />
			<!-- 로그인 페이지 링크 -->
		</div>
		</form>
</body>
<%@ include file="/resources/inc/footer.jsp" %>
<script>
	var msg = "${msg}"
    if (msg != "") {
        alert(msg);
    }
</script>
</html>