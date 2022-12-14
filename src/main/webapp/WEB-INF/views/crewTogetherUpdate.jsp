<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../../resources/inc/header.jsp" %>
<style>
	#ftCrewTogether > tbody > tr > td > input[type="number"] {
		text-align: right;
	}

	#ftCrewTogether > tbody > tr > td > input[name="ct_title"] {
		width: 99%;
	}
</style>
				
	<h3>크루 모집 수정하기</h3>
	<form action="crewTogetherUpdate.do" name="crewUpdate" method="post">
		<input type="hidden" name="ct_idx" value="${crew.ct_idx }"/>
		<input type="hidden" name="mb_id" value="${crew.mb_id }">
		<table id="ftCrewTogether">
			<colgroup>
				<col width="10%"></col>
				<col width="40%"></col>
				<col width="10%"></col>
				<col width="40%"></col>
			</colgroup>
			<tbody>
				<tr>
					<th>연령대</th>
					<td>
						<label><input type="radio" name="ct_age" value="20" ${crew.ct_age == 20 ? 'checked' : '' }/>20대</label>
						<label><input type="radio" name="ct_age" value="30" ${crew.ct_age == 30 ? 'checked' : '' }/>30대</label>
						<label><input type="radio" name="ct_age" value="40" ${crew.ct_age == 40 ? 'checked' : '' }/>40대</label>
						<label><input type="radio" name="ct_age" value="50" ${crew.ct_age == 50 ? 'checked' : '' }/>50대</label>
						<label><input type="radio" name="ct_age" value="60" ${crew.ct_age == 60 ? 'checked' : '' }/>60대 이상</label>
					</td>
					<th>성별</th>
					<td>
						<label><input type="radio" name="ct_gender" value="남" ${crew.ct_gender == "남" ? 'checked' : '' }/>남성</label>
						<label><input type="radio" name="ct_gender" value="여" ${crew.ct_gender == "여" ? 'checked' : '' }/>여성</label>
						<label><input type="radio" name="ct_gender" value="혼성" ${crew.ct_gender == "혼성" ? 'checked' : '' }/>혼성</label>
					</td>
				</tr>
				<tr>
					<th>캠핑종류</th>
					<td>
						<%-- <c:forEach items="${type }" var="type"> ${type =='오토패킹' ? 'checked' : '' } --%>
							<label><input type="checkbox" name="ct_camping_type" value="백패킹" ${fn:contains(crew.ct_camping_type, '백패킹') ? 'checked' : ''}/>백패킹</label>
							<label><input type="checkbox" name="ct_camping_type" value="오토패킹" ${fn:contains(crew.ct_camping_type, '오토패킹') ? 'checked' : ''}/>오토패킹</label>
							<label><input type="checkbox" name="ct_camping_type" value="글램핑" ${fn:contains(crew.ct_camping_type, '글램핑') ? 'checked' : ''}/>글램핑</label>
							<label><input type="checkbox" name="ct_camping_type" value="부쉬크래프트" ${fn:contains(crew.ct_camping_type, '부쉬크래프트') ? 'checked' : ''}/>부쉬크래프트</label>				
							<label><input type="checkbox" name="ct_camping_type" value="비박" ${fn:contains(crew.ct_camping_type, '비박') ? 'checked' : ''}/>비박</label>
						
						<%-- </c:forEach> --%>
	
					</td>
					<th>모집인원</th>
					<td>
						<input type="number" class="people_cnt" name="ct_people_cnt" min="1" max="20" value="${crew.ct_people_cnt }"/>명
					</td>
				</tr>
				<tr>
					<th>기타정보</th>
					<td colspan="3">
						<label><input type="checkbox" name="ct_pet"  value="1" ${crew.ct_pet == 1 ? 'checked' : '' }/>애견동반</label>
						<label><input type="checkbox" name="ct_tool" value="1" ${crew.ct_tool == 1 ? 'checked' : '' }/>장비제공</label>
					</td>
				</tr>
				<tr>
					<th>캠핑장명</th>
					<td colspan="3">
						<span id="campingSelect">${crew.ca_name }</span>
						<input type="hidden" id="campingSelectIdx" name="ca_idx" value="${crew.ca_idx }"/>
						<input type="button" class="btn btnCampingSearch" onclick="popupCamping()" value="캠핑장 찾기"/>
					</td>
				</tr>
				<tr>
					<th>캠핑날짜</th>
					<td colspan="3">
						<input type="text" id="startDate" name="ct_wish_start" value="${crew.ct_wish_start }" class="datePicker" readonly> ~
				       <input type="text" id= "endDate" name="ct_wish_end" value="${crew.ct_wish_start }" class="datePicker" readonly>
					</td>
				</tr>
				<tr>
					<th>제목</th>
					<td colspan="3"><input type="text" name="ct_title" id="ct_title" value="${crew.ct_title }"></td>
				</tr>
				<tr>
					<th>내용</th>
					<td colspan="3">
						<textarea name="ct_content" id="ct_content">${crew.ct_content }</textarea>
					</td>
				</tr>
			</tbody>
		</table>
		<div style="margin-top: 20px; text-align: center;">
			<input type="button" class="btn btnSubmit" id="crewSubmit" value="완료"/>
			<a class="btn btnList" href="crewTogetherList.do">목록</a>
		</div>
	</form>
				
<%@ include file="../../resources/inc/footer.jsp" %>
	<script>

		function popupCamping() {
			window.open('/campPopup.go','popupCaming', 'width=1200, height=800');
		}
		
		var chatCnt = "${chatCnt}";  // 현재 채팅방 참여 인원 수
		
		$('#crewSubmit').on('click', function(){
			
			// 유효성 검사
		 	var cnt = $('.people_cnt').val();
			 
			if (chatCnt > cnt*2){ // 현재 채팅방 참여 인원 수 > 모집 정원 *2(수정할 채팅방 정원)
				alert("수정할 모집 인원 수는 "+(Math.floor(chatCnt/2))+"보다 클 수 없습니다.");
				return false;
			} else if (cnt > 20) {
				alert("크루 모집 인원 수는 20명 까지 모집 가능합니다.");
				return false;
			} else if (cnt == ''){
				alert("크루 모집 인원 수를 입력하세요. (최대 20명)");
				return false;
			};
		
			if (typeof $('input[name="ct_gender"]:checked').val() == "undefined"){
				alert("모집 성별을 선택하세요.");
				return false;
			};
			
			if (typeof $('input[name="ct_age"]:checked').val() == "undefined"){
				alert("모집 연령을 선택하세요.");
				return false;
			};
			
			if (typeof $('input[name="ct_camping_type"]:checked').val() == "undefined"){
				alert("캠핑 종류를 선택하세요.");
				return false;
			};
			
			if ($('#campingSelect').text() == ''){
				alert("캠핑장을 선택하세요.");
				return false;
			};
			
			if ($('#startDate').val() == '' || $('#endDate').val() == ''){
				alert("캠핑 희망 날짜를 선택하세요.");
				return false;
			};
			
			if ($('#ct_title').val() == ''){
				alert("제목을 입력하세요.");
				return false;
			};
			
			if ($('#ct_content').val() == ''){
				alert("제목을 입력하세요.");
				return false;
			}; 
			
			document.crewUpdate.submit();
			

		});
	
		// datepicker
		$(function () {
			$( '#startDate' ).datepicker({
				minDate : 0,
				dateFormat : "yy-mm-dd",
				showOn: 'both',
				buttonImageOnly: true,
				buttonImage: '../../resources/images/ico_calendar.jpg',
				onSelect : function (selected) {
					var dt = new Date(selected);
					dt.setDate(dt.getDate());
					$('#endDate').datepicker('option','minDate',dt);
				}
			});
			
			var minEndDate = $.trim($('#startDate').val()) == '' ? 0 : $('#startDate').val();
			
			$( '#endDate' ).datepicker({
				minDate: minEndDate,
				dateFormat : "yy-mm-dd",
				showOn: 'both',
				buttonImageOnly: true,
				buttonImage: '../../resources/images/ico_calendar.jpg',
				onSelect : function (selected) {
					var dt = new Date(selected);
					dt.setDate(dt.getDate());
					$('#startDate').datepicker('option','maxDate',dt);
				}
			});
		});
		
		
		    
		
	</script>
</html>