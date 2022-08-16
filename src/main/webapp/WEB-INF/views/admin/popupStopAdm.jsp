<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 정지</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<style></style>
</head>
<body>
	<form action="crewUpdate.do" method="post" name="crewForm">
		<table>
			<tr>
				<th>회원아이디</th>
				<td>${mb_id }</td>
				<th>정지시킨 관리자</th>
				<td>${sessionScope.logiId}</td>
			</tr>
			<tr>
				<th>정지사유</th>
				<td colspan="3">
					<textarea name="ms_reason"></textarea>
				</td>
			</tr>
			</table>
		<input type="submit" value="저장"/>
	</form>
		<h3><strong>${mb_id }</strong> 님에 대한 정지 기록</h3>
		<table>
			<tr>
				<th>번호</th>
				<th>이름</th>
				<th>닉네임</th>
				<th>정지사유</th>
				<th>정지시킨관리자</th>
				<th>정지기간</th>
				<th>정지누적횟수</th>
			</tr>
			<c:forEach items="${list}" var="stop">
				<tr>
					<td>${stop.ms_idx}</td>
					<td>${stop.mb_name}</td>
					<td>${stop.mb_nickname}</td>
					<td>${stop.ms_reason}</td>
					<td>${stop.ms_admin_id}</td>
					<td>${stop.ms_start_date}-${stop.ms_end_date }</td>
					<td>${stop.ms_count}</td>
				</tr>
			</c:forEach>
		</table>
		<input type="button" value="닫기" onclick="window.close();"/>
</body>
<script>
</script>
</html>