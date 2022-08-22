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
					<h3>비밀번호 재설정</h3>
					<form action="pwRework.do" method="POST" onsubmit="return submitCheck()">
						<table>
							<tbody>
								<tr>
									<th>아이디</th>
									<td>${sessionScope.mb_id }</td>
								</tr>
					            <tr>
					                <th>새 비밀번호</th>
					                <td>
					                    <input type="password"  name="mb_pw" id = "pw" maxlength="20"/>  
					                </td>
					            </tr>
					            <tr>
					                <th>새 비밀번호 확인</th>
					                <td>
					                    <input type="password" id = "pwcheck" maxlength="20"/>
					                </td>
					            </tr>
					        </tbody>
					        <tfoot>
								<tr>
									<td colspan="2">
					            		<input type="submit" class="btn btnSubmit" value="비밀번호 재설정" />
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
			
			var regExpPw = /^(?=.*[a-zA-z])(?=.*[0-9])(?=.*[$`~!@$!%*#^?&\\(\\)\-_=+]).{4,20}$/;	//비밀번호 정규식
			
			var $pw = $('#pw');
			
			var $pwchk =  $('#pwcheck');
			
			if($.trim($pw.val()) == '') {
				window.alert("새 비밀번호를 입력해 주세요.");
				$pw.val('').focus();
				return false;
			}
			
			if(!regExpPw.test($pw.val())) {
				window.alert("비밀번호는 4~20자의 영문과 숫자, 특수문자를 포함해야 합니다. ");
				$pw.val('').focus();
				return false;
			}
			
			if($.trim($pwchk.val()) == '') {
				window.alert("새 비밀번호 확인을 입력해 주세요.");
				$pwchk.val('').focus();
				return false;
			}
			
			if(!regExpPw.test($pwchk.val())) {
				window.alert("비밀번호는 4~20자의 영문과 숫자, 특수문자를 포함해야 합니다. ");
				$pwchk.val('').focus();
				return false;
			}
			
			if($pw.val() != $pwchk.val()) {
				window.alert("비밀번호와 비밀번호 확인이 일치하지 않습니다. ");
				$pwchk.val('').focus();
				return false;
			}
			
			
		}
		
		var msg = "${msg}";
		if(msg != "") {
		alert(msg);
		}
		
	</script>
</html>