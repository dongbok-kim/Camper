<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>크루인원 확정</title>
<script src="//code.jquery.com/jquery-3.6.0.min.js"></script>
<style>
	table {
		border-collapse: collapse;
		border: 1px solid #787878;
	}
	
	table th {
		padding: 10px;
		border: 1px solid #787878;
		background-color: #f9f9f9;
	}
	
	table td {
		padding: 10px;
		border: 1px solid #787878;
	}
	
	table tfoot tr td {
		text-align: center;
	}
	
	table td > textarea {
		padding: 10px;
		width: 99%;
		min-height: 180px;
		resize: none;
		overflow-y: scroll;
		box-sizing: border-box;
	}
	
	table tfoot tr td > .btn {
		padding: 5px 10px;
		cursor: pointer;
		outline: none;
		border: none;
	}
	
	table tfoot tr td > .btn.btnSubmit {
		color: #fff;
		background-color: #32405d;
	}
	
	table tfoot tr td > .btn.btnClose {
		background-color: #dbdbdb;
	}
</style>
</head>
<body>
	<h2>${info.ca_name}</h2>
	<p>(${info.ct_wish_start} ~ ${info.ct_wish_end})</p>
	<form action="crewUpdate.do" method="post" name="crewForm">
		<table>
			<tbody>
			<c:forEach items="${list}" var="crew">
				<tr>
					<td><input type="checkbox" name="crew_chk" value="${crew.mb_id}"/></td>
					<td>${crew.mb_nickname}</td>
				</tr>
			</c:forEach>
			</tbody>
			<tfoot>
				<tr>
					<td colspan="2">
						<input type="submit" class="btn btnSubmit" value="완료"/>
						<input type="button" class="btn btnClose" value="닫기" onclick="window.close();"/>
					</td>
				</tr>
			</tfoot>
		</table>
	</form>
</body>
<script>
</script>
</html>