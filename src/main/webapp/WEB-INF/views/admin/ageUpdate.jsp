<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<title>관리자_연령대추가</title>
<style></style>
</head>
<body>
<%@ include file="../../../resources/inc/header.jsp" %>
	<h2>연령대 추가</h2>
	<div>
		<form action="ageUpdate.do" name="agefm" method="get">
			<table border="1">
				<tr>
					<th><input type="hidden" name="ma_idx" value="${age.ma_idx }"> 연령대</th>
					<td><input type="text" name="ma_age" value="${age.ma_age }">대</td>
				</tr>
			</table>
			<input type="button" onclick=up() value="수정"/>
			<input type="button" onclick="location.href='ageList' " value="목록"/>
		</form>
	</div>
<%@ include file="../../../resources/inc/footer.jsp" %>
</body>
<script>
function up() {
	if (confirm("수정하시겠습니까?") == true){
		document.agefm.submit();
	}
}
</script>
</html>