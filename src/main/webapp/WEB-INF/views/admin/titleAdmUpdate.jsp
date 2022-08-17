<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="/resources/inc/header.jsp" %>
				<aside>
					<h2>관리자페이지</h2>
					<ul>
						<li><a href="">회원 관리</a></li>
						<li><a href="reportAdmList">신고 관리</a></li>
						<li><a href="stopAdmList">정지 회원 관리</a></li>
						<li><a href="ageAdmList">블라인드 관리</a></li>
						<li><a href="answerAdmList">1:1문의 관리</a></li>
						<li class="active"><a href="/titleList.go">타이틀 관리</a></li>
						<li><a href="ageAdmList">연령대 관리</a></li>
						<li><a href="campingAdmList">캠핑장 관리</a></li>
						<li><a href="reviewAdmList">후기 관리</a></li>
						<li><a href="togetherAdmList">모집글 관리</a></li>
					</ul>
				</aside>
				<div>
					<h3>타이틀 수정</h3>
					<form action="/titleUpdate.do" method="post">
						<table>
							<tr>
								<th>타이틀 이름</th>
								<td><input type="hidden" name="mt_idx" value="${dto.mt_idx}">
								<input type="text" name="mt_name" value="${dto.mt_name }"></td>
							</tr>
							<tr>
								<th>기준 크루장 횟수</th>
								<td><input type="text" name="mt_count" value="${dto.mt_count }">회</td>
							</tr>
							<tr>
								<th>기준 모닥불 온도</th>
								<td><input type="text" name="mt_degree" value="${dto.mt_degree }">℃</td>
							</tr>
						</table>
						<input type="submit" value="수정">
						<input type="button" value="목록" onclick="location.href='/titleList.go'"/>
					</form>
				</div>
<%@ include file="/resources/inc/footer.jsp" %>
	<script></script>
</html>