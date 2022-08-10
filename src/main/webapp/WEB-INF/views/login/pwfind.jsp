<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
		<form action="pwFind.do" method = "post">
			<table>
            <tr>
                <th>아이디</th>
                <td>
                    <input type="text"  name = "mb_id"/>  
                </td>
            </tr>
            <tr>
                <th>이메일</th>
                <td>
                    <input type="email"  name = "mb_email"/>
                </td>
            </tr>
        </table>

        <div>
            <input type="submit" value="아이디, 이메일 확인" onclick="###()" />
            <!-- 회원 아이디, 이메일이 이치하는지 확인 -->
        </div>
		</form>
        <br/><br/>

		<form action="pwRework.do">
        <table>
            <tr>
                <th>비밀번호 재설정</th>
                <td>
                    <input type="password"  id = "password"/>  
                </td>
            </tr>
            <tr>
                <th>비밀번호 확인</th>
                <td>
                    <input type="password" id = "passwordcheck"/>
                </td>
            </tr>
        </table>
        <div>
            <input type="submit" value="비밀번호 재설정" onclick="'location.href=/login.go'">
            <!-- 로그인 페이지 링크 -->
        </div>
        </form>
</body>
<script>

function submitCheck() {
	
	var pattern1 = /[0-9]/;				// 숫자
	var pattern2 = /[a-zA-Z]/;			// 문자
	var pattern3 = /[~!@#$%^&*()_+|<>?:{}]/;	// 특수문자
	
	
	
}

</script>
</html>