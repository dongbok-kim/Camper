<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 가입 페이지</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<style></style>
</head>
<body>
	 <h3>회원 가입</h3>
	 	<form action="join.do" method="POST">
        <table>
            <tr>
                <th>아이디</th>
                <td>
                    <input type="id" name = "id" value="" />
                    <input type="button" value="아이디 중복 확인" onclick="아이디중복확인.ajax" />
                    <!-- 아이디 중복 확인은 ajax 명령으로 -->
                </td>
            </tr>
            <tr>
                <th>비밀번호</th>
                <td>
                    <input type="password"  name = "password"/>
                </td>
            </tr>
            <tr>
                <th>비밀번호 확인</th>
                <td>
                    <input type="passwordcheck"  name = "passwordcheck"/>
                </td>
            </tr>
            <tr>
                <th>이메일</th>
                <td>
                    <input type="email"  name = "email" />
                    <input type="button" value="이메일 중복 확인" onclick="이메일중복확인.ajax" />
                    <!-- 이메일 중복 확인은 ajax 명령으로 -->
                </td>
            </tr>
            <tr>
                <th>닉네임</th>
                <td>
                <input type="nickname"  name = "nickname"/>
                <input type="button" value="닉네임 중복 확인" onclick="닉네임중복확인.ajax" />
                <!-- 닉네임 중복 확인은 ajax 명령으로 -->
                </td>
            </tr>
            <tr>
                <th>이름</th>
                <td>
                    <input type="name"  name = "name" />
                </td>
                <th>성별</th>
                <td>
                 <input type="radio" value="남" name = "gender" /> 남 
                 <input type="radio" value="여" name = "gender" /> 여 
                </td>
            </tr>
            <tr>
                <th>연령대</th>
                <td>
                   <input type="radio" name="age" value="age20" /> 20대 
                   <input type="radio" name="age" value="age30"  /> 30대 
                   <input type="radio" name="age" value="age40"  /> 40대 
                   <input type="radio" name="age" value="age50"  /> 50대 
                   <input type="radio" name="age" value="age60"  /> 60대 
                </td>
            </tr>
            <tr>
            	<th>주소</th>
                <td>
                <input type="text" id="sample6_postcode" name="sample6_postcode" placeholder="우편번호">
				<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
				<input type="text" id="sample6_address" name="sample6_address" placeholder="주소"><br>
				<input type="text" id="sample6_detailAddress" name="sample6_detailAddress"placeholder="상세주소">
				
				<!-- 값을 받아와야되기때문에 hidden 으로 처리 -->
				<input type="hidden" id="sample6_extraAddress" name="sample6_extraAddress" placeholder="참고항목">
				
				<input type="hidden" id="sample6_sido" name="sample6_sido" > <!-- 시/도 -->
				<input type="hidden" id="sample6_sigungu" name="sample6_sigungu" > <!-- 시/군/구 -->
				</td>
            </tr>
        </table>
        
        <input type="submit" value="회원가입" />
        <input type="button" value="취소" onclick="location.href='login.go'" />
        </form>
</body>
<script>

	//다음 우편번호 관련 함수
	function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("sample6_extraAddress").value = extraAddr;
                
                } else {
                    document.getElementById("sample6_extraAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample6_postcode').value = data.zonecode;
                document.getElementById("sample6_address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("sample6_detailAddress").focus();
                
              
                // console.log(data.sido);  // 시/도 (서울, 경기, 경북 등으로 표시)
                document.getElementById('sample6_sido').value = data.sido;
                
                // console.log(data.sigungu); // 시/군/구 (서초구, 광명시 , 곡성군 등으로 표시)
                document.getElementById('sample6_sigungu').value = data.sigungu;
                
                
            }
        }).open();
    }

	
	var msg = "${msg}";
	if(msg != "") {
	alert(msg);
	}

</script>
</html>