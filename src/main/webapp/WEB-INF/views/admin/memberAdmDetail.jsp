<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<style></style>
<body>
	<table>
		<tr>
			<th>아이디</th>
			<td>${dto.mb_id }</td>
		</tr>
		<tr>
			<th>이름</th>
			<td>${dto.mb_name }</td>
		</tr>
		<!-- 이렇게 추가 -->
	</table>
</body>
<script>
</script>
</html>