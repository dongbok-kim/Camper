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
        <table>
            <tr>
                <th>아이디</th>
                <td>
                    <input type="id"  id = "id"/>  
                </td>
            </tr>
            <tr>
                <th>이메일</th>
                <td>
                    <input type="email"  id = "email"/>
                </td>
            </tr>
        </table>

        <div>
            <input type="button" value="아이디, 이메일 확인" onclick="###()" />
            <!-- 회원 아이디, 이메일이 이치하는지 확인 -->
        </div>

        <br/><br/>

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
                    <input type="passwordcheck" id = "passwordcheck"/>
                </td>
            </tr>
        </table>
        <div>
            <input type="submit" value="비밀번호 재설정" onclick="">
            <!-- 로그인 페이지 링크 -->
        </div>
</body>
<script>
</script>
</html>