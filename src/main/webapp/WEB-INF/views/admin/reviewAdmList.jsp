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
				<th>캠핑장명 및 후기내용</th>
				<th>평가항목</th>
				<th>작성자</th>
				<th>작성일시</th>
				<th>블라인드</th>
			</tr>
			<c:forEach items="${list }" var="review">
				<tr>
					<td>${review.cr_idx}</td>
					<td>
					${review.ca_name }<br/>
					<a class="cr_content" onclick="openClose()">${review.cr_content }</a>
					</td>
					<td>${review.cr_assessment}</td>
					<td>${review.mb_id}</td>
					<td>${review.cr_datetime}</td>
					<td>
						<c:if test="${review.bb_count eq 0}"><button>블라인드</button></c:if>
					</td>
				</tr>
			</c:forEach>
		</table>
	</div>
	<div>
		<form action="reviewCampSearch.do" method="post">
			<select name="cr_assessment">
				<option value="평가항목">평가항목</option>
				<option value="좋아요">좋아요</option>
				<option value="싫어요">싫어요</option>
				<option value="보통이에요">보통이에요</option>
			</select>
			<select name="option">
				<option value="all">전체</option>
				<option value="mb_id">작성자명</option>
				<option value="ca_name">캠핑장명</option>
			</select>
			<input type="text" name="keyword" placeholder="검색"/>
			<input type="submit" value="search"/>
		</form>
	</div>
	<%@ include file="../../../resources/inc/footer.jsp" %>
</body>
<script>
$('.cr_content').each(function(){
	var length = 10;
	$(this).each(function(){
		if($(this).text().length >= length) {
			$(this).text($(this).text().substr(0, length)+'...');
		}
	});
});

function openClose() {
	console.log(this);
}
</script>
</html>