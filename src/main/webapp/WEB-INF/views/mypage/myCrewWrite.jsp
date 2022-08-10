<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="/resources/inc/header.jsp" %>
				<aside>
					<h2>마이페이지</h2>
					<ul>
						<li><a href="">내 정보 수정</a></li>
						<li><a href="/myCampingLikeList.go">찜한 캠핑장</a></li>
						<li class="active"><a href="">내가 쓴 모집글</a></li>
						<li><a href="">캠핑장 후기</a></li>
						<li><a href="">크루 후기</a></li>
						<li><a href="/myCrewList.go">참여한 크루 목록</a></li>
						<li><a href="">참여 중인 채팅방</a></li>
						<li><a href="">차단 회원</a></li>
						<li><a href="/myInquiryList.go">1:1 문의</a></li>
					</ul>
				</aside>
				<div>
					<h3>내가 쓴 모집글</h3>
					참여한 크루 목록 수 : ${list.size()} 건
					<table>
						<thead>
							<tr>
								<th>번호</th>
								<th>제목</th>
								<th>모집인원 수</th>
								<th>크루모집현황</th>
								<th>작성일자</th>
								<th>삭제</th>
							</tr>
						</thead>
						<tbody>
							<c:if test="${list.size() == 0}">
								<tr><td colspan="6">등록된 크루모집글이 없습니다.</td></tr>
							</c:if>
							<c:forEach items="${list}" var="my">
								<tr>
									<td>${my.ct_idx}</td>
									<td><a href="">${my.ct_title}</a></td>
									<td>${my.ct_people_cnt} 명</td>
									<td>${my.nowCnt} 명</td>
									<td><fmt:formatDate pattern="yyyy-MM-dd" value="${my.ct_datetime}"/></td>
									<td><a href="myCrewWriteDelete.do?idx=${my.ct_idx}">삭제</a></td>
								</tr>		
							</c:forEach>
						</tbody>
					</table>
				</div>
<%@ include file="/resources/inc/footer.jsp" %>
	<script></script>
</html>