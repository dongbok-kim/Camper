<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>크루원 후기 작성페이지</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<style></style>
</head>
<body>
	<form action="crewUpdate.do" method="post" name="crewForm">
		<table>
			<tr>
				<th>캠핑장명</th>
				<td></td>
			</tr>
			<tr>
				<th>캠핑 기간</th>
				<td></td>
			</tr>
			<tr>
				<th>크루원 닉네임</th>
				<td></td>
			</tr>
			<tr>
				<th>크루원 평가</th>
				<td></td>
			</tr>
			<tr>
				<th>내용</th>
				<td></td>
			</tr>
		</table>
		<input type="submit" value="완료"/>
		<input type="button" value="닫기" onclick="window.close();"/>
	</form>
</body>
<script>
</script>
</html>