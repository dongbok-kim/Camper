<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

	<body>
	
		
	
	<h3>회원 신고하기</h3>
	<form action="report.do" method="post" enctype="multipart/form-data">
		<table class="bbs">
			<tr>
				<th>신고자</th>
				<td><input type="hidden" name="rp_id" value="${nickname2.mb_id}"/>${nickname2.mb_nickname}</td>
			</tr>
			<tr>
				<th>신고대상 회원</th>
				<td><input type="hidden" name="mb_id" value="${nickname.mb_id}"/>${nickname.mb_nickname}</td>
			</tr>
			<tr>
				<th>신고 사유</th>
				<td><textarea id="rp_content" name="rp_content"></textarea></td>
			</tr>
			<tr>
				<th>첨부파일</th>
				<td><input type="file" name="photos" multiple="multiple"/></td>
			</tr>
			<tr>
				<th>
					<input type="submit" onclick=report() value="신고"/>					
				</th>
			</tr>
		</table>
	</form>		
	</body>			

	<script>	

	function report() {
		if (confirm("이 회원을 신고하시겠습니까?") == true){
						
			var text = $('#rp_content').val();
			
			if(text != '') {
				location.href='report.do';
			} else {
				alert('신고 사유를 적어주세요.');
			}
			
			
		}
	}
	
	
	
	
	</script>
	
	
</html>