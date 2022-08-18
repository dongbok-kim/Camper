<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="/resources/inc/header.jsp" %>
				<aside>
					<h2>관리자페이지</h2>
					<ul>
						<li><a href="/memberAdmList.go">회원 관리</a></li>
						<li><a href="/reportAdmList.go">신고 관리</a></li>
						<li><a href="/stopAdmList.go">정지 회원 관리</a></li>
						<li><a href="/blindAdmList.go">블라인드 관리</a></li>
						<li><a href="/answerAdmList.go">1:1문의 관리</a></li>
						<li class="active"><a href="/titleList.go">타이틀 관리</a></li>
						<li><a href="/ageAdmList.go">연령대 관리</a></li>
						<li><a href="/campingAdmList.go">캠핑장 관리</a></li>
						<li><a href="/reviewAdmList.go">후기 관리</a></li>
						<li><a href="/togetherAdmList.go">모집글 관리</a></li>
					</ul>
				</aside>
				<div>
					<h3>타이틀 추가</h3>
					<form action="/titleAdd.do" method="post">
						<table>
							<tr>
								<th>타이틀 이름</th>
								<td><input type="text" name="mt_name"></td>
							</tr>
							<tr>
								<th>기준 크루장 횟수</th>
								<td><input type="text" name="mt_count">회</td>
							</tr>
							<tr>
								<th>기준 모닥불 온도</th>
								<td><input type="text" name="mt_degree">℃</td>
							</tr>
						</table>
						<input type="submit" value="추가">
						<input type="button" value="목록" onclick="location.href='/titleList.go'"/>
					</form>
				</div>
<%@ include file="/resources/inc/footer.jsp" %>
	<script></script>
</html>