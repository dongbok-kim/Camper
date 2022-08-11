<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../../../resources/inc/header.jsp" %>
				<aside>
					<h2>관리자페이지</h2>
					<ul>
						<li><a href="">회원 관리</a></li>
						<li><a href="reportAdmList">신고 관리</a></li>
						<li><a href="stopAdmList">정지 회원 관리</a></li>
						<li><a href="blindAdmList">블라인드 관리</a></li>
						<li><a href="answerAdmList">1:1문의 관리</a></li>
						<li><a href="">타이틀 관리</a></li>
						<li><a href="ageAdmList">연령대 관리</a></li>
						<li><a href="campingAdmList">캠핑장 관리</a></li>
						<li class="active"><a href="reviewAdmList">후기 관리</a></li>
						<li><a href="togetherAdmList">모집글 관리</a></li>
					</ul>
				</aside>
				<div>
					<h3>후기 관리</h3>
				</div>
<body>
	<div>
		<a href="reviewAdmList">캠핑장 후기</a>
		<a href="reviewMemberAdmList">회원 후기</a>
	</div>
	<div>등록된 캠핑장 후기 수 : ${list.size()}건</div>
	<div>
		<table>
			<tr>
				<th>번호</th>
				<th>후기내용</th>
				<th>평가한 회원</th>
				<th>평가받은 회원</th>
				<th>평가항목<br/>(평가점수)</th>
				<th>작성일시</th>
				<th>블라인드</th>
			</tr>
			<c:forEach items="${list }" var="review">
				<tr>
					<td>${review.mr_idx}</td>
					<td id="mr_content">${review.mr_content }</td>
					<td>${review.mr_id}</td>
					<td>${review.mb_id}</td>
					<td>
					${review.mr_assessment} <br/>
					${review.mr_score}
					</td>				
					<td>${review.mr_datetime}</td>
					<td>
						<c:if test=""><button>블라인드</button></c:if>
					</td>
				</tr>
			</c:forEach>
		</table>
	</div>
	<div>
		<form action="reviewMemberSearch.do" method="post">
			<select name="cr_assessment">
				<option value="평가항목">평가항목</option>
				<option value="좋아요">좋아요</option>
				<option value="싫어요">싫어요</option>
				<option value="보통이에요">보통이에요</option>
			</select>
			<select name="option">
				<option value="all">전체</option>
				<option value="mr_id">평가한 회원</option>
				<option value="mb_id">평가받은 회원</option>
				<option value="mr_content">후기 내용</option>
			</select>
			<input type="text" name="keyword" placeholder="검색"/>
			<input type="submit" value="search"/>
		</form>
	</div>
	<%@ include file="../../../resources/inc/footer.jsp" %>
</body>
<script>
var length = 20;
var str = document.elementById(mr_content);
console.log(str);
</script>
</html>