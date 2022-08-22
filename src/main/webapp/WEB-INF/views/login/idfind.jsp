<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../../../resources/inc/header.jsp" %>
<style>
	#idFindBox {
		margin: 120px auto 0 auto;
		max-width: 360px;
		width: 100%;
	}

	#idFindBox > h3 {
		font-size: 36px;
		text-align: center;
	}
	
	#idFindBox > form > table {
		border: 1px solid #787878;
	}
	
	#idFindBox > form > table > tbody > tr > th {
		padding: 10px;
		border: 1px solid #787878;
		background-color: #f9f9f9;
	}
	
	#idFindBox > form > table > tbody > tr > td {
		padding: 10px;
		border: 1px solid #787878;
	}
	
	#idFindBox > form > table > tfoot > tr > td {
		padding: 10px;
		text-align: center;
	}
</style>
				<div id="idFindBox">
					<h3>아이디 찾기</h3>
					<form action="idFind.do" method="POST" onsubmit="return submitCheck()">
						<table>
							<tbody>
								<tr>
									<th>이름</th>
									<td>
										<input type="text"  name = "name" id = "name" maxlength="20" />  
									</td>
								</tr>
								<tr>
									<th>이메일</th>
									<td>
										<input type="text"  name = "email" id = "email" maxlength="30"/>
									</td>
								</tr>
							</tbody>
							<tfoot>
								<tr>
									<td colspan="2">
										<input type="submit" class="btn btnSubmit" value="아이디 찾기" />
										<input type="button" class="btn btnList" value="취소" onclick="location.href='login.go'" />
									</td>
								</tr>
							</tfoot>
						</table>
					</form>
				</div>
<%@ include file="../../../resources/inc/footer.jsp" %>
	<script>
		function submitCheck() {
			
			var regExpId = /^[0-9a-zA-Z\_]{4,20}$/;	//아이디 정규식
			
			var regExpEmail = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;	//이메일 정규식
			
			var $name = $('#name');
			
			var $email = $('#email');
			
			if($.trim($name.val()) == '') {
				window.alert("이름를 입력해 주세요.");
				$name.val('').focus();
				return false;
			}
			
			if($.trim($email.val()) == '') {
				window.alert("이메일을 입력해 주세요.");
				$email.val('').focus();
				return false;
			}
			
			if(!regExpEmail.test($email.val())) {
				window.alert("이메일 형식에 맞게 입력해 주세요. ");
				$email.val('').focus();
				return false;
			}
		
			
		}
		
		var msg = "${msg}"
		if (msg != "") {
			alert(msg);
		}
	</script>
</html>