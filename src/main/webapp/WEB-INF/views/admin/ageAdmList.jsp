<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../../../resources/inc/header.jsp" %>
				<aside>
					<h2>관리자페이지</h2>
					<ul>
						<li><a href="/memberAdmList.go">회원 관리</a></li>
						<li><a href="/reportAdmList.go">신고 관리</a></li>
						<li><a href="/stopAdmList.go">정지 회원 관리</a></li>
						<li><a href="/blindAdmList.go">블라인드 관리</a></li>
						<li><a href="/answerAdmList.go">1:1문의 관리</a></li>
						<li><a href="/titleList.go">타이틀 관리</a></li>
						<li class="active"><a href="/ageAdmList.go">연령대 관리</a></li>
						<li><a href="/campingAdmList.go">캠핑장 관리</a></li>
						<li><a href="/reviewAdmList.go">후기 관리</a></li>
						<li><a href="/togetherAdmList.go">모집글 관리</a></li>
					</ul>
				</aside>
				<div class="right admpg">
					<h3>연령대 관리 <a href="ageAdmReg.go" class="btn btnWrite" style="float: right;">연령대 추가</a></h3>
					<h4>총 연령대 수 : <strong>${list.size()}</strong>건</h4>
					<table>
						<thead>
							<tr>
								<th>번호</th>
								<th>연령대</th>
								<th>수정</th>
							</tr>
						</thead>
						<tbody>
						<c:forEach items="${list }" var="age">
							<tr>
								<td align="center">${age.ma_idx}</td>
								<td align="right">${age.ma_age}대</td>
								<td align="center"><a class="btn btnModify" href="ageUpdate.go?ma_idx=${age.ma_idx}">연령대 수정</a></td>
							</tr>
						</c:forEach>
						</tbody>
					</table>
				</div>
	<%@ include file="../../../resources/inc/footer.jsp" %>
<script>
</script>
</html>