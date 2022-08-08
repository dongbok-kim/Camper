<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 가입 페이지</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<style></style>
</head>
<body>
	 <h3>회원 가입</h3>
        <table>
            <tr>
                <th>아이디</th>
                <td>
                    <input type="id" id = "id"/>
                    <input type="button" value="아이디 중복 확인" onclick="아이디중복확인.ajax" />
                    <!-- 아이디 중복 확인은 ajax 명령으로 -->
                </td>
            </tr>
            <tr>
                <th>비밀번호</th>
                <td>
                    <input type="password"  id = "password"/>
                </td>
            </tr>
            <tr>
                <th>비밀번호 확인</th>
                <td>
                    <input type="passwordcheck"  id = "passwordcheck"/>
                </td>
            </tr>
            <tr>
                <th>이메일</th>
                <td>
                    <input type="email"  id = "email" />
                    <input type="button" value="이메일 중복 확인" onclick="이메일중복확인.ajax" />
                    <!-- 이메일 중복 확인은 ajax 명령으로 -->
                </td>
            </tr>
            <tr>
                <th>닉네임</th>
                <td>
                <input type="nickname"  id = "nickname"/>
                <input type="button" value="닉네임 중복 확인" onclick="닉네임중복확인.ajax" />
                <!-- 닉네임 중복 확인은 ajax 명령으로 -->
                </td>
            </tr>
            <tr>
                <th>이름</th>
                <td>
                    <input type="name"  id = "name"/>
                </td>
                <th>성별</th>
                <td>
                   남 <input type="radio" value="남" id = "male" />
                   여 <input type="radio" value="여" id = "female" />
                </td>
            </tr>
            <tr>
                <th>연령대</th>
                <td>
                   20대 <input type="radio" value="age" id = "age20" />
                   30대 <input type="radio" value="age" id = "age30" />
                   40대 <input type="radio" value="age" id = "age40" />
                   50대 <input type="radio" value="age" id = "age50" />
                   60대 <input type="radio" value="age" id = "age60" />
                </td>
            </tr>
            <tr>
                <th>주소</th>
                <!-- 다음 위치정보  api 활용 -->
            </tr>
        </table>
        <input type="submit" value="회원가입" onclick="" /> <!-- form태그추거해야됨 -->
        <input type="button" value="취소" onclick="location.href='login.go'" />
</body>
<script>
//라디오 버튼 클릭시 선택헤제 명령어 만들어야됨
// 라디오 버튼 이 선택된것만 값이 넘어가게 만들어야됨(성별은 남아니면여? 연령대는 다되나)
</script>
</html>