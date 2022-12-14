<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/resources/inc/header.jsp" %>
				<aside>
					<h2>마이페이지</h2>
					<ul>
						<li><a href="/mypageInfo.go">내 정보 수정</a></li>
						<li class="active"><a href="">찜한 캠핑장</a></li>
						<li><a href="/myCrewWriteList.go">내가 쓴 모집글</a></li>
						<li><a href="/myCampingReview.go">캠핑장 후기</a></li>
						<li><a href="/myCrewReviewR.go">크루 후기</a></li>
						<li><a href="/myCrewList.go">참여한 크루 목록</a></li>
						<li><a href="/myChatList.do">참여 중인 채팅방</a></li>
						<li><a href="/myBlockList.go">차단 회원</a></li>
						<li><a href="/myInquiryList.go">1:1 문의</a></li>
					</ul>
				</aside>
				<div class="right mypg">
					<h3>찜한 캠핑장</h3>
					<h4>찜한 캠핑장 수 : <strong>${listCnt}</strong>건</h4>
					<table>
						<colgroup>
							<col width="58"></col>
							<col width="*"></col>
							<col width="120"></col>
							<col width="100"></col>
						</colgroup>
						<thead>
							<tr>
								<th>번호</th>
								<th>캠핑장 이름</th>
								<th>찜한 일자</th>
								<th>찜해제</th>
							</tr>
						</thead>
						<tbody>
						<c:if test="${list.size() == 0}">
							<tr align="center" height="180">
								<td colspan="4">찜한 캠핑장이 없습니다.</td>
							</tr>
						</c:if>
						<c:forEach items="${list}" var="bbs" varStatus="i">
							<tr>
								<td align="center">${listCnt - skip - i.index}</td>
								<td><a href="/campingView.go?ca_idx=${bbs.ca_idx}" target="_blank">${bbs.ca_name}</a></td>
								<td align="center"><fmt:formatDate pattern="yyyy-MM-dd" value="${bbs.cl_datetime}"/></td>
								<td align="center"><a href="myCampingLikeDelete.do?idx=${bbs.cl_idx}" class="btn btnDelete">찜해제</a></td>
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
					<form action="myCampingLikeList.go" method="post">
						<input type="text" name="keyword" value="${keyword}" placeholder="캠핑장 검색"/>
						<input type="submit" class="btn btnSubmit" value="SEARCH"/>
					</form>
				</div>
<%@ include file="/resources/inc/footer.jsp" %>
	<script></script>
</html>