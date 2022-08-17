<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../../resources/inc/header.jsp" %>
				
	<h3>크루 모집하기</h3>
	<form action="crewReg.do" method="post">
		<table>
			<tr>
				<th>연령대</th>
				<td>
					<input type="radio" name="age" value="20"/>20대
					<input type="radio" name="age" value="30"/>30대
					<input type="radio" name="age" value="40"/>40대
					<input type="radio" name="age" value="50"/>50대
					<input type="radio" name="age" value="60"/>60대 이상
				</td>
				<th>성별</th>
				<td>
					<input type="radio" name="gender" value="여성"/>여성
					<input type="radio" name="gender" value="남성"/>남성
					<input type="radio" name="gender" value="혼성"/>혼성
				</td>
			</tr>
			<tr>
				<th>캠핑종류</th>
				<td>
					<input type="checkbox" name="campingType" value="백패킹"/>백패킹
					<input type="checkbox" name="campingType" value="오토패킹"/>오토패킹
					<input type="checkbox" name="campingType" value="글램핑"/>글램핑
					<input type="checkbox" name="campingType" value="부쉬크래프트"/>부쉬크래프트
					<input type="checkbox" name="campingType" value="비박"/>비박
				</td>
				<th>모집인원</th>
				<td>
					<input type="number" name="people_cnt" placeholder="인원수 입력"/>명
				</td>
			</tr>
			<tr>
				<th>기타정보</th>
				<td colspan="3">
					<input type="checkbox" name="애견동반"/>애견동반
					<input type="checkbox" name="장비제공"/>장비제공
				</td>
			</tr>
			<tr>
				<th>캠핑장명</th>
				<td colspan="3">
					<span id="campingSelect"></span>
					<input type="hidden" id="campingSelectIdx" name="ca_idx" value=""/>
					<input type="button" onclick="popupCamping()" value="캠핑장 찾기"/>
				</td>
			</tr>
			<tr>
				<th>캠핑날짜</th>
				<td colspan="3">
					<input type="date" id="start" name="wish_start_date"
				       value=""
				       min="" max="2024-12-31"> ~
			       <input type="date" id="end" name="wish_end_date"
			       value=""
			       min="" max="2024-12-31">
				</td>
			</tr>
			<tr>
				<th>제목</th>
				<td colspan="3"><input type="text" name="ct_title"></td>
			</tr>
			<tr>
				<th>내용</th>
				<td colspan="3">
					<textarea name="ct_content"></textarea>
				</td>
			</tr>
		</table>
		<input type="submit" value="완료"/>
		<input type="button" value="목록"/>
	</form>
				
<%@ include file="../../resources/inc/footer.jsp" %>
	<script>
		function popupCamping() {
			window.open('/campPopup.go','popupCaming', 'width=800, height=600');
		}
		
		var now_utc = Date.now() // 지금 날짜를 밀리초로
		// getTimezoneOffset()은 현재 시간과의 차이를 분 단위로 반환
		var timeOff = new Date().getTimezoneOffset()*60000; // 분단위를 밀리초로 변환
		// new Date(now_utc-timeOff).toISOString()은 '2022-05-11T18:09:38.134Z'를 반환
		var today = new Date(now_utc-timeOff).toISOString().split("T")[0];
		document.getElementById("start").setAttribute("min", today);
		document.getElementById("start").setAttribute("value", today);
		document.getElementById("end").setAttribute("min", today);
		document.getElementById("end").setAttribute("value", today);
	</script>
</html>