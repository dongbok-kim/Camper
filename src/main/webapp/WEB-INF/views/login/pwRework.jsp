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
	<form action="" method="POST" onsubmit="return submitCheck()">
	<table>
            <tr>
                <th>비밀번호 재설정</th>
                <td>
                    <input type="password"  name="mb_pw" id = "password"/>  
                </td>
            </tr>
            <tr>
                <th>비밀번호 확인</th>
                <td>
                    <input type="password" id = "passwordcheck"/>
                </td>
            </tr>
        </table>
            <input type="submit" value="비밀번호 재설정" >
        </form>
</body>
<script>
</script>
</html>