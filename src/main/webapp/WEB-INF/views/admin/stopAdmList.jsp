<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../../../resources/inc/header.jsp" %>
				<aside>
					<h2>관리자페이지</h2>
					<ul>
						<li><a href="/memberAdmList.go">회원 관리</a></li>
						<li><a href="/reportAdmList.go">신고 관리</a></li>
						<li class="active"><a href="/stopAdmList.go">정지 회원 관리</a></li>
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
					<h3>정지 회원 관리</h3>
					<h4>총 정지회원 수 : <strong>${listCnt}</strong>건</h4>
					<table>
						<colgroup>
							<col width="58"></col>
							<col width="120"></col>
							<col width="180"></col>
							<col width="*"></col>
							<col width="125"></col>
							<col width="200"></col>
							<col width="80"></col>
						</colgroup>
						<thead>
							<tr>
								<th>번호</th>
								<th>회원 아이디</th>
								<th>닉네임</th>
								<th>정지사유</th>
								<th>정지시킨 관리자</th>
								<th>정지기간</th>
								<th>정지누적횟수</th>
							</tr>
						</thead>
						<tbody>
							<c:choose>
							<c:when test="${list.size() eq 0}">
							<tr align="center" height="180">
								<td colspan="7">데이터가 없습니다</td>
							</tr>
							</c:when>
							<c:otherwise>
							<c:forEach items="${list }" var="stop" varStatus="i">
								<tr>
									<td align="center">${listCnt - skip - i.index}</td>
									<td align="center" class="contextMenu contextMenuMember" data-id="${stop.mb_id}">${stop.mb_id}</td>
									<td align="center">${stop.mb_nickname}</td>
									<td>${stop.ms_reason}</td>
									<td align="center">${stop.ms_admin_id }</td>
									<td align="center">${stop.ms_start_date} - ${stop.ms_end_date}</td>
									<td align="right">${stop.ms_count }회</td>
								</tr>
								</c:forEach>
								</c:otherwise>
								</c:choose>
							</tbody>
						</table>
						<ul class="pageInfo">
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
						<form action="stopAdmList.go" method="post" id="stopList">
							<select name="filter">
								<option value="">정지누적횟수</option>
								<option value="1" <c:if test="${filter eq 1}">selected="selected"</c:if> >1</option>
								<option value="2" <c:if test="${filter eq 2}">selected="selected"</c:if> >2</option>
								<option value="3" <c:if test="${filter eq 3}">selected="selected"</c:if> >3</option>
							</select>
							<select name="type">
								<option value="">전체</option>
								<option value="회원아이디" <c:if test="${type eq '회원아이디'}">selected="selected"</c:if> >회원아이디</option>
								<option value="닉네임" <c:if test="${type eq '닉네임'}">selected="selected"</c:if> >닉네임</option>
							</select>
							<input type="text" name="keyword" value="${keyword }" placeholder="검색"/>
							<input type="submit" class="btn btnSubmit" value="SEARCH"/>
						</form>
					</div>
	<%@ include file="/resources/inc/footer.jsp" %>
	<script>
		$('#stopList select[name="filter"]').on('change', function() {
			$('#stopList').submit();
		});
	</script>
</html>