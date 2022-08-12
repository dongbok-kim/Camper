<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../../../resources/inc/header.jsp" %>
				<aside>
					<h2>관리자페이지</h2>
					<ul>
						<li><a href="">회원 관리</a></li>
						<li><a href="reportAdmList">신고 관리</a></li>
						<li><a href="stopAdmList">정지 회원 관리</a></li>
						<li class="active"><a href="blindAdmList">블라인드 관리</a></li>
						<li><a href="answerAdmList">1:1문의 관리</a></li>
						<li><a href="">타이틀 관리</a></li>
						<li><a href="ageAdmList">연령대 관리</a></li>
						<li><a href="campingAdmList">캠핑장 관리</a></li>
						<li><a href="reviewAdmList">후기 관리</a></li>
						<li><a href="togetherAdmList">모집글 관리</a></li>
					</ul>
				</aside>
				<div>
					<h3>블라인드 관리</h3>
				</div>
<body>
	<div>총 블라인드 수 : ${list.size()}건</div>
	<div>
		<table>
			<tr>
				<th>번호</th>
				<th>구분</th>
				<th>블라인드 사유</th>
				<th>블라인드 처리자</th>
				<th>블라인드 날짜</th>
			</tr>
			<c:forEach items="${list }" var="blind">
				<tr>
					<td>${blind.bb_idx}</td>
					<td>
					<c:if test="${blind.bb_relation eq 'cp_crew_together'}">모집글</c:if>
					<c:if test="${blind.bb_relation eq 'cp_member_review'}">회원 후기</c:if>
					<c:if test="${blind.bb_relation eq 'cp_camping_review'}">캠핑장 후기</c:if>
					</td>
					<td>${blind.bb_reason}</td>
					<td>${blind.mb_id}</td>
					<td>${blind.bb_datetime}</td>
				</tr>
			</c:forEach>
		</table>
	</div>
	<div>
		<form action="blindAdmSearch.do" method="post">
			<select name="bb_relation">
				<option value="relation">구분</option>
				<option value="cp_camping_review">캠핑장 후기</option>
				<option value="cp_member_review">회원 후기</option>
				<option value="cp_camping_together">모집글</option>
			</select>
			<select name="option">
				<option value="all">전체</option>
				<option value="bb_reason">블라인드 사유</option>
				<option value="mb_id">블라인드 처리자</option>
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