<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

	<body>
	
	
	<h2>${profileView.mb_nickname}()</h2>
	<h2>${profileView.mb_fire}°C</h2>
	<h2>${profileView.age}대&nbsp;/&nbsp;${profileView.mb_gender}성
	</h2>
	
	
				
	<!-- 신고하기 -->
	<button onclick="javascript:window.open('report?mb_id=${profileView.mb_id}', 'report', 'width=800, height=700');">
				신고하기</button>
 
	<!-- 차단회원이 아닌경우 -->
	<c:if test="${blockCheck eq null}">	
		<input type="button" onclick=block() value="차단하기"/>	
	</c:if>
	
	
	<!-- 차단회원인 경우 -->
	<c:if test="${blockCheck ne null}">	
		<input type="button" onclick=blockDelete() value="차단해제"/>
	</c:if>
	
	
	<!-- 작성한 모집글 -->
	<c:forEach items="${profileTogether}" var="Together">
		<table>
			<tr>
				<td>${Together.ct_title}</td>
				<td>${Together.name}&nbsp;${Together.ct_wish_start}&nbsp;~&nbsp;${Together.ct_wish_end}</td>
			</tr>
		</table>
	</c:forEach>
	
	
	<!-- 받은리뷰 -->
	<c:forEach items="${profileReview}" var="Review">
		<table>
			<tr>
				<td>${Review.mr_assessment}</td>
				<td>${Review.mr_content}</td>
			</tr>
		</table>
	</c:forEach>
	
	
	
	
	</body>			

	<script>	
	
	
	function block() {
		if (confirm("이 회원을 차단하시겠습니까?") == true){
			location.href='MemberBlock.do?mb_id=${profileView.mb_id}';
		}
	}
	
	
	function blockDelete() {
		if (confirm("이 회원을 차단해제 하시겠습니까?") == true){
			location.href='MemberBlockDelete.do?mb_id=${profileView.mb_id}';
		}
	}
	
	
	
	
	</script>
	
	
</html>