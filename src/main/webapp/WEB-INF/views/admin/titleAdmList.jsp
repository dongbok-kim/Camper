<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
				<div class="right admpg">
					<h3>타이틀 관리<a href="/titleAdd.go" class="btn btnWrite" style="float: right;">타이틀 추가</a></h3>
					<h4>총 타이틀 수 : <strong>${list.size()}</strong>건</h4>
					<table>
						<thead>
							<tr>
								<th>번호</th>
								<th>타이틀 이름</th>
								<th>기준 크루장 횟수</th>
								<th>기준 모닥불 온도</th>
								<th>수정</th>
							</tr>
						</thead>
						<tbody>
							<c:if test="${list.size() == 0}">
							<tr align="center" height="180">
								<td colspan="5">타이틀이 없습니다.</td>
							</tr>
							</c:if>
							<c:forEach items="${list}" var="tt" varStatus="i">
							<tr>
								<td align="center">${listCnt - skip - i.index}</td>
								<td>${tt.mt_name}</td>
								<td align="right">${tt.mt_count }회</td>
								<td align="right"><img src="../../resources/images/flame.png" alt="" /> ${tt.mt_degree }℃</td>
								<td align="center"><a href="/titleUpdate.go?idx=${tt.mt_idx}" class="btn btnModify">수정</a></td>
							</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
<%@ include file="/resources/inc/footer.jsp" %>
	<script></script>
</html>