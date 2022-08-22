<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../../../resources/inc/header.jsp" %>
				<aside>
					<h2>관리자페이지</h2>
					<ul>
						<li><a href="/memberAdmList.go">회원 관리</a></li>
						<li><a href="/reportAdmList.go">신고 관리</a></li>
						<li><a href="/stopAdmList.go">정지 회원 관리</a></li>
						<li><a href="/blindAdmList.go">블라인드 관리</a></li>
						<li class="active"><a href="/answerAdmList.go">1:1문의 관리</a></li>
						<li><a href="/titleList.go">타이틀 관리</a></li>
						<li><a href="/ageAdmList.go">연령대 관리</a></li>
						<li><a href="/campingAdmList.go">캠핑장 관리</a></li>
						<li><a href="/reviewAdmList.go">후기 관리</a></li>
						<li><a href="/togetherAdmList.go">모집글 관리</a></li>
					</ul>
				</aside>
				<div class="right admpg">
					<h3>문의글 관리</h3>
					<h4>총 문의 수 : <strong>${listCnt}</strong>건</h4>
					<table>
					<thead>
						<tr>
							<th>번호</th>
							<th>제목</th>
							<th>아이디</th>
							<th>문의날짜</th>
							<th>답변상태</th>
						</tr>
					</thead>
					<tbody>
						<c:if test="${list.size() == 0}">
							<tr align="center" height="180">
								<td colspan="5">문의 내역이 없습니다.</td>
							</tr>
						</c:if>
						<c:forEach items="${list }" var="answer" varStatus="i">
							<tr>
								<td align="center">${listCnt - skip - i.index}</td>
								<td><a href="answerAdmView?in_idx=${answer.in_idx}&amp;filter=${filter}&amp;type=${type}&amp;keyword=${keyword}&amp;pageNum=${pageMaker.cri.pageNum}">${answer.in_title}</a></td>
								<td align="center" class="contextMenu contextMenuMember" data-id="${answer.mb_id}">${answer.mb_id}</td>
								<td align="center"><fmt:formatDate pattern="yyyy-MM-dd" value="${answer.in_datetime}"/></td>
								<td align="center">${answer.in_status}</td>
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
					<form action="answerAdmList.go" method="post" id="answerList">
						<select name="filter">
							<option value=""  >답변상태</option>
							<option value="답변대기" <c:if test="${filter eq '답변대기'}">selected="selected"</c:if> >답변대기</option>
							<option value="처리중" <c:if test="${filter eq '처리중'}">selected="selected"</c:if> >처리중</option>
							<option value="답변완료" <c:if test="${filter eq '답변완료'}">selected="selected"</c:if> >답변완료</option>
						</select>
						<select name="type">
							<option value="전체">전체</option>
							<option value="제목" <c:if test="${type eq '제목'}">selected="selected"</c:if> >제목</option>
							<option value="내용" <c:if test="${type eq '내용'}">selected="selected"</c:if> >내용</option>
							<option value="아이디" <c:if test="${type eq '아이디'}">selected="selected"</c:if> >아이디</option>
						</select>
						<input type="text" name="keyword" value="${keyword}" placeholder="검색"/>
						<input type="submit" class="btn btnSubmit" value="SEARCH"/>
					</form>
				</div>
	<%@ include file="/resources/inc/footer.jsp" %>
<script>
$('#answerList select[name="filter"]').on('change', function() {
	$('#answerList').submit();
});
</script>
</html>