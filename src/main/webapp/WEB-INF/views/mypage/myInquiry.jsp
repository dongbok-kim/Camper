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
						<li><a href="">캠핑장 후기</a></li>
						<li><a href="">크루 후기</a></li>
						<li><a href="/myCrewList.go">참여한 크루 목록</a></li>
						<li><a href="">참여 중인 채팅방</a></li>
						<li><a href="">차단 회원</a></li>
						<li class="active"><a href="">1:1 문의</a></li>
					</ul>
				</aside>
				<div>
					<h3>1:1 문의<a href="/inquiryWrite.go">1:1 문의하기</a></h3>
					총 문의 수 : ${list.size()} 건
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
								<tr><td colspan="4">문의 내역이 없습니다.</td></tr>
							</c:if>
							<c:forEach items="${list}" var="ask">
								<tr>
									<td>${ask.in_idx}</td>
									<td><a href="inquiryDetail.go?idx=${ask.in_idx}">${ask.in_title}</a></td>
									<td><fmt:formatDate pattern="yyyy-MM-dd" value="${ask.in_datetime}"/></td>
									<td>${ask.in_status}</td>
								</tr>		
							</c:forEach>
						</tbody>
					</table>
				</div>
<%@ include file="/resources/inc/footer.jsp" %>
	<script>
		var msg = "${msg}";
		if(msg != ""){
			alert(msg);
		}
	</script>
</html>