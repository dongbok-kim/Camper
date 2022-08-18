<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../../../resources/inc/header.jsp" %>
				<aside>
					<h2>관리자페이지</h2>
					<ul>
						<li><a href="/memberAdmList.go">회원 관리</a></li>
						<li class="active"><a href="/reportAdmList.go">신고 관리</a></li>
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
				<div>
					<h3>신고 관리</h3>
				</div>
<body>
	<div>총 신고 수 : ${list.size()}건</div>
	<div>
		<table>
			<tr>
				<th>번호</th>
				<th>신고내용</th>
				<th>신고당한 회원</th>
				<th>신고자</th>
				<th>신고일</th>
				<th>신고누적횟수</th>
				<th>처리상태</th>
			</tr>
			<c:forEach items="${list }" var="report">
				<tr>
					<td>${report.rp_idx}</td>
					<td><a href="reportAdmView?rp_idx=${report.rp_idx}">${report.rp_content}</a></td>
					<td>${report.mb_id}</td>
					<td>${report.rp_id}</td>
					<td>${report.rp_datetime}</td>
					<td>${report.rp_count }</td>
					<td>${report.rp_status}</td>
				</tr>
			</c:forEach>
		</table>
	</div>
	<div>
		<form action="reportSearch.do" method="post">
			<select name="rp_status">
				<option value="처리상태">처리상태</option>
				<option value="미처리">미처리</option>
				<option value="처리중">처리중</option>
				<option value="처리완료">처리완료</option>
			</select>
			<select name="option">
				<option value="전체">전체</option>
				<option value="신고당한회원">신고당한회원</option>
				<option value="신고자">신고자</option>
				<option value="신고내용">신고내용</option>
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