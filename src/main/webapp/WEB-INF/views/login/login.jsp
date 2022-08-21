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
                    <input type="text" name="id" id="id" placeholder="아이디" maxlength="20"/>
                    <input type="password" name="pw" id="pw" placeholder="비밀번호" maxlength="20"/>
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
	
	var $id = $('#id');
	var $pw = $('#pw');
	
	var regExpId = /^[0-9a-zA-Z\_]{4,20}$/;	//아이디 정규식
	
	var regExpPw = /^(?=.*[a-zA-z])(?=.*[0-9])(?=.*[$`~!@$!%*#^?&\\(\\)\-_=+]).{4,20}$/;	//비밀번호 정규식
	
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
	
	if($.trim($pw.val()) == '') {
		window.alert("비밀번호를 입력해 주세요.");
		$pw.val('').focus();
		return false;
	}
	
	if(!regExpPw.test($pw.val())) {
		window.alert("비밀번호는 4~20자의 영문과 숫자, 특수문자를 포함해야 합니다. ");
		$pw.val('').focus();
		return false;
	}
	
	
	
	
}

	var msg = "${msg}"
    if (msg != "") {
        alert(msg);
    }
</script>
</html>