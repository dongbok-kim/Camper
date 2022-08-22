<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../../../resources/inc/header.jsp" %>
<style>
	#pwFindBox {
		margin: 120px auto 0 auto;
		max-width: 360px;
		width: 100%;
	}

	#pwFindBox > h3 {
		font-size: 36px;
		text-align: center;
	}
	
	#pwFindBox > form > table {
		border: 1px solid #787878;
	}
	
	#pwFindBox > form > table > tbody > tr > th {
		padding: 10px;
		border: 1px solid #787878;
		background-color: #f9f9f9;
	}
	
	#pwFindBox > form > table > tbody > tr > td {
		padding: 10px;
		border: 1px solid #787878;
	}
	
	#pwFindBox > form > table > tfoot > tr > td {
		padding: 10px;
		text-align: center;
	}
</style>
				<div id="pwFindBox">
					<h3>비밀번호 찾기</h3>
					<form action="pwFind.do" method="POST" onsubmit="return submitCheck()">
						<table>
							<tbody>
								<tr>
	                				<th>아이디</th>
	                				<td>
	                    				<input type="text"  name = "mb_id" id = "mb_id" maxlength="20" />  
	                				</td>
	            				</tr>
	            				<tr>
	                				<th>이메일</th>
	                				<td>
	                    				<input type="text"  name = "mb_email" id="mb_email" maxlength="30" />
	                				</td>
	            				</tr>
	            			</tbody>
	            			<tfoot>
	            				<tr>
	            					<td colspan="2">
	            						<input type="submit" class="btn btnSubmit" value="비밀번호 찾기"  />
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
			
			var $id = $('#mb_id');
			// console.log(id);
			
			var $email = $('#mb_email');
			// console.log(email);
			
			var regExpId = /^[0-9a-zA-Z\_]{4,20}$/;	//아이디 정규식
			
			var regExpEmail = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;	//이메일 정규식
			
			if($.trim($id.val()) == '') {
				window.alert("아이디를 입력해 주세요.");
				$id.val('').focus();
				return false;
			}
			
			if(!regExpId.test($id.val())) {
				window.alert("아이디는 4~20자의 영문과 숫자, _ 조합만 가능합니다.");
				$id.val('').focus();
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