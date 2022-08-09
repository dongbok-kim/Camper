<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<title>Insert title here</title>
<style></style>
</head>
<body>
	<h2>연령대 관리</h2>
	<div><button onclick="location.href='ageReg' ">연령대 추가</button></div>
	<div>
		<table>
			<tr>
				<th>번호</th>
				<th>연령대</th>
				<th>수정</th>
			</tr>
			<c:forEach items="${list }" var="age">
				<tr>
					<td>${age.ma_idx}</td>
					<td>${age.ma_age}대</td>
					<td><button onclick="location.href='ageUpdate.go?ma_idx=${age.ma_idx}' " >연령대 수정</button></td>
				</tr>
			</c:forEach>
		</table>
	</div>
</body>
<script>
</script>
</html>