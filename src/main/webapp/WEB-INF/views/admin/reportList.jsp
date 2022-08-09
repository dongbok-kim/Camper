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
	<h2>신고 관리</h2>
	<div>총 신고 수 : 건</div>
	<div>
		<table>
			<tr>
				<th>번호</th>
				<th>신고내용</th>
				<th>신고당한 회원</th>
				<th>신고자</th>
				<th>신고일</th>
				<th>신고누적횟수</th>
				<th>처리상태</th>
			</tr>
			<c:forEach items="${list }" var="report">
				<tr>
					<td>${report.rp_idx}</td>
					<td>${report.rp_content}</td>
					<td>${report.mb_id}</td>
					<td>${report.rp_id}</td>
					<td>${report.rp_proc_date}</td>
					<td>${report.누적횟수}</td>
					<td>${report.rp_status}</td>
				</tr>
			</c:forEach>
		</table>
	</div>
</body>
<script>
</script>
</html>