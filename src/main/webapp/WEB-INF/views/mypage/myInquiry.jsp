<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/resources/inc/header.jsp" %>
				<aside>
					<h2>마이페이지</h2>
					<ul>
						<li><a href="/mypageInfo.go">내 정보 수정</a></li>
						<li><a href="/myCampingLikeList.go">찜한 캠핑장</a></li>
						<li><a href="/myCrewWriteList.go">내가 쓴 모집글</a></li>
						<li><a href="/myCampingReview.go">캠핑장 후기</a></li>
						<li><a href="/myCrewReviewR.go">크루 후기</a></li>
						<li><a href="/myCrewList.go">참여한 크루 목록</a></li>
						<li><a href="/myChatList.do">참여 중인 채팅방</a></li>
						<li><a href="/myBlockList.go">차단 회원</a></li>
						<li class="active"><a href="">1:1 문의</a></li>
					</ul>
				</aside>
				<div class="right mypg">
					<h3>1:1 문의<a href="/inquiryWrite.go" class="btn btnWrite" style="float: right; font-size: 13px;">1:1 문의하기</a></h3>
					<h4>총 문의 수 : <strong>${listCnt}</strong>건</h4>
					<table>
						<thead>
							<tr>
								<th>번호</th>
								<th>제목</th>
								<th>작성일</th>
								<th>답변상태</th>
							</tr>
						</thead>
						<tbody>
							<c:if test="${list.size() == 0}">
							<tr align="center" height="180">
								<td colspan="4">문의 내역이 없습니다.</td>
							</tr>
							</c:if>
							<c:forEach items="${list}" var="ask" varStatus="i">
							<tr>
								<td align="center">${listCnt - skip - i.index}</td>
								<td>
									<a href="inquiryDetail.go?idx=${ask.in_idx}&amp;filter=${filter}&amp;type=${type}&amp;keyword=${keyword}&amp;pageNum=${pageMaker.cri.pageNum}">${ask.in_title}</a>
								</td>
								<td align="center"><fmt:formatDate pattern="yyyy-MM-dd" value="${ask.in_datetime}"/></td>
								<td align="center">${ask.in_status}</td>
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
							<li class="pageInfo_btn ${pageMaker.cri.pageNum eq num ? 'active' : ''}"><a href="?keyword=${keyword}&amp;pageNum=${num}">${num}</a></li>
						</c:forEach>
						
						<!--  다음 페이지 버튼 -->
						<c:if test="${pageMaker.next}">
							<li class="pageInfo_btn next"><a href="?keyword=${keyword}&amp;pageNum=${pageMaker.startPage+1}">다음</a></li>
						</c:if>
					</ul>
					<form action="myInquiryList.go" method="post" id="inquiryForm">
						<select name="filter">
							<option value="">답변상태</option>
							<option value="답변대기" <c:if test="${filter eq '답변대기'}">selected="selected"</c:if>>답변대기</option>
							<option value="처리중" <c:if test="${filter eq '처리중'}">selected="selected"</c:if>>처리중</option>
							<option value="답변완료" <c:if test="${filter eq '답변완료'}">selected="selected"</c:if>>답변완료</option>
						</select>
						<select name="type">
							<option value="all">전체</option>
							<option value="in_title" <c:if test="${type eq 'in_title'}">selected="selected"</c:if>>제목</option>
							<option value="in_content"<c:if test="${type eq 'in_content'}">selected="selected"</c:if>>내용</option>
						</select>
						<input type="text" name="keyword" value="${keyword}" placeholder="검색"/>
						<input type="submit" class="btn btnSubmit" value="SEARCH"/>
					</form>
				</div>
<%@ include file="/resources/inc/footer.jsp" %>
	<script>
		var msg = "${msg}";
		if(msg != ""){
			alert(msg);
		}
		
		$('#inquiryForm select[name="filter"]').on('change', function() {
			$('#inquiryForm').submit();
		});
	</script>
</html>