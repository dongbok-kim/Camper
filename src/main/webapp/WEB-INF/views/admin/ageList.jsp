<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../../../resources/inc/header.jsp" %>
				<aside>
					<h2>관리자페이지</h2>
					<ul>
						<li><a href="">회원 관리</a></li>
						<li><a href="reportList">신고 관리</a></li>
						<li><a href="">정지 회원 관리</a></li>
						<li><a href="">블라인드 관리</a></li>
						<li><a href="">1:1문의 관리</a></li>
						<li><a href="">타이틀 관리</a></li>
						<li class="active"><a href="ageList">연령대 관리</a></li>
						<li><a href="">캠핑장 관리</a></li>
						<li><a href="">후기 관리</a></li>
						<li><a href="">모집글 관리</a></li>
					</ul>
				</aside>
				<div>
					<h3>연령대 관리</h3>
				</div>
<body>
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
	<%@ include file="../../../resources/inc/footer.jsp" %>
</body>
<script>
</script>
</html>