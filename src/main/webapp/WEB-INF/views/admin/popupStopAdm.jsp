<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>회원 정지</title>
		<script src="//code.jquery.com/jquery-3.6.0.min.js"></script>
		<style>
			table {
				width: 100%;
				border-collapse: collapse;
				border: 1px solid #787878;
			}
			
			textarea {
				padding: 10px;
				width: 99%;
				min-height: 180px;
				resize: none;
				overflow-y: scroll;
				box-sizing: border-box;
			}
			
			table th {
				padding: 10px;
				border: 1px solid #787878;
				background-color: #f9f9f9;
			}
			
			table td {
				padding: 10px;
				border: 1px solid #787878;
			}
			
			.btn {
				padding: 5px 10px;
				cursor: pointer;
				outline: none;
				border: none;
			}
			
			.btn.btnSave {
				color: #fff;
				background-color: #32405d;
			}
			.btn.btnClose {
				background-color: #dbdbdb;
			}
		</style>
	</head>
	<body>
		<form action="stopAdmReg.do" method="post" name="crewfm">
			<table>
				<tbody>
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
				</tbody>
				<tfoot>
					<tr align="center">
						<td colspan="4">
							<c:choose>
								<c:when test="${list.size() >= 3}"></c:when>
								<c:otherwise><input type="button" class="btn btnSave" onclick="stopMember()" value="저장"/></c:otherwise>
							</c:choose>							
						</td>
					</tr>
				</tfoot>
			</table>
		</form>
		<h3><strong>${mb_id }</strong> 님에 대한 정지 기록 </h3>
		<table>
			<thead>
				<tr>
					<th>번호</th>
					<th>이름</th>
					<th>닉네임</th>
					<th>정지사유</th>
					<th>정지 시킨 관리자</th>
					<th>정지기간</th>
					<th>정지누적횟수</th>
				</tr>
			</thead>
			<tbody>
			<c:if test="${list.size() eq 0}">
				<tr align="center" height="180">
					<td colspan="7">
						정지 기록이 없습니다
					</td>
				</tr>
			</c:if>
			<c:forEach items="${list}" var="stop" varStatus="i">
				<tr>
					<td align="center">${i.index + 1}</td>
					<td align="center">${stop.mb_name}</td>
					<td align="center">${stop.mb_nickname}</td>
					<td>${stop.ms_reason}</td>
					<td align="center">${stop.ms_admin_id}</td>
					<td align="center">${stop.ms_start_date}-${stop.ms_end_date }</td>
					<td align="right">${stop.ms_count}회</td>
				</tr>
			</c:forEach>
			</tbody>
		</table>
		<p align="center">
			<input type="button" class="btn btnClose" value="닫기" onclick="popupClose()"/>
		</p>
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