<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 신고하기</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>



	<style>
	
	h3{
	text-align: center;
	
	}
	
	
	th{
	background-color:#DCDCDC;
	
	}
	
	

	</style>
	
	
	<body>
	
	
	
		
	
	<h3>회원 신고하기</h3>
	<form action="report.do" method="post" enctype="multipart/form-data" name="ReportForm">
		<table class="bbs">
			<tr>
				<th>신고자</th>
				<td><input type="hidden" name="rp_id" value="${myInfo.mb_id}"/>${myInfo.mb_nickname}</td>
			</tr>
			<tr>
				<th>신고대상 회원</th>
				<td><input type="hidden" name="mb_id" value="${repoInfo.mb_id}"/>${repoInfo.mb_nickname}</td>
			</tr>
			<tr>
				<th>신고 사유</th>
				<td><textarea cols="30" rows="15" id="rp_content" name="rp_content" placeholder="신고 사유를 입력해주세요"></textarea></td>
			</tr>
			<tr>
				<th>첨부파일</th>
				<td><input type="file" name="photos" multiple="multiple"/></td>
			</tr>
			
			<tr>
				<td><input type="button" onclick=report() value="신고"/></td>
			</tr>
			
		</table>
		
			
		
	</form>		
	</body>			

	<script>	

	function report() {
		
		var form = document.ReportForm;
		
		
		
		
		if (confirm("이 회원을 신고하시겠습니까?") == true){
			
			if($('#textarea').val() == null){
				alert('신고 사유를 적어주세요');
			} else {
				form.submit();
			}
										
		}
		
	}
	
	
	
	
	</script>
	
	
</html>