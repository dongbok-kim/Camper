<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../../../resources/inc/header.jsp" %>
				<aside>
					<h2>관리자페이지</h2>
					<ul>
						<li><a href="">회원 관리</a></li>
						<li><a href="reportAdmList">신고 관리</a></li>
						<li><a href="stopAdmList">정지 회원 관리</a></li>
						<li><a href="blindAdmList">블라인드 관리</a></li>
						<li class="active"><a href="answerAdmList">1:1문의 관리</a></li>
						<li><a href="">타이틀 관리</a></li>
						<li><a href="ageAdmList">연령대 관리</a></li>
						<li><a href="campingAdmList">캠핑장 관리</a></li>
						<li><a href="reviewAdmList">후기 관리</a></li>
						<li><a href="togetherAdmList">모집글 관리</a></li>
					</ul>
				</aside>
				<div>
					<h3>문의글 관리</h3>
				</div>
<body>
	<div>총 문의 수 : ${list.size()}건</div>
	<div>
		<table>
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>아이디</th>
				<th>문의날짜</th>
				<th>답변상태</th>
			</tr>
			<c:forEach items="${list }" var="answer">
				<tr>
					<td>${answer.in_idx}</td>
					<td><a href="answerAdmView?in_idx=${answer.in_idx}">${answer.in_title}</a></td>
					<td>${answer.mb_id}</td>
					<td>${answer.in_datetime}</td>
					<td>${answer.in_status}</td>
				</tr>
			</c:forEach>
		</table>
	</div>
	<div>
		<form action="answerSearch.do" method="post">
			<select name="in_status">
				<option value="답변상태">답변상태</option>
				<option value="답변대기">답변대기</option>
				<option value="처리중">처리중</option>
				<option value="답변완료">답변완료</option>
			</select>
			<select name="option">
				<option value="전체">전체</option>
				<option value="제목">제목</option>
				<option value="내용">내용</option>
				<option value="아이디">아이디</option>
			</select>
			<input type="text" name="keyword" placeholder="검색"/>
			<input type="submit" value="search"/>
		</form>
	</div>
	<%@ include file="../../../resources/inc/footer.jsp" %>
</body>
<script>

</script>
</html>