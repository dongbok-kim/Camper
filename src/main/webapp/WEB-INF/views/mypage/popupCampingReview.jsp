<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>캠핑장 후기 작성페이지</title>
<script src="//code.jquery.com/jquery-3.6.0.min.js"></script>
<style>
	table {
		border-collapse: collapse;
		border: 1px solid #787878;
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
	
	table tfoot tr td {
		text-align: center;
	}
	
	table td > textarea {
		padding: 10px;
		width: 99%;
		min-height: 180px;
		resize: none;
		overflow-y: scroll;
		box-sizing: border-box;
	}
	
	table tfoot tr td > .btn {
		padding: 5px 10px;
		cursor: pointer;
		outline: none;
		border: none;
	}
	
	table tfoot tr td > .btn.btnSubmit {
		color: #fff;
		background-color: #32405d;
	}
	
	table tfoot tr td > .btn.btnClose {
		background-color: #dbdbdb;
	}
</style>
</head>
<body>
	<form action="campingReviewWrite.do" method="post" name="campingReivewForm">
		<table>
			<tbody>
			<tr>
				<th>캠핑장명</th>
				<td>[${dto.ca_sido} ${dto.ca_sigungu}] ${dto.ca_name}
					<input type="hidden" name="ca_idx" value="${dto.ca_idx}"/>
					<input type="hidden" name="ct_idx" value="${dto.ct_idx}"/>
				</td>
			</tr>
			<tr>
				<th>캠핑 기간</th>
				<td>${dto.ct_wish_start} ~ ${dto.ct_wish_end}</td>
			</tr>
			<tr>
				<th>닉네임</th>
				<td>${nickname}</td>
			</tr>
			<tr>
				<th>캠핑장 평가</th>
				<td>
					<input type="radio" name="assessment" value="싫어요"/>싫어요
					<input type="radio" name="assessment" value="보통"/>보통
					<input type="radio" name="assessment" value="좋아요"/>좋아요
				</td>
			</tr>
			<tr>
				<th>내용</th>
				<td><textarea name="content"></textarea></td>
			</tr>
			</tbody>
			<tfoot>
				<tr>
					<td colspan="2">
						<input type="button" class="btn btnSubmit" value="등록" onclick="radioChk()"/>
						<input type="button" class="btn btnClose" value="닫기" onclick="window.close();"/>
					</td>
				</tr>
			</tfoot>
		</table>
	</form>
</body>
<script>
	
	function radioChk(){
		
		var form = document.campingReivewForm;
		
		if ($('input[type=radio][name="assessment"]:checked').val()) {
			form.submit();
		} else {
			alert('캠핑장 평가 항목을 선택해주세요.');
		}
	}
	
</script>
</html>