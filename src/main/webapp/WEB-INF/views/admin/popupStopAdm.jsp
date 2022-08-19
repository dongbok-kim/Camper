<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 정지</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<style></style>
</head>
<body>
	<form action="stopAdmReg.do" method="post" name="crewfm">
		<table>
			<tr>
				<th>회원아이디</th>
				<td><input type="hidden" name="mb_id" value="${mb_id }"/>${mb_id }</td>
				<th>정지 관리자</th>
				<td>${sessionScope.loginId}</td>
			</tr>
			<tr>
				<th>정지사유</th>
				<td colspan="3">
				<c:choose>
					<c:when test="${list.size() >= 3}">영구정지 회원입니다.</c:when>
					<c:otherwise><textarea name="ms_reason" id="ms_reason"></textarea></c:otherwise>
				</c:choose>
				</td>
			</tr>
			</table>
		<c:choose>
			<c:when test="${list.size() >= 3}"></c:when>
			<c:otherwise><input type="button" onclick="stopMember()" value="저장"/></c:otherwise>
		</c:choose>
	</form>
		<h3><strong>${mb_id }</strong> 님에 대한 정지 기록 </h3>
		<table>
			<tr>
				<th>번호</th>
				<th>이름</th>
				<th>닉네임</th>
				<th>정지사유</th>
				<th>정지 시킨 관리자</th>
				<th>정지기간</th>
				<th>정지누적횟수</th>
			</tr>
			<c:forEach items="${list}" var="stop" varStatus="i">
				<tr>
					<td>${i.index + 1}</td>
					<td>${stop.mb_name}</td>
					<td>${stop.mb_nickname}</td>
					<td>${stop.ms_reason}</td>
					<td>${stop.ms_admin_id}</td>
					<td>${stop.ms_start_date}-${stop.ms_end_date }</td>
					<td>${stop.ms_count}</td>
				</tr>
			</c:forEach>
		</table>
		<input type="button" value="닫기" onclick="popupClose()"/>
</body>
<script>

function stopMember(){
	if(document.getElementById("ms_reason").value == ""){
		alert("정지 사유를 입력하세요.");
		return false;
	} else {
		document.crewfm.submit();
		setTimeout(function() {
			window.opener.location.reload();
			window.close();
		}, 100);
	}
}

function popupClose(){
	window.opener.location.reload(); // 팝업창 닫을 때 부모창 새로고침
    window.close();
}

</script>
</html>