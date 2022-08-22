<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
				<div class="right admpg">
					<h3>신고 관리</h3>
					<h4>총 신고 수 : <strong>${listCnt}</strong>건</h4>
					<table>
						<thead>
							<tr>
								<th>번호</th>
								<th>신고내용</th>
								<th>신고당한 회원</th>
								<th>신고자</th>
								<th>신고일</th>
								<th>신고누적횟수</th>
								<th>처리상태</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${list }" var="report" varStatus="i">
							<tr>
								<td align="center">${listCnt - skip - i.index}</td>
								<td><a href="reportAdmView?rp_idx=${report.rp_idx}&amp;filter=${filter}&amp;type=${type}&amp;keyword=${keyword}&amp;pageNum=${pageMaker.cri.pageNum}">${report.rp_content}</a></td>
								<td align="center" class="contextMenu contextMenuMember" data-id="${report.mb_id}">${report.mb_id}</td>
								<td align="center" class="contextMenu contextMenuMember" data-id="${report.rp_id}">${report.rp_id}</td>
								<td align="center"><fmt:formatDate pattern="yyyy-MM-dd" value="${report.rp_datetime}"/></td>
								<td align="right">${report.rp_count }회</td>
								<td align="center">${report.rp_status}</td>
							</tr>
							</c:forEach>
						</tbody>
					</table>
					<ul class="pageInfo">
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
					<form action="reportAdmList.go" method="post" id="reportList">
						<select name="filter">
							<option value="">처리상태</option>
							<option value="미처리">미처리</option>
							<option value="처리중">처리중</option>
							<option value="처리완료">처리완료</option>
						</select>
						<select name="type">
							<option value="전체">전체</option>
							<option value="신고당한회원">신고당한회원</option>
							<option value="신고자">신고자</option>
							<option value="신고내용">신고내용</option>
						</select>
						<input type="text" name="keyword" value="${keyword}" placeholder="검색"/>
						<input type="submit" class="btn btnSubmit" value="SEARCH" />
					</form>
				</div>
	<%@ include file="/resources/inc/footer.jsp" %>
<script>
$('#reportList select[name="filter"]').on('change', function() {
	$('#reportList').submit();
});
</script>
</html>