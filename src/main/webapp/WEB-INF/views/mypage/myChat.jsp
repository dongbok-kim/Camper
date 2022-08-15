<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../../../resources/inc/header.jsp" %>
				<aside>
					<h2>마이페이지</h2>
					<ul>
						<li><a href="">내 정보 수정</a></li>
						<li><a href="">찜한 캠핑장</a></li>
						<li><a href="">내가 쓴 모집글</a></li>
						<li><a href="">캠핑장 후기</a></li>
						<li><a href="">크루 후기</a></li>
						<li><a href="">참여한 크루 목록</a></li>
						<li class="active"><a href="">참여 중인 채팅방</a></li>
						<li><a href="">차단 회원</a></li>
						<li><a href="">1:1 문의</a></li>
					</ul>
				</aside>
				<div>
					<h3>참여 중인 채팅방</h3>
					<h4>총 채팅방 수 : <strong>${listCnt}</strong>건</h4>
					<table>
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
								<td>${listCnt-i.index}</td>
								<td>${list.ct_title}</td>
								<td>${list.cntJoin} / ${list.cg_limit}</td>
								<td>${list.cntCrew}</td>
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