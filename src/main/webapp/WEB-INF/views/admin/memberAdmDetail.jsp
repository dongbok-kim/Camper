<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="/resources/inc/header.jsp" %>
<aside>
					<h2>관리자페이지</h2>
					<ul>
						<li class="active"><a href="/memberAdmList.go">회원 관리</a></li>
						<li><a href="/reportAdmList.go">신고 관리</a></li>
						<li><a href="/stopAdmList.go">정지 회원 관리</a></li>
						<li><a href="/blindAdmList.go">블라인드 관리</a></li>
						<li><a href="/answerAdmList.go">1:1문의 관리</a></li>
						<li><a href="/titleList.go">타이틀 관리</a></li>
						<li><a href="/ageAdmList.go">연령대 관리</a></li>
						<li><a href="/campingAdmList.go">캠핑장 관리</a></li>
						<li><a href="/reviewAdmList.go">후기 관리</a></li>
						<li><a href="/togetherAdmList.go">모집글 관리</a></li>
					</ul>
	</aside>
	<div class="right">
		<h3>회원 상세 보기</h3>
	</div>
<title>관리자 페이지 - 회원상세보기</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<style>
table, th, td{
		border: 1px solid black;
		border-collapse: collapse;
		padding: 5px 10px;
	}
	th{
		text-align: center;
		background-color: gray;
	}
</style>
<body>
	<div>
	<form action="memberAdmUpdate.do" method="post">
	<table>
		<tr>
			<th>아이디</th>
			<td colspan="3">
			<input type="hidden" name="mb_id" value="${dto.mb_id }" />
			${dto.mb_id }</td>
		</tr>
		<tr>
			<th>이름</th>
			<td colspan="3">${dto.mb_name }</td>
		</tr>
		<tr>
			<th>닉네임</th>
			<td colspan="3">${dto.mb_nickname }</td>
		</tr>
		<tr>
			<th>성별</th>
			<td>${dto.mb_gender }</td>
			<td style="text-align: center; background-color: gray;">연령대</td>
			<td>${age.ma_age } 대</td><!-- 나이불러오기 -->
		</tr>
		<tr>
			<th>이메일</th>
			<td colspan="3">${dto.mb_email}</td>
		</tr>
		<tr>
			<th>지역(시/도)</th>
			<td>${dto.mb_sido }</td>
			<td style="text-align: center; background-color: gray;"  >지역(시/군/구)</td>
			<td>${dto.mb_sigungu }</td>
		</tr>
		<tr>
			<th>우편번호/주소</th>
			<td colspan="3">
			(${dto.mb_postcode })  ${dto.mb_addr_default } <br/>
			${dto.mb_addr_detail}
			</td>
		</tr>
		<tr>
			<th>모닥불온도</th>
			<td>${dto.mb_fire } ℃</td>
			<td style="text-align: center; background-color: gray;">타이틀</td>
			<td>
			<c:if test="${title.mt_idx eq null }">
				타이틀 없음
			</c:if>
			${title.mt_name }
			</td>
			
		</tr>
		<tr>
			<th>회원권한</th>
			<td colspan="3">
			<input type="hidden" name="mb_grade" id="mb_grade"value="${dto.mb_grade }" />
			<label><input type="radio" name="mb_graderadio" value="회원" /> 회원</label>  
			<label><input type="radio" name="mb_graderadio" value="관리자" /> 관리자 </label> 
			</td>
		</tr>
	</table>
		<br/>
		<input type="submit" value="수정">
		<input type="button" value="목록" onclick="location.href='memberAdmList.go'" />
		</form>
		</div>
</body>
<%@ include file="/resources/inc/footer.jsp" %>
<script>
	// console.log($("#mb_grade").val());
	
	var mb_grade = $("#mb_grade").val();
	
	if(mb_grade == '회원') {
		$("input:radio[name='mb_graderadio']:radio[value='회원']").attr("checked" , true);
	}
	
	if(mb_grade == '관리자') {
		$("input:radio[name='mb_graderadio']:radio[value='관리자']").attr("checked" , true);
	}

	var msg = "${msg}";
	if(msg != "") {
	alert(msg);
	}
</script>
</html>