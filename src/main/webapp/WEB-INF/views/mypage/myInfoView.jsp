<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="/resources/inc/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지 - 내정보 수정</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<style>
	aside {
    width: 30%;
    margin: 10px;
    padding: 20px;
    float: left;
}
	section {
	width: 70%;
	margin: 10px;
	padding: 20px;
	float: right;
}

	table {
		border: 2px solid; border-coollapse: collapse; text-align : left;
	}
	
	th, td { border : 1px solid; padding: 10px 5px;}
	
	th {background-color : gray; }
	
	input[type='text'] {width: 60%; }
</style>
</head>
<body>
	<aside>
					<ul>
						<li class="active"><a href="/mypageInfo.go">내 정보 수정</a></li>
						<li><a href="">찜한 캠핑장</a></li>
						<li><a href="">내가 쓴 모집글</a></li>
						<li><a href="">캠핑장 후기</a></li>
						<li><a href="">크루 후기</a></li>
						<li><a href="">참여한 크루 목록</a></li>
						<li><a href="">참여 중인 채팅방</a></li>
						<li><a href="">차단 회원</a></li>
						<li><a href="">1:1 문의</a></li>
					</ul>
	</aside>
	<section>
	<article>
	<h3>내 정보 수정</h3>
	<form action="" method="POST" onsubmit="return submitCheck()">
	<table>
		<tr>
                <th>아이디</th>
                <td>${myInfo.mb_id}</td>
                <td style="background-color: red ">정지</td>
                <td>0회</td>
            </tr>
            <tr>
                <th>현재 비밀번호</th>
                <td colspan="4">
                    <input type="password" name = "mb_pw" id="password" />
                    <input type="hidden" name = "mb_pw" id="hidden_password" value="${myInfo.mb_pw}"/>
                </td>
            </tr>
            <tr>
                <th>새 비밀번호</th>
                <td colspan="4">
                    <input type="password"  name = "newpassword" id = "newpassword"/>
                </td>
            </tr>
              <tr>
                <th>새 비밀번호 확인</th>
                <td colspan="4">
                    <input type="password"  name = "newpasswordcheck" id = "newpasswordcheck"/>
                </td>
            </tr>
            <tr>
            <th>이름</th>
                <td colspan="4">
                    ${myInfo.mb_name}
                </td>
            </tr>
            <tr>
                <th>닉네임</th>
                <td>
                <input type="text"  name = "mb_nickname" id="nickname" value="${myInfo.mb_nickname}"/>
                <input type="hidden"  name = "mb_nickname" id="hidden_nickname" value="${myInfo.mb_nickname}"/>
                </td>
                <td colspan="2">
                <input type="button" value="닉네임 중복 확인" onclick="doubleCheckNickname()" />
                <!-- 닉네임 중복 확인은 ajax 명령으로 -->
                </td>
            </tr>
            <tr>
                <th>성별</th>
                <td>
                  ${myInfo.mb_gender}
                </td>
                <td>연령대</td>
                <td>
                	<input type="hidden" name="ma_idx" value="${myInfo.ma_idx}" />
                   <input type="radio" name="ma_idx" value="1" /> 20대 
                   <input type="radio" name="ma_idx" value="2" /> 30대 
                   <input type="radio" name="ma_idx" value="3" /> 40대 
                   <input type="radio" name="ma_idx" value="4" /> 50대 
                   <input type="radio" name="ma_idx" value="5" /> 60대 
                </td>
            </tr>
            <tr>
                <th>이메일</th>
                <td>
                    <input type="email"  name = "mb_email" id="email" value="${myInfo.mb_email}"/>
                    <input type="hidden"  name = "mb_email" id="hidden_email" value="${myInfo.mb_email}"/>
                </td>
                <td colspan="2">
                    <input type="button" value="이메일 중복 확인" onclick="doubleCheckEmail()" />
                    <!-- 이메일 중복 확인은 ajax 명령으로 -->
                </td>
            </tr>
            <tr>
            	<th>주소</th>
                <td colspan="4">
                <input type="text" id="sample6_postcode" name="mb_postcode" placeholder="우편번호" style="width:100px" value="${myInfo.mb_postcode}">
				<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
				<input type="text" id="sample6_address" name="mb_addr_default" placeholder="주소" value="${myInfo.mb_addr_default}"><br>
				<input type="text" id="sample6_detailAddress" name="mb_addr_detail" placeholder="상세주소" value="${myInfo.mb_addr_detail}">
				
				<!-- 값을 받아와야되기때문에 hidden 으로 처리 -->
				<input type="hidden" id="sample6_extraAddress" name="sample6_extraAddress" placeholder="참고항목">
				
				<input type="hidden" id="sample6_sido" name="mb_sido" > <!-- 시/도 -->
				<input type="hidden" id="sample6_sigungu" name="mb_sigungu" > <!-- 시/군/구 -->
				</td>
            </tr>
            <tr>
            	<th>모닥불 온도</th>
            	<td>${myInfo.mb_fire} ℃</td>
            	<td style="background-color: gray ">타이틀</td>
            	<td>왕초보</td><!-- 나중에 타이틀 해나야됨 -->
            </tr>
	</table>
	<br/>
	<input type="submit" value="완료" />
	<br/>
	</form>
	<h3>회원탈퇴</h3>
	<form action="" onsubmit="return submitCheck()">
	<h5>탈퇴 안내</h5>
	탈퇴 후 같은 아이디로 재 가입을 하실 수 없습니다.<br/>
	탈퇴하시려면, 비밀번호를 입력 후 완료 버튼을 눌러주세요.
	<br/><br/>
	<table>
		<tr>
			<th>아이디</th>
			<td>${myInfo.mb_id}</td>
		</tr>
		<tr>
			<th>비밀번호</th>
			<td>
				<input type="password" name = "mb_pw" id="secession_password" />
			</td>
		</tr>
	</table> <br/>
	<input type="submit" value="탈퇴" />
	</form>
	</article>
	</section>
</body>
<script>
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
            // console.log(data.zonecode);
            document.getElementById("sample6_address").value = addr;
            // console.log(addr);
            // 커서를 상세주소 필드로 이동한다.
            document.getElementById("sample6_detailAddress").focus();
            
          
           // console.log(data.sido);  // 시/도 (서울, 경기, 경북 등으로 표시)
            document.getElementById('sample6_sido').value = data.sido; //우편번호 찾으면 시/도에 값입력
            
           // console.log(data.sigungu); // 시/군/구 (서초구, 광명시 , 곡성군 등으로 표시)
            document.getElementById('sample6_sigungu').value = data.sigungu; //우편번호 찾으면 시/군/구에 값입력
            
            
        }
    }).open();
}


	// console.log($("input[name='ma_idx']").val());

if($("input[name='ma_idx']").val() == 1 ) {
	$("input:radio[name='ma_idx']:radio[value='1']").attr("checked" , true);
}

if($("input[name='ma_idx']").val() == 2 ) {
	$("input:radio[name='ma_idx']:radio[value='2']").attr("checked" , true);
}

if($("input[name='ma_idx']").val() == 3 ) {
	$("input:radio[name='ma_idx']:radio[value='3']").attr("checked" , true);
}

if($("input[name='ma_idx']").val() == 4 ) {
	$("input:radio[name='ma_idx']:radio[value='4']").attr("checked" , true);
}

if($("input[name='ma_idx']").val() == 5 ) {
	$("input:radio[name='ma_idx']:radio[value='5']").attr("checked" , true);
}

</script>
</html>