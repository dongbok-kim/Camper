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
            <form action="/login.do" method="POST">
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
	var msg = "${msg}"
    if (msg != "") {
        alert(msg);
    }
</script>
</html>