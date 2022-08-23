<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/resources/inc/header.jsp" %>
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
				<div class="right admpg">
					<h3>블라인드 관리</h3>
					<h4>총 블라인드 수 : <strong>${listCnt}</strong>건</h4>
					<table>
						<colgroup>
							<col width="58"></col>
							<col width="120"></col>
							<col width="*"></col>
							<col width="125"></col>
							<col width="180"></col>
						</colgroup>
						<thead>
							<tr>
								<th>번호</th>
								<th>구분</th>
								<th>블라인드 사유</th>
								<th>블라인드 처리자</th>
								<th>블라인드 일시</th>
							</tr>
						</thead>
						<tbody>
							<c:if test="${list.size() eq 0}">
							<tr align="center" height="180">
								<td colspan="5">블라인드 글이 없습니다.</td>
							</tr>
							</c:if>
							<c:forEach items="${list }" var="blind" varStatus="i">
							<tr>
								<td align="center">${listCnt - skip - i.index}</td>
								<td align="center">
									<c:if test="${blind.bb_relation eq 'cp_crew_together'}">모집글</c:if>
									<c:if test="${blind.bb_relation eq 'cp_member_review'}">회원 후기</c:if>
									<c:if test="${blind.bb_relation eq 'cp_camping_review'}">캠핑장 후기</c:if>
								</td>
								<td>${blind.bb_reason}</td>
								<td align="center">${blind.mb_id}</td>
								<td align="center"><fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${blind.bb_datetime}"/></td>
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
					<form action="blindAdmList.go" method="post" id="blindList">
						<select name="filter">
							<option value=""  >해당 게시판</option>
							<option value="cp_camping_review" <c:if test="${filter eq 'cp_camping_review'}">selected="selected"</c:if> >캠핑장 후기</option>
							<option value="cp_member_review" <c:if test="${filter eq 'cp_member_review'}">selected="selected"</c:if> >회원 후기</option>
							<option value="cp_camping_together" <c:if test="${filter eq 'cp_camping_together'}">selected="selected"</c:if> >모집글</option>
						</select>
						<select name="type">
							<option value="">전체</option>
							<option value="bb_reason" <c:if test="${filter eq 'bb_reason'}">selected="selected"</c:if> >블라인드 사유</option>
							<option value="mb_id" <c:if test="${filter eq 'mb_id'}">selected="selected"</c:if> >블라인드 처리자</option>
						</select>
						<input type="text" name="keyword" value="${keyword }" placeholder="검색"/>
						<input type="submit" class="btn btnSubmit" value="SEARCH"/>
					</form>
				</div>
	<%@ include file="/resources/inc/footer.jsp" %>
<script>
$('#blindList select[name="filter"]').on('change', function() {
	$('#blindList').submit();
});
</script>
</html>