<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="/resources/inc/header.jsp" %>
				<aside>
					<h2>마이페이지</h2>
					<ul>
						<li><a href="">내 정보 수정</a></li>
						<li class="active"><a href="">찜한 캠핑장</a></li>
						<li><a href="">내가 쓴 모집글</a></li>
						<li><a href="">캠핑장 후기</a></li>
						<li><a href="">크루 후기</a></li>
						<li><a href="">참여한 크루 목록</a></li>
						<li><a href="">참여 중인 채팅방</a></li>
						<li><a href="">차단 회원</a></li>
						<li><a href="">1:1 문의</a></li>
					</ul>
				</aside>
				<div>
					<h3>찜한 캠핑장</h3>
					찜한 캠핑장 수 : 건
					<table>
						<thead>
							<tr>
								<th>번호</th>
								<th>캠핑장 이름</th>
								<th>찜한 일자</th>
								<th>찜해제</th>
							</tr>
						</thead>
					</table>
				</div>
<%@ include file="/resources/inc/footer.jsp" %>
	<script></script>
</html>