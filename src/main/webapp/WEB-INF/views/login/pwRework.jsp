<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="/resources/inc/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 재설정</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<style></style>
</head>
<body>
	<h3>비밀번호 재설정</h3>
	<form action="pwRework.do" method="POST" onsubmit="return submitCheck()">
	<table>
			<tr>
				<th>회원님의 아이디 : ${sessionScope.mb_id }</th>
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
			<tr>
				<th>
					<br/> <br/>
            		<input type="submit" value="비밀번호 재설정" />
           		 	<input type="button" value="취소" onclick="location.href='login.go'" />
            	</th>
			</tr>         
        </table>
        </form>
</body>
<%@ include file="/resources/inc/footer.jsp" %>
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