<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="/resources/inc/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기 페이지</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<style></style>
</head>
<body>
	<h3>ID 찾기</h3>
		<form action="idFind.do" method="POST" onsubmit="return submitCheck()">
		<table>
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
		</table>
		<div>
			<br/>
			<input type="submit" value="ID찾기" />
			<!-- 아이디찾기 명령어-->
			<input type="button" value="취소" onclick="location.href='login.go'" />
			<!-- 로그인 페이지 링크 -->
		</div>
		</form>
</body>
<%@ include file="/resources/inc/footer.jsp" %>
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