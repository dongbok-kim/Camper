<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<title>Insert title here</title>
<style>
table,th,td {
	border : 1px solid black;
	border-collapse : collapse;
}
table {
	width:80%;
}
</style>
</head>
<body>
<form action="reportUpdate.do" name="report" method="post">
	<table>
		<tr>
			<th>신고대상아이디</th>
			<td>${report.mb_id }</td>
			<th>신고누적횟수</th>
			<td>${report.rp_count }회</td>
		</tr>
		<tr>
			<th>신고자</th>
			<td colspan="3">${report.rp_id }</td>
		</tr>
		<tr>
			<th>신고 내용</th>
			<td colspan="3">${report.rp_content }</td>
		</tr>
		<tr>
			<th>이미지</th>
			<td colspan="3">${report.rp_id }</td>
		</tr>
		<tr>
			<th>신고일자</th>
			<td colspan="3">${report.rp_datetime }</td>
		</tr>
		<tr>
			<th>처리한 관리자</th>
			<td colspan="3">${report.rp_admin }</td>
		</tr>
		<tr>
			<th>처리일자</th>
			<td colspan="3">${report.rp_proc_date }</td>
		</tr>
		<tr>
			<th>처리여부</th>
			<td colspan="3">
				<select name="rp_status" id="selectBox">
					<option value="미처리" ${report.rp_status == '미처리' ? 'selected="selected" ':''}>미처리</option>
					<option value="처리중" ${report.rp_status == '처리중' ? 'selected="selected" ':''} >처리중</option>
					<option value="처리완료" ${report.rp_status == '처리완료' ? 'selected="selected" ':''} >처리완료</option>
				</select>
			</td>
		</tr>
	</table>
	<input type="submit" value="변경">
	<input type="button" onclick="location.href='/reportList' " value="목록">
</form>
</body>
<script>
</script>
</html>