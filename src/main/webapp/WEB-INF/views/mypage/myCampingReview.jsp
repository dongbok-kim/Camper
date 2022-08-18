<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.util.Date"%>
<% Date now = new Date();%>
<style>

#campingReview > tbody > tr > td.subject {
		cursor: pointer;
	}
	#campingReview > tbody > tr > td.subject:not(.active) {
		max-width: 200px;
		text-overflow: ellipsis;
		overflow: hidden;
		white-space: nowrap;
	}
</style>
<%@ include file="/resources/inc/header.jsp" %>
				<aside>
					<h2>마이페이지</h2>
					<ul>
						<li><a href="">내 정보 수정</a></li>
						<li><a href="/myCampingLikeList.go">찜한 캠핑장</a></li>
						<li><a href="/myCrewWriteList.go">내가 쓴 모집글</a></li>
						<li class="active"><a href="">캠핑장 후기</a></li>
						<li><a href="/myCrewReviewR.go">크루 후기</a></li>
						<li><a href="/myCrewList.go">참여한 크루 목록</a></li>
						<li><a href="/myChatList.do">참여 중인 채팅방</a></li>
						<li><a href="/myBlockList.go">차단 회원</a></li>
						<li><a href="/myInquiryList.go">1:1 문의</a></li>
					</ul>
				</aside>
				<div>
					<h3>캠핑장 후기</h3>
					<h4>캠핑장 후기 수 : ${list.size()} 건</h4>
					<table id="campingReview">
						<colgroup>
							<col width="60"></col>
							<col width="*"></col>
							<col width="80"></col>
							<col width="120"></col>
							<col width="60"></col>
						</colgroup>
						<thead>
							<tr>
								<th>번호</th>
								<th>캠핑장명 및 후기내용</th>
								<th>평가항목</th>
								<th>후기작성일시</th>
								<th>삭제</th>
							</tr>
						</thead>
						<tbody>
							<c:if test="${list.size() == 0}">
								<tr><td colspan="5">작성한 캠핑장 후기가 없습니다.</td></tr>
							</c:if>
							<c:forEach items="${list}" var="rv">
								<tr>
									<td>${rv.cr_idx}</td>
									<td  class="subject" >${rv.ca_name}<br/>${rv.cr_content}</td>
									<td>${rv.cr_assessment}</td>
									<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${rv.cr_datetime}"/></td>
									<c:if test="${rv.delAvail > rv.today}">
										<td><a href="campingReviewDelete.do?idx=${rv.cr_idx}">삭제</a></td>
									</c:if>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
<%@ include file="/resources/inc/footer.jsp" %>
	<script>
	
		$('#campingReview > tbody > tr > td.subject').on('click', function() {
			$('#campingReview > tbody > tr > td.subject').removeClass('active');
			$(this).addClass('active');
		});
	
		</script>
</html>