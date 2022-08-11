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
						<li><a href="">참여 중인 채팅방</a></li>
						<li><a href="">차단 회원</a></li>
						<li class="active"><a href="/myInquiryList.go">1:1 문의</a></li>
					</ul>
				</aside>
				<div>
					<h3>1:1 문의하기</h3>
					<form action="myInquiryUpdate.do" method="post" name="inquiryForm">
						<table>
							<tr>
								<th>작성자</th>
								<td><input type="hidden" name="idx" value="${dto.in_idx}"/>
								<input type="hidden" name="loginId" value="${dto.mb_id}"/>${dto.mb_id}</td>
							</tr>
							<tr>
								<th>제목</th>
								<td><input type="text" name="subject" value="${dto.in_title}"/></td>
							</tr>
							<tr>
								<th>내용</th>
								<td><textarea name="content">${dto.in_content }</textarea></td>
							</tr>
							<tr>
								<th colspan="2">
									<input type="button" value="완료"  onclick="yn()"/>
									<input type="button" value="목록" onclick="location.href='/myInquiryList.go'"/>
								</th>
							</tr>
						</table>
					</form>
				</div>
<%@ include file="/resources/inc/footer.jsp" %>
	<script>
		function yn(){
			var form = document.inquiryForm;
			
			var cf = confirm("수정하시겠습니까?");
			if (cf == true) {
				form.submit();
			} else{
				
			}
		}
	</script>
</html>