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
	<form action="pwRework.do" method="POST" onsubmit="return submitCheck()">
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
            <input type="button" value="아이디 , 이메일 확인" onclick="IdEmailCheck()" />
            <!-- 회원 아이디, 이메일이 이치하는지 확인 -->
        </div>
        <br/><br/>

		
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
        <div>
            <input type="submit" value="비밀번호 재설정" >
            <!-- 로그인 페이지 링크 -->
        </div>
        </form>
</body>
<script>

var IdEmailcheck = false;//아이디 , 이메일 확인 체크여부

function IdEmailCheck() {
	
	var cnt = 0;
	
	//console.log(cnt);
	
	var mb_id = $('input[name=mb_id]').val();
	//console.log(mb_id);
	
	var mb_email = $('input[name=mb_email]').val();
	//console.log(mb_email);
	
	if (mb_id == "" || mb_email == "") {
		alert("값을 입력해 주세요");
	} else {
		
		$.ajax({
			type: 'get',
			url : 'pwFind.ajax',
			data : {
				mb_id : mb_id,
				mb_email : mb_email,
				Cnt : cnt
			},
			dataType: 'JSON',
			success:function(data) {
				//console.log(data);
				if(data.Cnt == 1){
					alert('비밀번호 변경 가능');
					 	IdEmailcheck = true;
				} else {
					alert('아이디 이메일이 일치하지 않습니다.');
				}
			},
			error:function(e) {
				console.log(e);
			}
		});
		
		
	}
	
	
}

function submitCheck() {
	
	var pattern1 = /[0-9]/;				// 숫자
	var pattern2 = /[a-zA-Z]/;			// 문자
	var pattern3 = /[~!@#$%^&*()_+|<>?:{}]/;	// 특수문자
	
	// console.log(IdEmailcheck);
	
	var password = $('#password').val();
	// console.log($('#password').val());
	
	var passwordcheck = $('#passwordcheck').val();
	// console.log($('#passwordcheck').val());
	
	
	if(IdEmailcheck == false) {
		alert('아이디, 이메일 확인을 진행해 주세요.');
		return false;
	} else if (password == "" || passwordcheck == "") {
		alert('비밀번호 재설정 비밀번호 확인 값을 입력해주세요.');
		return false;
	}else if (password != passwordcheck) {
		alert('비밀번호 재설정 과 비밀번호 확인이 일치하지 않습니다.');
		return false;
	}  else if(!pattern1.test(password) || !pattern2.test(password) || !pattern3.test(password) || password.length < 4) {
		alert("비밀번호는 영문 , 숫자 , 특수문자를 포함 4자리 이상 입니다.");
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