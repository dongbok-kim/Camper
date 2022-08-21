<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="/resources/inc/header.jsp" %>
<aside>
					<h2>마이 페이지</h2>
					<ul>
						<li class="active"><a href="/mypageInfo.go">내 정보 수정</a></li>
						<li><a href="/myCampingLikeList.go">찜한 캠핑장</a></li>
						<li><a href="/myCrewWriteList.go">내가 쓴 모집글</a></li>
						<li><a href="/myCampingReview.go">캠핑장 후기</a></li>
						<li><a href="/myCrewReviewR.go">크루 후기</a></li>
						<li><a href="/myCrewList.go">참여한 크루 목록</a></li>
						<li><a href="/myChatList.do">참여 중인 채팅방</a></li>
						<li><a href="/myBlockList.go">차단 회원</a></li>
						<li><a href="/myInquiryList.go">1:1 문의</a></li>
					</ul>
	</aside>
	<div>
	<h3>내 정보 수정</h3>
	</div>
<title>마이페이지 - 내정보 수정</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<style>
	table {
		border: 2px solid; border-coollapse: collapse; text-align : left;
	}
	
	th, td { border : 1px solid; padding: 10px 5px;}
	
	th {background-color : gray; }
	
	input[type='text'] {width: 60%; }
</style>
</head>
<body>
	<div>
	<form action="myInfoUpdate.do" method="POST" onsubmit="return submitCheck()">
	<table>
		<tr>
                <th>아이디</th>
                <td class="contextMenu contextMenuMember" data-id="${myInfo.mb_id}">${myInfo.mb_id}</td>
                <td style="background-color: red ">정지</td>
                <td>${stop} 회</td>
            </tr>
            <tr>
                <th>현재 비밀번호</th>
                <td colspan="4">
                    <input type="password" name = "orimb_pw" id="password" />
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
                <input type="hidden"  name = "hidden_nickname" id="hidden_nickname" value="${myInfo.mb_nickname}"/>
                <input type="hidden" id="doublecheckname" value="${myInfo.mb_nickname}"/>
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
                <th>연령대</th>
                <td>
                <c:forEach items="${list }" var="age">
                <input type="hidden" name="ma_idxradio" value="${myInfo.ma_idx}" >
            	<input type="radio" name="ma_idx" value="${age.ma_idx}" <c:if test="${myInfo.ma_idx eq age.ma_idx}">checked="checked"</c:if> />${age.ma_age } 대
            </c:forEach>
            	</td>
            </tr>
            <tr>
                <th>이메일</th>
                <td>
                    <input type="text"  name = "mb_email" id="email" value="${myInfo.mb_email}"/>
                    <input type="hidden"  name = "hidden_email" id="hidden_email" value="${myInfo.mb_email}"/>
                    <input type="hidden" id="doublecheckemail" value="${myInfo.mb_email}" />
                </td>
                <td colspan="2">
                    <input type="button" value="이메일 중복 확인" onclick="doubleCheckEmail()" />
                    <!-- 이메일 중복 확인은 ajax 명령으로 -->
                </td>
            </tr>
            <tr>
            	<th>주소</th>
                <td colspan="4">
                <input type="text" id="sample6_postcode" name="mb_postcode" placeholder="우편번호" style="width:100px" value="${myInfo.mb_postcode}" readonly>
				<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
				<input type="text" id="sample6_address" name="mb_addr_default" placeholder="주소" value="${myInfo.mb_addr_default}" readonly><br>
				<input type="text" id="sample6_detailAddress" name="mb_addr_detail" placeholder="상세주소" value="${myInfo.mb_addr_detail}">
				
				<!-- 값을 받아와야되기때문에 hidden 으로 처리 -->
				<input type="hidden" id="sample6_extraAddress" name="sample6_extraAddress" placeholder="참고항목">
				
				<input type="hidden" id="hidden_mb_sido" name="hidden_mb_sido" value="${myInfo.mb_sido }" >	<!-- 시/도 --> <!-- 원래 주소 -->
				<input type="hidden" id="hidden_mb_sigungu" name="hidden_mb_sigungu" value="${myInfo.mb_sigungu }"> <!-- 시/군/구 -->
				
				<input type="hidden" id="sample6_sido" name="mb_sido" > <!-- 시/도 -->	<!-- 주소찾기 했을때 입력되는값  -->
				<input type="hidden" id="sample6_sigungu" name="mb_sigungu" > <!-- 시/군/구 -->
				</td>
            </tr>
            <tr>
            	<th>모닥불 온도</th>
            	<td>${myInfo.mb_fire} ℃</td>
            	<td style="background-color: gray ">타이틀</td>
            	<td>
            	<c:if test="${title.mt_idx eq null }">
				타이틀 없음
				</c:if>
				${title.mt_name }
            	</td>
            </tr>
	</table>
	<br/>
	<input type="submit" value="완료" />
	<br/>
	</form>
	</div>
	<div>
	<h3>회원탈퇴</h3>
	</div>
	<div>
	<form action="secession.do" onsubmit="return submitCheck_two()">
	<h5>탈퇴 안내</h5>
	탈퇴 후 같은 아이디로 재 가입을 하실 수 없습니다.<br/>
	탈퇴하시려면, 비밀번호를 입력 후 완료 버튼을 눌러주세요.
	<br/>
	<table>
		<tr>
			<th>아이디</th>
			<td>${myInfo.mb_id}</td>
		</tr>
		<tr>
			<th>비밀번호</th>
			<td>
				<input type="password" name = "secession_pw" id="secession_password" />
			</td>
		</tr>
	</table> <br/>
	<input type="submit" value="탈퇴" /> <br/> <br/>
	</form>
	</div>
</body>
	<%@ include file="/resources/inc/footer.jsp" %>
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
            document.getElementById('sample6_sido').value = data.sido;
            
           // console.log(data.sigungu); // 시/군/구 (서초구, 광명시 , 곡성군 등으로 표시)
            document.getElementById('sample6_sigungu').value = data.sigungu;
            
            
        }
    }).open();
}

var checkEmail = false; // 이메일 중복체크 여부
function doubleCheckEmail() {
	
	//문자열에 공백이 있는 경우
	var blank_pattern = /[\s]/g;
	// if( blank_pattern.test(str) == true){
	   // alert('공백이 입력되었습니다.');
	// }
	
	var email = $("#email").val();
	// console.log($("#email").val());
	
	 if(email == "" || email == null){
         alert("이메일를 입력해주세요");
         return false;
      }
	 
	 if (blank_pattern.test(email)) {		// 공백 체크
			alert('이메일에 공백이 있습니다.');
			return false;
		} 
	 
	  if (email.indexOf('@') == -1) {
			alert('이메일에는 @ 를 포함해야합니다. ');
			return false;
		}
	 
	 console.log('이메일 중복 체크 : '+email);		
		$.ajax({
			type:'get',
			url:'myinfodoubleCheckEmail.ajax',
			data:{chkEmail:email},
			dataType:'JSON',
			success:function(data){
				// console.log(data);
			 if(data.doubleEmail){
					alert("이미 사용중인 이메일 입니다.");
				}else{
					alert("사용 가능한 이메일 입니다.");
					checkEmail = true;
					document.getElementById('doublecheckemail').value = email;
				}
				 
			},
			error:function(e){
				console.log(e);
			}			
		});
	
}



var checkNickname = false; // 닉네임 중복체크 여부
function doubleCheckNickname() {
	
	//문자열에 공백이 있는 경우
	var blank_pattern = /[\s]/g;
	// if( blank_pattern.test(str) == true){
	   // alert('공백이 입력되었습니다.');
	// }
	
	var nickname = $("#nickname").val();
	// console.log($("#nickname").val());
	
	 if(nickname == "" || nickname == null){
         alert("닉네임을 입력해주세요");
         return false;
      }
	 
	 if (blank_pattern.test(nickname)) {		//공백이있는지 체크하는 문
			alert('닉네임에 공백이 있습니다.');
			return false;
		} 
	 
	 console.log('닉네임 중복 체크 : '+nickname);		
		$.ajax({
			type:'get',
			url:'myinfodoubleCheckNickname.ajax',
			data:{chkNickname:nickname},
			dataType:'JSON',
			success:function(data){
				// console.log(data);
			 if(data.doubleNickname){
					alert("이미 사용중인 닉네임 입니다.");
				}else{
					alert("사용 가능한 닉네임 입니다.");
					checkNickname = true;
					document.getElementById('doublecheckname').value = nickname;
				}
				 
			},
			error:function(e){
				console.log(e);
			}			
		});
	
}




    
function submitCheck() {
	
	var pattern1 = /[0-9]/;				// 숫자
	var pattern2 = /[a-zA-Z]/;			// 문자
	var pattern3 = /[~!@#$%^&*()_+|<>?:{}]/;	// 특수문자
	
	var newpassword = $('#newpassword').val();
	var newpasswordcheck = $('#newpasswordcheck').val();
	
	if ($('#sample6_sido').val() == "") {
		document.getElementById('sample6_sido').value = $('#hidden_mb_sido').val();
	}
	
	if($('#sample6_sido').val() == "세종특별자치시") {
		document.getElementById('sample6_sigungu').value = "세종시";
	}
	
	if ($('#sample6_sigungu').val() == "") {
		document.getElementById('sample6_sigungu').value = $('#hidden_mb_sigungu').val();
	}
	
	
	if($('#email').val() == $('#hidden_email').val()) {
		checkEmail = true;
	}
	
	if($('#nickname').val() == $('#hidden_nickname').val()) {
		checkNickname = true;
	}
	
	var email = $('#email').val();
	
	var doublenickemail = $("#doublecheckemail").val();
	
	var nickname = $('#nickname').val();
	
	var doublenickname = $("#doublecheckname").val();
	
	if($('#password').val() == null || $('#password').val() == "" ) {	//원래 비밀번호 값을 누르지 않았을때
		alert('현재 비밀번호를 입력해 주세요');
		return false;
	}
	
	//현재 비밀번호 패턴 검사
	
	if (newpassword || newpasswordcheck) {
		
		//새 비밀번호 입력 여부 검사
		
		//새 비밀번호 패턴 검사
		
		//새 비밀번호 확인 입력 여부 검사
		
		//새 비밀번호 패턴 검사
		
		//새 비밀번호 와 새 비밀번호 확인 일치 여부 검사
		
	}
	
	
	
	if (newpassword != newpasswordcheck){
		alert('새 비밀번호와 새 비밀번호 확인이 일치하지 않습니다.');
		return false;
	} else if (newpassword !="" && (!pattern1.test(newpassword) || !pattern2.test(newpassword) || !pattern3.test(newpassword) || newpassword.length < 4)) {
		//비밀번호 변경 원할때
		alert("비밀번호는 영문 , 숫자 , 특수문자를 포함 4자리 이상 입니다.");
		return false;
	} else if (checkEmail == false) {
		 alert("이메일 중복확인을 진행해 주세요.");
		 return  false;
	} else if(doublenickemail != email) {
		 alert("닉네임 중복확인을 진행해 주세요.");
		 checkEmail = false;
		 // console.log(checkNickname);
		return false;
	} else if (checkNickname == false) {
		 alert("닉네임 중복확인을 진행해 주세요.");
		 return false;
	 } else 	if(doublenickname != nickname) {
		 alert("닉네임 중복확인을 진행해 주세요.");
		 checkNickname = false;
		 // console.log(checkNickname);
		return false;
	}	 
	
	
	
	
	
	
	
	
	
	
	else {
		
		// 확인창 출력
			if(confirm("수정하시겠습니까?") == true) {	//확인창 예를 눌렀을때
				return true;	
			} else {	// 확인창 취소 눌럿을때
				return false;
			}
	}
	
	
}






function submitCheck_two() {
	
	console.log($('#secession_password').val());
	
	if($('#secession_password').val() == null || $('#secession_password').val() == "") {
		alert("비밀번호를 입력해 주세요.");
		return false;
	} else {
		if(confirm("정말 탈퇴하시겠습니까?") == true) {
			return true;
		} else {
			return false;
		}
		
	}
	
	
	
}


	var msg = "${msg}"
    if (msg != "") {
        alert(msg);
    }
</script>
</html>