<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../../../resources/inc/header.jsp" %>
				<aside>
					<h2>관리자페이지</h2>
					<ul>
						<li><a href="">회원 관리</a></li>
						<li><a href="reportAdmList">신고 관리</a></li>
						<li><a href="stopAdmList">정지 회원 관리</a></li>
						<li><a href="ageAdmList">블라인드 관리</a></li>
						<li><a href="answerAdmList">1:1문의 관리</a></li>
						<li><a href="">타이틀 관리</a></li>
						<li><a href="ageAdmList">연령대 관리</a></li>
						<li class="active"><a href="campingAdmList">캠핑장 관리</a></li>
						<li><a href="reviewAdmList">후기 관리</a></li>
						<li><a href="togetherAdmList">모집글 관리</a></li>
					</ul>
				</aside>
				<div>
					<h3>캠핑장 관리</h3>
				</div>
<body>
	<div>총 캠핑장 수 : ${list.size()}건</div>	
	<div><input type="checkbox" name="api" value="api"/>API 정보 관리</div>
	<div>
		<table>
			<thead>
				<tr>
					<th>번호</th>
					<th>캠핑장 이름</th>
					<th>시/도</th>
					<th>시/군/구</th>
					<th>전화번호</th>
					<th>등록일</th>
					<th>수정일</th>
					<th>운영상태</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${list }" var="camp">
					<tr>
						<td>${camp.ca_idx}</td>
						<td><a onclick="location.href='ageUpdate.go?ma_idx=${age.ma_idx}' " >${camp.ca_name}</a></td>
						<td>${camp.ca_sido}</td>
						<td>${camp.ca_sigungu}</td>
						<td>${camp.ca_tel}</td>
						<td>${camp.ca_create_date}</td>
						<td>${camp.ca_modified_date}</td>
						<td>${camp.ca_manage_status}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
			<ul>
			<!-- 이전페이지 버튼 -->
			<c:if test="${pageMaker.prev}">
			<li class="pageInfo_btn prev"><a href="?type=${type}&amp;keyword=${keyword}&amp;pageNum=${pageMaker.startPage-1}">이전</a></li>
			</c:if>
			
			<!-- 각 번호 페이지 버튼 -->
			<c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
			<li class="pageInfo_btn ${pageMaker.cri.pageNum eq num ? 'active' : ''}"><a href="?type=${type}&amp;keyword=${keyword}&amp;pageNum=${num}">${num}</a></li>
			</c:forEach>
			
			<!-- 다음페이지 버튼 -->
			<c:if test="${pageMaker.next}">
			<li class="pageInfo_btn next"><a href="?type=${type}&amp;keyword=${keyword}&amp;pageNum=${pageMaker.endPage+1}">다음</a></li>
			</c:if>
		</ul>
	</div>
	<div>
		<form action="CampingAdmSearch.do" method="post">
			<select name="filterSido">
				<option value="시/도">시/도</option>
				<option value="서울">운영</option>
				<option value="휴장">휴장</option>
				<option value="확인중">확인중</option>
			</select>
			<select name="filterStatus">
				<option value="운영상태">운영상태</option>
				<option value="운영">운영</option>
				<option value="휴장">휴장</option>
				<option value="확인중">확인중</option>
			</select>
			<input type="text" name="keyword" value="${keyword}" placeholder="검색"/>
			<input type="submit" value="search"/>
		</form>
	</div>
	<%@ include file="../../../resources/inc/footer.jsp" %>
</body>
<script>
</script>
</html>