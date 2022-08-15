<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="/resources/inc/header.jsp" %>
				<aside>
					<h2>마이페이지</h2>
					<ul>
						<li><a href="">내 정보 수정</a></li>
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
				<div>
					<h3>찜한 캠핑장</h3>
					<h4>찜한 캠핑장 수 : ${list.size()} 건</h4>
					<table>
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
								<tr><td colspan="4">찜한 캠핑장이 없습니다.</td></tr>
							</c:if>
							<c:forEach items="${list}" var="bbs">
								<tr>
									<td>${bbs.cl_idx}</td>
									<td><a href="">${bbs.ca_name}</a></td>
									<td><fmt:formatDate pattern="yyyy-MM-dd" value="${bbs.cl_datetime}"/></td>
									<td><a href="myCampingLikeDelete.do?idx=${bbs.cl_idx}">삭제</a></td>
								</tr>		
							</c:forEach>
						</tbody>
					</table>
				</div>
<%@ include file="/resources/inc/footer.jsp" %>
	<script></script>
</html>