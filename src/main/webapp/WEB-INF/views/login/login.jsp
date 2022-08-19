<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="/resources/inc/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 페이지</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<style></style>
</head>
<body>
     <div> 
            <form action="login.do" method="POST" onsubmit="return submitCheck()">
                <div>
                    <input type="text" name="id" id="id" placeholder="아이디"/>
                    <input type="password" name="pw" id="pw" placeholder="비밀번호"/>
                </div>
                <div>
                    <input type="submit" id="login" value="로그인" />
                    <input type="button" id="join" value="회원가입" onclick="location.href='join.go'"/>
                    <!-- 회원 가입 들어가는 링크 -->
                </div>
                <div>
                       <input type="button" id="idFind" value="아이디 찾기" onclick="location.href='idFind.go'"/> 
                        || 
                       <input type="button" id="pwFind" value="비밀번호 찾기" onclick="location.href='pwFind.go'"/>
                   </div>
            </form>
        </div>
</body>
<%@ include file="/resources/inc/footer.jsp" %>
<script>
function submitCheck() {
	
	var id = $('#id').val();
	// console.log(id);
	
	var pw = $('#pw').val();
	// console.log(pw);
	
	//문자열에 공백이 있는 경우
	var blank_pattern = /[\s]/g;
	// if( blank_pattern.test(str) == true){
	   // alert('공백이 입력되었습니다.');
	// }
	
	var pattern1 = /[0-9]/;				// 숫자
	var pattern2 = /[a-zA-Z]/;	 //영문 포함
	var pattern3 = /[~!@#$%^&*()_+|<>?:{}]/;	// 특수문자
	
	if( id == "" || id == null ) {
		alert('아이디를 입력해 주세요');
		return false;
	} else if (blank_pattern.test(id)) {		//공백이있는지 체크하는 문
		alert('아이디에 공백이 있습니다.');
		return false;
	} else if (!pattern2.test(id)){
		alert('아이디는 영문을 포함해야 합니다');
		return false;
	} else if( pw == "" || pw == null ) {
		alert('비밀번호를 입력해 주세요');
		return false;
	} else if (blank_pattern.test(pw)) {    
		alert('비밀번호에 공백이 있습니다.');
		return false;
	} else if(!pattern1.test(pw) || !pattern2.test(pw) || !pattern3.test(pw) || pw.length < 4) {
		alert("비밀번호는 영문 , 숫자 , 특수문자를 포함 4자리 이상 입니다.");
		return false;
	}
	
	
	
	else {
		return true;
	}
	
	
	
}



	var msg = "${msg}"
    if (msg != "") {
        alert(msg);
    }
</script>
</html>