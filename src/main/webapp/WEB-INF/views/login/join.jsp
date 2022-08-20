<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="/resources/inc/header.jsp" %>
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
	 	<form action="join.do" method="POST" onsubmit="return submitCheck()">
        <table>
            <tr>
                <th>아이디</th>
                <td>
                    <input type="text" name ="mb_id" id= "id" />
                    <input type="button" value="아이디 중복 확인" onclick="doubleCheckId()" />
                    <input type="hidden" id="doublecheckid" />
                    <!-- 아이디 중복 확인은 ajax 명령으로 -->
                </td>
            </tr>
            <tr>
                <th>비밀번호</th>
                <td>
                    <input type="password"  name = "mb_pw" id="password"/>
                </td>
            </tr>
            <tr>
                <th>비밀번호 확인</th>
                <td>
                    <input type="password"  name = "passwordcheck" id = "passwordcheck"/>
                </td>
            </tr>
            <tr>
                <th>이메일</th>
                <td>
                    <input type="text"  name = "mb_email" id="email"/>
                    <input type="button" value="이메일 중복 확인" onclick="doubleCheckEmail()" />
                    <input type="hidden" id="doublecheckemail" />
                    <!-- 이메일 중복 확인은 ajax 명령으로 -->
                </td>
            </tr>
            <tr>
                <th>닉네임</th>
                <td>
                <input type="text"  name = "mb_nickname" id="nickname"/>
                <input type="button" value="닉네임 중복 확인" onclick="doubleCheckNickname()" />
                <input type="hidden" id="doublecheckname" />
                <!-- 닉네임 중복 확인은 ajax 명령으로 -->
                </td>
            </tr>
            <tr>
                <th>이름</th>
                <td>
                    <input type="text"  name = "mb_name" id= "name"/>
                </td>
                <th>성별</th>
                <td>
                 <input type="radio" value="남" name = "mb_gender" /> 남 
                 <input type="radio" value="여" name = "mb_gender" /> 여 
                </td>
            </tr>
            <tr>
                <th>연령대</th>
                <td>
                   <input type="radio" name="ma_idx" value="1" /> 20대 
                   <input type="radio" name="ma_idx" value="2" /> 30대 
                   <input type="radio" name="ma_idx" value="3" /> 40대 
                   <input type="radio" name="ma_idx" value="4" /> 50대 
                   <input type="radio" name="ma_idx" value="5" /> 60대 
                </td>
            </tr>
            <tr>
            	<th>주소</th>
                <td>
                <input type="text" id="sample6_postcode" name="mb_postcode" placeholder="우편번호" readonly>
				<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
				<input type="text" id="sample6_address" name="mb_addr_default" placeholder="주소" readonly><br>
				<input type="text" id="sample6_detailAddress" name="mb_addr_detail" placeholder="상세주소">
				
				<!-- 값을 받아와야되기때문에 hidden 으로 처리 -->
				<input type="hidden" id="sample6_extraAddress" name="sample6_extraAddress" placeholder="참고항목">
				
				<input type="hidden" id="sample6_sido" name="mb_sido" > <!-- 시/도 -->
				<input type="hidden" id="sample6_sigungu" name="mb_sigungu" > <!-- 시/군/구 -->
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
                // console.log(data.zonecode);
                document.getElementById("sample6_address").value = addr;
                // console.log(addr);
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("sample6_detailAddress").focus();
                
              
               console.log(data.sido);  // 시/도 (서울, 경기, 경북 등으로 표시)
                document.getElementById('sample6_sido').value = data.sido;
                
               console.log(data.sigungu); // 시/군/구 (서초구, 광명시 , 곡성군 등으로 표시)
                document.getElementById('sample6_sigungu').value = data.sigungu;
                
                
            }
        }).open();
    }
	
	var checkId = false; // 아이디 중복체크 여부
	function doubleCheckId() {
		
		var pattern2 = /[a-zA-Z]/;	// 영문 포함
		
		//문자열에 공백이 있는 경우
		var blank_pattern = /[\s]/g;
		// if( blank_pattern.test(str) == true){
		   // alert('공백이 입력되었습니다.');
		// }
		
		var id = $("#id").val();
		//console.log($("#id").val());
		
		if(id == "" || id == null){
	       alert("아이디를 입력해주세요");
	        return false;
	     }
		
		 if (blank_pattern.test(id)) {		//공백이있는지 체크하는 문
			alert('아이디에 공백이 있습니다.');
			return false;
		} 
		
		 if (!pattern2.test(id)){
			alert('아이디는 영문을 포함해야 합니다');
			return false;
		}
		 
		 console.log('아이디 중복 체크 : '+id);		
			$.ajax({
				type:'get',
				url:'doubleCheckId.ajax',
				data:{chkId:id},
				dataType:'JSON',
				success:function(data){
					// console.log(data);
				 if(data.doubleId){
						alert("이미 사용중인 아이디 입니다.");
					}else{
						alert("사용 가능한 아이디 입니다.");
						checkId = true;
						document.getElementById('doublecheckid').value = id;
					}
					 
				},
				error:function(e){
					console.log(e);
				}			
			});
		
	}
	
	
		
	var checkEmail = false; // 이메일 중복체크 여부
	function doubleCheckEmail() {
		
		//문자열에 공백이 있는 경우
		var blank_pattern = /[\s]/g;
		// if( blank_pattern.test(str) == true){
		   // alert('공백이 입력되었습니다.');
		// }
		
		var email = $("#email").val();
		console.log($("#email").val());
		
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
				url:'doubleCheckEmail.ajax',
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
				url:'doubleCheckNickname.ajax',
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
	
	
		function submitCheck() {  //회원가입 하기전 체크
			
			var pattern1 = /[0-9]/;				// 숫자
			var pattern2 = /[a-zA-Z]/;			// 문자
			var pattern3 = /[~!@#$%^&*()_+|<>?:{}]/;	// 특수문자
			
			
			var id = $('#id').val();	// 아이디
			//console.log($('#id').val());	
			
			var password = $('#password').val(); //비밀번호
			//console.log($('#password').val());	
			
			var passwordcheck = $('#passwordcheck').val(); //비밀번호 확인
			//console.log($('#passwordcheck').val());	
			
			var email = $('#email').val(); //이메일
			//console.log($('#email').val());	
			
			var nickname = $("#nickname").val(); //닉네임
			//console.log($('#nickname').val());	
			
			var name = $('#name').val(); //이름
			//console.log($('#name').val());	
			
			var gender = $('input[name=mb_gender]:checked').val(); //성별
			//console.log($('input[name=mb_gender]:checked').val());
			
			var age = $('input[name=ma_idx]:checked').val(); //나이대
			//console.log($('input[name=ma_idx]:checked').val());	
			
			var postcode = $('input[name=mb_postcode]').val(); //우편번호
			//console.log($('input[name=mb_postcode]').val());
			
			var addr = $('input[name=mb_addr_default]').val(); //주소
			//console.log($('input[name=mb_addr_default]').val());
			
			var detailaddr = $('input[name=mb_addr_detail]').val(); //상세주소
			//console.log($('input[name=mb_addr_detail]').val());
			
			var sido = $("#sample6_sido").val(); // 시/도 (서울, 경기, 경북 등으로 표시)
			//console.log($('#sample6_sido').val());
			
			if(sido == "세종특별자치시") {
				document.getElementById('sample6_sigungu').value = "세종시";
			}
			
			var sigungu = $("#sample6_sigungu").val(); // 시/군/구 (서초구, 광명시 , 곡성군 등으로 표시)
			//console.log($('#sample6_sigungu').val());
			
			var doublenickid = $("#doublecheckid").val();
			//console.log(doublenickid);
			
			var doublenickemail = $("#doublecheckemail").val();
			//console.log(doublenickname);
			
			var doublenickname = $("#doublecheckname").val();
			//console.log(doublenickname);
			
			
		if (	//값을 입력하지 않았을때 if문
				age == null || gender == null || id == "" || 
				password == "" || passwordcheck == "" || email == "" ||
				nickname == "" || name== "" || gender == "" ||
				age == "" || postcode == "" || addr == "" || 
				detailaddr == "" || sido == "" || sigungu == ""	
			) {
			alert("모든 값을 입력해 주세요");
			return false;
		} else {
		 if(password != passwordcheck) {
			alert("비밀번호와 비밀번호 확인이 일치하지 않습니다.");
			return false;
		} else if(!pattern1.test(password) || !pattern2.test(password) || !pattern3.test(password) || password.length < 4) {
			alert("비밀번호는 영문 , 숫자 , 특수문자를 포함 4자리 이상 입니다.");
			return false;
		} else if(checkId == false) {
			alert("아이디 중복확인을 진행해 주세요.");
			return  false;
		 } else 	if(doublenickid != id) {
			 alert("아이디 중복확인을 진행해 주세요.");
			 checkId = false;
			 // console.log(checkNickname);
			return false;
		}	else if (checkEmail == false) {
			 alert("이메일 중복확인을 진행해 주세요.");
			 return  false;
		 }else 	if(doublenickemail != email) {
			 alert("닉네임 중복확인을 진행해 주세요.");
			 checkEmail = false;
			 // console.log(checkNickname);
			return false;
		}	else if (checkNickname == false) {
			 alert("닉네임 중복확인을 진행해 주세요.");
			 return false;
		 } else 	if(doublenickname != nickname) {
			 alert("닉네임 중복확인을 진행해 주세요.");
			 checkNickname = false;
			 // console.log(checkNickname);
			return false;
		}	 
		 
		 
		 else {
			  return true;
		 }
		 
		 
		 
	} 
			
			
			
			
			
}


	
	var msg = "${msg}";
	if(msg != "") {
	alert(msg);
	}

</script>
</html>