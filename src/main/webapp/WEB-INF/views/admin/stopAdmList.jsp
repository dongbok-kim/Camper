<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../../../resources/inc/header.jsp" %>
				<aside>
					<h2>관리자페이지</h2>
					<ul>
						<li><a href="/memberAdmList.go">회원 관리</a></li>
						<li><a href="/reportAdmList.go">신고 관리</a></li>
						<li class="active"><a href="/stopAdmList.go">정지 회원 관리</a></li>
						<li><a href="/blindAdmList.go">블라인드 관리</a></li>
						<li><a href="/answerAdmList.go">1:1문의 관리</a></li>
						<li><a href="/titleList.go">타이틀 관리</a></li>
						<li><a href="/ageAdmList.go">연령대 관리</a></li>
						<li><a href="/campingAdmList.go">캠핑장 관리</a></li>
						<li><a href="/reviewAdmList.go">후기 관리</a></li>
						<li><a href="/togetherAdmList.go">모집글 관리</a></li>
					</ul>
				</aside>
				<div>
					<h3>정지 회원 관리</h3>
				</div>
<body>
	<div>총 정지회원 수 : ${list.size()}건</div>
	<div>
		<table>
			<tr>
				<th>번호</th>
				<th>회원 아이디</th>
				<th>이름</th>
				<th>닉네임</th>
				<th>정지사유</th>
				<th>정지시킨 관리자</th>
				<th>정지기간</th>
				<th>정지누적횟수</th>
			</tr>
			<c:forEach items="${list }" var="stop">
				<tr>
					<td>${stop.ms_idx}</td>
					<td class="contextMenu contextMenuMember" data-id="${stop.mb_id}">${stop.mb_id}</a></td>
					<td>${stop.mb_name}</td>
					<td>${stop.mb_nickname}</td>
					<td>${stop.ms_reason}</td>
					<td>${stop.ms_admin_id }</td>
					<td>${stop.ms_start_date} - ${stop.ms_end_date}</td>
					<td>${stop.ms_count }</td>
				</tr>
			</c:forEach>
		</table>
	</div>
	<div>
		<form action="stopSearch.do" method="post">
			<select name="ms_count">
				<option value="ms_count">정지누적횟수</option>
				<option value="1">1</option>
				<option value="2">2</option>
				<option value="3">3</option>
			</select>
			<select name="option">
				<option value="전체">전체</option>
				<option value="회원아이디">회원아이디</option>
				<option value="닉네임">닉네임</option>
			</select>
			<input type="text" name="keyword" placeholder="검색"/>
			<input type="submit" value="search"/>
		</form>
	</div>
	<%@ include file="../../../resources/inc/footer.jsp" %>
</body>
<script>

</script>
</html>