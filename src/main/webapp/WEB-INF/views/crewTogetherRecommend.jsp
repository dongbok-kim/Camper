<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../../resources/inc/header.jsp" %>
<body>
<h1>크루추천</h1>
<form action="" method="get" onsubmit="return crewTogetherRecommend()">
	<table>
		<tr>
			<th>성별</th>
			<td>
				<input type="radio" name="front"  value="남자"/>남자
				<input type="radio" name="front"   value="여자"/>여자
				<input type="radio" name="front"  value="혼성"/>혼성
			</td>
		</tr>
		<tr>
			<th>캠핑종류</th>
			<td>
				<input type="checkbox" name="camping"  value="백팩킹"/>백팩킹
				<input type="checkbox" name="camping"   value="오토캠핑"/>오토캠핑
				<input type="checkbox" name="camping"  value="글램핑"/>글램핑
				<input type="checkbox" name="camping"  value="부쉬크래프트"/>부쉬크래프트
				<input type="checkbox" name="camping"  value="비박"/>비박
			</td>
		</tr>
		<tr>
			<th>연령대</th>
			<td>
				<input type="checkbox" name="age"  value="20대"/>20대
				<input type="checkbox" name="age"   value="30대"/>30대
				<input type="checkbox"  name="age" value="40대"/>40대
				<input type="checkbox" name="age"  value="50대"/>50대
				<input type="checkbox" name="age" value="60대이상"/>60대이상
			</td>
		</tr>
		<tr>
			<th>기타정보</th>
			<td>
				<input type="checkbox" name="etc1"  value="애견동반가능"/>애견동반가능
				<input type="checkbox" name="etc2"   value="장비제공가능"/>장비제공가능
			</td>
		</tr>
		<tr>
			<th>날짜선택</th>
			<td>
				<input type="date" name="startDate" id="startDate">
				<input type="date" name="endDate" id="endDate">
			</td>
		</tr>
		<tr>
			<th>캠핑장명</th>
			<td>
				<input type="search" name="search" value="">
			</td>
		</tr>
		<tr>
			<th>
			<input type="button" value="search" onclick="location.href='/#'" />
			</th>
		</tr>
	</table>
	</form>
</body>
<%@ include file="../../resources/inc/footer.jsp" %>
	<script>
	
	</script>
</html>