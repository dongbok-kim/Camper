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
						<li class="active"><a href="/memberAdmList.go">회원 관리</a></li>
						<li><a href="/reportAdmList.go">신고 관리</a></li>
						<li><a href="/stopAdmList.go">정지 회원 관리</a></li>
						<li><a href="/blindAdmList.go">블라인드 관리</a></li>
						<li><a href="/answerAdmList.go">1:1문의 관리</a></li>
						<li><a href="/titleList.go">타이틀 관리</a></li>
						<li><a href="/ageAdmList.go">연령대 관리</a></li>
						<li><a href="/campingAdmList.go">캠핑장 관리</a></li>
						<li><a href="/reviewAdmList.go">후기 관리</a></li>
						<li><a href="/togetherAdmList.go">모집글 관리</a></li>
					</ul>
	</aside>
	<section>
	<h4>총 회원 수 :  ${listCnt } 건</h4>
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
				<c:choose>
				<c:when test="${listCnt eq 0}">
				<tr align="center">
					<td colspan="6">데이터가 없습니다</td>
				</tr>
			</c:when>
			<c:otherwise>
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
				</c:otherwise>	
			</c:choose>
			</tbody>
		</table>
	
	<!-- 페이지 -->
	<ul>
			<!-- 이전페이지 버튼 -->
			<c:if test="${pageMaker.prev}">
			<li class="pageInfo_btn prev"><a href="?type=${type}&amp;keyword=${keyword}&amp;pageNum=${pageMaker.startPage-1}">이전</a></li>
			</c:if>
			
			<!-- 각 번호 페이지 버튼 -->
			<c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
			<li class="pageInfo_btn ${pageMaker.cri.pageNum eq num ? 'active' : ''}"><a href="?type=${type}&amp;keyword=${keyword}&amp;pageNum=${num}">${num}</a></li>
			</c:forEach>
			
			<!-- 다음페이지 버튼 -->
			<c:if test="${pageMaker.next}">
			<li class="pageInfo_btn next"><a href="?type=${type}&amp;keyword=${keyword}&amp;pageNum=${pageMaker.endPage+1}">다음</a></li>
			</c:if>
		</ul>
		
		
	<!-- 검색 -->
	<br/><br/>
	<fieldset>
		<form action="" method="post">
			<select name="mb_status">
			<option value="정상">정상</option>
			<option value="정지">정지</option>
			<option value="탈퇴">탈퇴</option>
			</select>
			<select name="type">
			<option value="all">전체</option>
			<option value="mb_id" <c:if test="${type eq 'mb_id'}">selected="selected"</c:if>>회원 아이디</option>
			<option value="mb_name" <c:if test="${type eq 'mb_name'}">selected="selected"</c:if>>이름</option>
			<option value="mb_nickname" <c:if test="${type eq 'mb_nickname'}">selected="selected"</c:if>>닉네임</option>
			</select>
			<input type="text" name="keyword" value="${keyword }" placeholder="검색" />
			<input type="submit" value="search" />
		</form>
	</fieldset>
	</section>
</body>
<script>
</script>
</html>