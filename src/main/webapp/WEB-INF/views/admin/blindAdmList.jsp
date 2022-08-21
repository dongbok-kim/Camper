<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../../../resources/inc/header.jsp" %>
				<aside>
					<h2>관리자페이지</h2>
					<ul>
						<li><a href="/memberAdmList.go">회원 관리</a></li>
						<li><a href="/reportAdmList.go">신고 관리</a></li>
						<li><a href="/stopAdmList.go">정지 회원 관리</a></li>
						<li class="active"><a href="/blindAdmList.go">블라인드 관리</a></li>
						<li><a href="/answerAdmList.go">1:1문의 관리</a></li>
						<li><a href="/titleList.go">타이틀 관리</a></li>
						<li><a href="/ageAdmList.go">연령대 관리</a></li>
						<li><a href="/campingAdmList.go">캠핑장 관리</a></li>
						<li><a href="/reviewAdmList.go">후기 관리</a></li>
						<li><a href="/togetherAdmList.go">모집글 관리</a></li>
					</ul>
				</aside>
				<div>
					<h3>블라인드 관리</h3>
				</div>
<body>
	<div>총 블라인드 수 : ${listCnt}건</div>
	<div>
		<table>
		<thead>
			<tr>
				<th>번호</th>
				<th>구분</th>
				<th>블라인드 사유</th>
				<th>블라인드 처리자</th>
				<th>블라인드 날짜</th>
			</tr>
			</thead>
			<tbody>
			<c:if test="${list.size() == 0}">
				<tr><td colspan="5">블라인드 글이 없습니다.</td></tr>
			</c:if>
			<c:forEach items="${list }" var="blind" varStatus="i">
				<tr>
					<td>${listCnt - skip - i.index}</td>
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
			</tbody>
		</table>
		<ul>
			<!-- 이전 페이지 버튼 -->
			<c:if test="${pageMaker.prev}">
				<li class="pageInfo_btn_prev"><a href="?keyword=${keyword}&amp;pageNum=${pageMaker.startPage-1}">이전</a></li>
			</c:if>
			<!-- 각 번호 페이지 버튼 -->
			<c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
				<li class="pageInfo_btn ${pageMaker.cri.pageNum eq num ? 'active' : ''}"><a href="?keyword=${keyword}&amp;type=${type}&amp;filter=${filter}&amp;pageNum=${num}">${num}</a></li>
			</c:forEach>
			
			<!--  다음 페이지 버튼 -->
			<c:if test="${pageMaker.next}">
				<li class="pageInfo_btn next"><a href="?keyword=${keyword}&amp;pageNum=${pageMaker.startPage+1}">다음</a></li>
			</c:if>
		</ul>
	</div>
	<div>
		<form action="blindAdmList.go" method="post" id="blindList">
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
$('#blindList select[name="filter"]').on('change', function() {
	$('#blindList').submit();
});
</script>
</html>