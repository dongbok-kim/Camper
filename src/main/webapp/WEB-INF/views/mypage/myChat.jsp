<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../../../resources/inc/header.jsp" %>
				<aside>
					<h2>마이페이지</h2>
					<ul>
						<li><a href="mypageInfo.go">내 정보 수정</a></li>
						<li><a href="myCampingLikeList.go">찜한 캠핑장</a></li>
						<li><a href="myCrewWriteList.go">내가 쓴 모집글</a></li>
						<li><a href="myCampingReview.go">캠핑장 후기</a></li>
						<li><a href="myCrewReviewR.go">크루 후기</a></li>
						<li><a href="myCrewList.go">참여한 크루 목록</a></li>
						<li class="active"><a href="/myChatList.do">참여 중인 채팅방</a></li>
						<li><a href="myBlockList.go">차단 회원</a></li>
						<li><a href="myInquiryList.go">1:1 문의</a></li>
					</ul>
				</aside>
				<div class="right mypg">
					<h3>참여 중인 채팅방</h3>
					<h4>총 채팅방 수 : <strong>${listCnt}</strong>건</h4>
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
								<th>채팅방 제목</th>
								<th>참여자수 / 정원</th>
								<th>모집현황</th>
							</tr>
						</thead>
						<tbody>
						<c:choose>
							<c:when test="${listCnt eq 0}">
							<tr align="center" height="180">
								<td colspan="4">참여 중인 채팅방이 없습니다. 크루모집에 참여해 보세요</td>
							</tr>
							</c:when>
							<c:otherwise>
							<c:forEach items="${list}" var="list" varStatus="i">
							<tr>
								<td align="center">${listCnt-i.index}</td>
								<td><a href="javascript:;" onclick="javascript:window.open('chat.do?cg_idx=${list.cg_idx}', 'chat', 'width=1200, height=750')">${list.ct_title}</a></td>
								<td align="center"><strong style="color: #6bbb69;">${list.cntJoin}</strong> / ${list.cg_limit}</td>
								<td align="right">${list.cntCrew}명</td>
							</tr>
							</c:forEach>
							</c:otherwise>
						</c:choose>
						</tbody>
					</table>
				</div>
<%@ include file="../../../resources/inc/footer.jsp" %>
	<script></script>
</html>