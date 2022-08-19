<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="/resources/inc/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기 페이지</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<style></style>
</head>
<body>
	<h3>비밀번호 찾기</h3>
	<form action="pwFind.do" method="POST" onsubmit="return submitCheck()">
			<table>
            <tr>
                <th>아이디</th>
                <td>
                    <input type="text"  name = "mb_id" id = "mb_id"/>  
                </td>
            </tr>
            <tr>
                <th>이메일</th>
                <td>
                    <input type="text"  name = "mb_email" id="mb_email"/>
                </td>
            </tr>
        </table>
            <input type="submit" value="아이디 , 이메일 확인"  />
            <input type="button" value="취소" onclick="location.href='login.go'" />
        </form>        
</body>
<%@ include file="/resources/inc/footer.jsp" %>
<script>
function submitCheck() {
	
	var id = $('#mb_id').val();
	// console.log(id);
	
	var email = $('#mb_email').val();
	// console.log(email);
	
	
	//문자열에 공백이 있는 경우
	var blank_pattern = /[\s]/g;
	// if( blank_pattern.test(str) == true){
	   // alert('공백이 입력되었습니다.');
	// }
	
	
	if( id == "" || id == null ) {
		alert('아이디를 입력해 주세요');
		return false;
	} else if (blank_pattern.test(id)) {		//공백이있는지 체크하는 문
		alert('아이디에 공백이 있습니다.');
		return false;
	} else if( email == "" || email == null ) {
		alert('이메일을 입력해 주세요');
		return false;
	} else if (blank_pattern.test(email)) {    //이메일 input type text 로변경
		alert('이메일에 공백이 있습니다.');
		return false;
	} else if (email.indexOf('@') == -1) {
		alert('이메일에는 @ 를 포함해야합니다. ');
		return false;
	} else {
		return true;
	}
		
}

	var msg = "${msg}"
    if (msg != "") {
        alert(msg);
    }
</script>
</html>