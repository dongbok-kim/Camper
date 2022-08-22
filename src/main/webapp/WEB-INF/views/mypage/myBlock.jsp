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
						<li class="active"><a href="/myBlockList.go">차단 회원</a></li>
						<li><a href="/myInquiryList.go">1:1 문의</a></li>
					</ul>
				</aside>
				<div class="right mypg">
					<h3>차단 회원</h3>
					<h4>차단 회원 수 : <strong>${listCnt}</strong>건</h4>
					<table>
						<thead>
							<tr>
								<th>번호</th>
								<th>차단회원</th>
								<th>차단일시</th>
								<th>차단해제</th>
							</tr>
						</thead>
						<tbody>
							<c:if test="${list.size() == 0}">
							<tr>
								<td colspan="4">차단한 회원이 없습니다.</td>
							</tr>
							</c:if>
							<c:forEach items="${list}" var="bck" varStatus="i">
							<tr>
								<td align="center">${listCnt - skip - i.index}</td>
								<td align="center" class="contextMenu contextMenuMember" data-id="${bck.mb_nickname}">${bck.mb_nickname}</td>
								<td align="center"><fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${bck.bl_datetime}"/></td>
								<td align="center"><input  type="button" class="btn btnDelete" value="차단해제" onclick="del(${bck.bl_idx})"/></td>
							</tr>		
							</c:forEach>
						</tbody>
					</table>
				</div>
<%@ include file="/resources/inc/footer.jsp" %>
	<script>
	
		function del(idx){
			
			var cf = confirm("차단 해제하시겠습니까?");
			if (cf == true) {
				location.href="myBlockDelete.do?idx="+idx;
			} else{
				
			}
		}
		
	</script>
</html>