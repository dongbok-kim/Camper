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
				<td><input type="file" id="photos" name="photos" multiple="multiple" accept="image/*"/></td>
			</tr>
			
			<tr>
				<td><input type="button" onclick=report() value="신고"/></td>
			</tr>
			
		</table>
		
			
		
	</form>		
	</body>			

	<script>
	

	
	$("input[type=file]").bind( 'change', function (e)
	        {
	            if( !$(this).val() ) return;
	             
	            var f = this.files[0];
	            var size = f.size || f.fileSize;
	             
	            var limit = 2000000;
	                             
	            
	                         
	            if( size > limit ){
	                alert( '파일용량은 2mb 를 넘을수 없습니다.' );
	                $(this).val('');
	                return;
	            }
	                     
	        $(this).parent().find('input[type=text]').val( $(this).val() );
	})
	
	

	function report() {		
		var form = document.ReportForm;
							
		if (confirm("이 회원을 신고하시겠습니까?") == true){
													
			if (document.getElementById("rp_content").value == ''){				
				alert('신고 사유를 적어주세요');
			} else {
				console.log(document.getElementById("rp_content").value);
				form.submit();
				} 
			}														
	     }
	
	
	
	
	
	
	</script>
	
	
</html>