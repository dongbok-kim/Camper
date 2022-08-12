<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="/resources/inc/header.jsp" %>
				<aside>
					<h2>마이페이지</h2>
					<ul>
						<li><a href="">내 정보 수정</a></li>
						<li><a href="/myCampingLikeList.go">찜한 캠핑장</a></li>
						<li><a href="/myCrewWriteList.go">내가 쓴 모집글</a></li>
						<li><a href="/myCampingReview.go">캠핑장 후기</a></li>
						<li><a href="">크루 후기</a></li>
						<li><a href="/myCrewList.go">참여한 크루 목록</a></li>
						<li><a href="/myChatList.do">참여 중인 채팅방</a></li>
						<li class="active"><a href="/myBlockList.go">차단 회원</a></li>
						<li><a href="/myInquiryList.go">1:1 문의</a></li>
					</ul>
				</aside>
				<div>
					<h3>차단 회원</h3>
					<h4>차단 회원 수 : ${list.size()} 건</h4>
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
								<tr><td colspan="4">차단한 회원이 없습니다.</td></tr>
							</c:if>
							<c:forEach items="${list}" var="bck">
								<tr>
									<td>${bck.bl_idx}</td>
									<td>${bck.mb_id}</td>
									<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${bck.bl_datetime}"/></td>
									<td><a href="/myBlockDelete.do?idx=${bck.bl_idx}">차단 해제</a></td>
								</tr>		
							</c:forEach>
						</tbody>
					</table>
				</div>
<%@ include file="/resources/inc/footer.jsp" %>
	<script>
	</script>
</html>