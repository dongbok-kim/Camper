<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="/resources/inc/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 페이지 - 회원 관리</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<style>
	aside {
    width: 30%;
    margin: 10px;
    padding: 20px;
    float: left;
}
	section {
	width: 70%;
	margin: 10px;
	padding: 20px;
	float: right;
}

table, th, td{
		border: 1px solid black;
		border-collapse: collapse;
	}
	th, td {
		padding: 5px 10px;
		text-align: center;
	}
	
	thead{background-color: gray; }
</style>
</head>

<body>
	<aside>
					<h2>관리자페이지</h2>
					<ul>
						<li class="active"><a href="">회원 관리</a></li>
						<li><a href="">신고 관리</a></li>
						<li><a href="">정지 회원 관리</a></li>
						<li><a href="">블라인드 관리</a></li>
						<li><a href="">1:1문의 관리</a></li>
						<li><a href="">타이틀 관리</a></li>
						<li><a href="">연령대 관리</a></li>
						<li><a href="">캠핑장 관리</a></li>
						<li><a href="">후기 관리</a></li>
						<li><a href="">모집글 관리</a></li>
					</ul>
	</aside>
	<section>
	<h4>총 회원 수 :  ${list.size() } 건</h4>
	<table>
		<thead>
			<tr>
				<th>번호</th>
				<th>회원 아이디</th>
				<th>이름</th>
				<th>닉네임</th>
				<th>이메일</th>
				<th>회원 상태</th>
			</tr>
			</thead>
			<tbody>
					
				<c:forEach items="${list }" var="member" varStatus="i"> 
				<tr>
					<td>${listCnt - skip - i.index}</td>
					<td><a href="memberAdmDetail?mb_id=${member.mb_id}">${member.mb_id}</a></td>
					<td>${member.mb_name }</td>
					<td>${member.mb_nickname }</td>
					<td>${member.mb_email }</td>
					<td>${member.mb_status }</td>
				</tr>
				</c:forEach>

			</tbody>
		</table>
	
	<!-- 페이지 -->
	
	<!-- 검색 -->
	<br/><br/>
	<fieldset>
		<form action="memberFind.do" method="post">
			<input type="text" name="mb_id" /><!-- 회원 아이디별 검색 -->
			<input type="submit" value="SEARCH" />
		</form>
	</fieldset>
	
	</section>
</body>
<script>
</script>
</html>