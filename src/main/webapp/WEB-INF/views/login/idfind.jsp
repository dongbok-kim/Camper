<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
		<table>
			<tr>
				<th>아이디</th>
				<td>
					<input type="id"  id = "id"/>  
				</td>
			</tr>
			<tr>
				<th>이메일</th>
				<td>
					<input type="email"  id = "email"/>
				</td>
			</tr>
		</table>
		<div>
			<input type="button" value="ID찾기" onclick="location.href='##'" />
			<!-- 아이디찾기 명령어-->
			<input type="button" value="취소" onclick="location.href='login.go'" />
			<!-- 로그인 페이지 링크 -->
		</div>
</body>
<script>
	var msg = "${msg}"
    if (msg != "") {
        alert(msg);
    }
</script>
</html>