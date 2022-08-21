<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="/resources/inc/header.jsp" %>
<body>
<aside>
		<h2>관리자페이지</h2>
		<ul>
			<li><a href="/memberAdmList.go">회원 관리</a></li>
			<li><a href="/reportAdmList.go">신고 관리</a></li>
			<li><a href="/stopAdmList.go">정지 회원 관리</a></li>
			<li><a href="/blindAdmList.go">블라인드 관리</a></li>
			<li class="active"><a href="/answerAdmList.go">1:1문의 관리</a></li>
			<li><a href="/titleList.go">타이틀 관리</a></li>
			<li><a href="/ageAdmList.go">연령대 관리</a></li>
			<li><a href="/campingAdmList.go">캠핑장 관리</a></li>
			<li><a href="/reviewAdmList.go">후기 관리</a></li>
			<li><a href="/togetherAdmList.go">모집글 관리</a></li>
		</ul>
	</aside>
	<div>
		<h3>문의글 상세보기</h3>
	</div>
	<div>
	<form action="answerReg.do" method="post" name="answerfm">
		<table>
			<tr>
				<th colspan="6">${answer.in_title}</th>
			</tr>
			<tr>
				<th>작성자</th>
				<td colspan="2">${answer.mb_id}</td>
				<th>등록일시</th>
				<td colspan="2">${answer.in_datetime}</td>
			</tr>
			<tr>
				<td colspan="6">
				${answer.in_content }
				<input type="hidden" name="in_idx" value="${answer.in_idx }"/>
				</td>
			</tr>
			<tr>
				<th>답변자 아이디</th>
				<td>
					<c:if test="${answer.in_status == ('답변완료') }">${answer.ia_admin }</c:if>
				</td>
				<th>답변 일자</th>
				<td>
					<c:if test="${answer.in_status == ('답변완료') }">${answer.ia_datetime }</c:if>
				</td>
				<th>답변상태</th>
				<td>
					<c:choose>
						<c:when test="${answer.in_status == '답변완료'}">답변완료</c:when>
						<c:otherwise>
							<select name="in_status" id="in_status">
									<option value="답변대기" ${answer.in_status == '답변대기' ? 'selected="selected"':'' }>답변대기</option>
									<option value="처리중" ${answer.in_status == '처리중' ? 'selected="selected" ':'' }>처리중</option>
									<option value="답변완료" >답변완료</option>						
							</select>
						</c:otherwise>
					</c:choose>
				</td>
			</tr>
			<tr>
				<th>답변내용</th>
				<td colspan="5">
					<!-- 답변상태 -->
					<c:if test="${answer.in_status == ('답변완료') }">${answer.ia_content }</c:if>
					<c:if test="${answer.in_status != ('답변완료') }">
						<textarea name="ia_content" id="content"></textarea>
					</c:if>
				</td>
			</tr>
			
		</table>
		<c:if test="${answer.in_status != ('답변완료') }"><input type="button" onclick=reg() value="완료"></c:if>
		<input type="button" onclick="location.href='/answerAdmList.go' " value="목록">
	</form>
	</div>
<%@ include file="/resources/inc/footer.jsp" %>
</body>
<script>
function reg() {
	if (confirm("답변을 등록하시겠습니까?") == true){
		if ($("#in_status").val() == "처리중"){
			if($('#content').val() != ""){
				alert("답변 상태를 다시 확인하세요.");
			} else {
				document.answerfm.submit();
			}
		} else {
			if($('#content').val() != ""){
				document.answerfm.submit();
			} else {
				alert("답변 내용을 입력하세요.");
			}
		}
	}
}
</script>
</html>