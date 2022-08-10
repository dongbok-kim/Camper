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
						<li class="active"><a href="/myInquiryList.go">1:1 문의</a></li>
					</ul>
				</aside>
				<div>
					<h3>1:1 문의 상세보기</h3>
					<table>
						<tr>
							<td colspan='6'>${dto.in_title}</td>
						</tr>
						<tr>
							<th>작성자</th>
							<td>${dto.mb_id}</td>
							<th>등록일시</th>
							<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${dto.in_datetime}"/></td>
							<th>답변상태</th>
							<td>${dto.in_status}</td>
						</tr>
						<tr>
							<td colspan='6'>${dto.in_content}</td>
						</tr>	
						<tr>
							<th colspan="6">
								<input type="button" value="목록" onclick="location.href='/myInquiryList.go'"/>
								<input type="button" value="수정" onclick=""/>
								<input type="button" value="삭제" onclick=""/>
							</th>
						</tr>
					</table>
				</div>
<%@ include file="/resources/inc/footer.jsp" %>
	<script>
	</script>
</html>