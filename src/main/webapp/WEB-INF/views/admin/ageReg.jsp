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
	<h2>연령대 추가</h2>
	<div>
		<form action="ageReg.do">
			<table border="1">
				<tr>
					<th>연령대</th>
					<td><input type="text" name="age">대</td>
				</tr>
			</table>
			<input type="submit" value="추가"/>
			<input type="button" onclick="location.href='ageAdm' " value="목록"/>
		</form>
	</div>
</body>
<script>
</script>
</html>