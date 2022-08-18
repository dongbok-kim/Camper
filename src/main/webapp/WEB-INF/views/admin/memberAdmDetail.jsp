<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="/resources/inc/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 페이지 - 회원상세보기</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
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
<aside>
					<h2>관리자페이지</h2>
					<ul>
						<li class="active"><a href="">회원 관리</a></li>
						<li><a href="">신고 관리</a></li>
						<li><a href="">정지 회원 관리</a></li>
						<li><a href="">블라인드 관리</a></li>
						<li><a href="">1:1문의 관리</a></li>
						<li><a href="">타이틀 관리</a></li>
						<li><a href="">연령대 관리</a></li>
						<li><a href="">캠핑장 관리</a></li>
						<li><a href="">후기 관리</a></li>
						<li><a href="">모집글 관리</a></li>
					</ul>
	</aside>
	<section>
	<h2>회원 상세보기</h2>
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
			<td style="text-align: center">연령대</td>
			<td>${dto.ma_idx }</td><!-- 나중에 맞게 변경해야됨 -->
		</tr>
		<tr>
			<th>이메일</th>
			<td colspan="3">${dto.mb_email}</td>
		</tr>
		<tr>
			<th>지역(시/도)</th>
			<td>${dto.mb_sido }</td>
			<td style="text-align: center"  >지역(시/군/구)</td>
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
			<td style="text-align: center">타이틀</td>
			<td>왕초보</td><!-- 나중에 추가 -->
		</tr>
		<tr>
			<th>회원권한</th>
			<td colspan="3">
			<input type="hidden" name="mb_grade" id="mb_grade"value="${dto.mb_grade }" />
			<input type="radio" name="mb_graderadio" value="회원" /> 회원  
			<input type="radio" name="mb_graderadio" value="관리자" /> 관리자  
			</td>
		</tr>
	</table>
		<br/><br/>
		<input type="submit" value="수정">
		<input type="button" value="목록" onclick="location.href='memberAdmList.go'" />
		</form>
	</section>
</body>
<script>
	// console.log($("#mb_grade").val());
	
	var mb_grade = $("#mb_grade").val();
	
	if(mb_grade == '회원') {
		$("input:radio[name='mb_graderadio']:radio[value='회원']").attr("checked" , true);
	}
	
	if(mb_grade == '관리자') {
		$("input:radio[name='mb_graderadio']:radio[value='관리자']").attr("checked" , true);
	}

</script>
</html>