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
                <th>비밀번호 재설정</th>
                <td>
                    <input type="password"  name="mb_pw" id = "pw"/>  
                </td>
            </tr>
            <tr>
                <th>비밀번호 확인</th>
                <td>
                    <input type="password" id = "pwcheck"/>
                </td>
            </tr>
        </table>
            <input type="submit" value="비밀번호 재설정" >
            <input type="button" value="취소" onclick="location.href='login.go'" />
        </form>
</body>
<script>
function submitCheck() {
	
	var pw = $('#pw').val();
	// console.log(pw);
	
	var pwchk =  $('#pwcheck').val();
	// console.log(pwchk);
	
	
	//문자열에 공백이 있는 경우
	var blank_pattern = /[\s]/g;
	// if( blank_pattern.test(str) == true){
	   // alert('공백이 입력되었습니다.');
	// }
	
	var pattern1 = /[0-9]/;				// 숫자
	var pattern2 = /[a-zA-Z]/;			// 문자
	var pattern3 = /[~!@#$%^&*()_+|<>?:{}]/;	// 특수문자
	
	
	if( pw == "" || pw == null ) {
		alert('비밀번호 재설정 을 입력해 주세요');
		return false;
	}  else if (blank_pattern.test(pw)) {		//공백이있는지 체크하는 문
		alert('비밀번호 재설정 에 공백이 있습니다.');
		return false;
	} else if( pwchk == "" || pwchk == null ) {
		alert('비밀번호 확인 을 입력해 주세요');
		return false;
	}  else if (blank_pattern.test(pwchk)) {		//공백이있는지 체크하는 문
		alert('비밀번호 확인 에 공백이 있습니다.');
		return false;
	} else if (pw != pwchk) {
		alert('비밀번호와 비밀번호 확인이 일치하지 않습니다.');
		return false;
	} else if(!pattern1.test(pw) || !pattern2.test(pw) || !pattern3.test(pw) || pw.length < 4) {
		alert("비밀번호는 영문 , 숫자 , 특수문자를 포함 4자리 이상 입니다.");
		return false;
	} else {
		return true;
	}
	

	
}

var msg = "${msg}";
if(msg != "") {
alert(msg);
}

</script>
</html>