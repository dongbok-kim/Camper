<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<%@ include file="../../../resources/inc/header.jsp" %>
				<aside>
					<h2>관리자페이지</h2>
					<ul>
						<li><a href="/memberAdmList.go">회원 관리</a></li>
						<li><a href="/reportAdmList.go">신고 관리</a></li>
						<li><a href="/stopAdmList.go">정지 회원 관리</a></li>
						<li><a href="/blindAdmList.go">블라인드 관리</a></li>
						<li><a href="/answerAdmList.go">1:1문의 관리</a></li>
						<li><a href="/titleList.go">타이틀 관리</a></li>
						<li><a href="/ageAdmList.go">연령대 관리</a></li>
						<li class="active"><a href="/campingAdmList.go">캠핑장 관리</a></li>
						<li><a href="/reviewAdmList.go">후기 관리</a></li>
						<li><a href="/togetherAdmList.go">모집글 관리</a></li>
					</ul>
				</aside>
				<div class="right">
					<h3>캠핑장 수정 상세보기</h3>
				</div>
<body>
	<div>
	<form action="campingAdmUpdate.do" name="campingUpdate" method="post">
		<table>
			<tr>
				<th>캠핑장 이름</th>
				<td>
					<input type="hidden" name="ca_idx" value="${oriCamp.ca_idx }"/>
					<input type="text" name="ca_name" value="${oriCamp.ca_name }"/>
					<c:if test="${oriCamp.ca_name ne newCamp.ca_name}">
						<span style="color: red">api 변경정보 : ${newCamp.ca_name}</span>
					</c:if>
				</td>
			</tr>
		  	<tr>
				<th>주소</th>
				<td>
					<input type="text" name="ca_postcode" id="ca_postcode" value="${oriCamp.ca_postcode }" readonly/>
					<c:if test="${oriCamp.ca_postcode ne newCamp.ca_postcode}">
						<span style="color: red">api 변경정보 : ${newCamp.ca_postcode}</span>
					</c:if>
					<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
					<input type="text" name="ca_addr_default" id="ca_addr_default" value="${oriCamp.ca_addr_default }" readonly/>
					<c:if test="${oriCamp.ca_addr_default ne newCamp.ca_addr_default}">
						<span style="color: red">api 변경정보 : ${newCamp.ca_addr_default}</span>
					</c:if><br/>
					<input type="text" name="ca_addr_detail" id="ca_addr_detail"  value="${oriCamp.ca_addr_detail }"/>
					<c:if test="${oriCamp.ca_addr_detail ne newCamp.ca_addr_detail}">
						<span style="color: red">api 변경정보 : ${newCamp.ca_addr_detail}</span>
					</c:if>
					
					<!-- 값을 받아와야되기때문에 hidden 으로 처리 -->  
					<input type="hidden" id="sample6_extraAddress" name="sample6_extraAddress" placeholder="참고항목">
					
					<input type="hidden" id="ca_sido" name="ca_sido" value="${oriCamp.ca_sido }"> 
					<input type="hidden" id="ca_sigungu" name="ca_sigungu" value="${oriCamp.ca_sigungu }"> 
				</td>
			</tr>
			<tr>
				<th>전화번호</th>
				<td>
					<input type="text" name="ca_tel" value="${oriCamp.ca_tel }"/>
					<c:if test="${oriCamp.ca_tel ne newCamp.ca_tel}">
						<span style="color: red">api 변경정보 : ${newCamp.ca_tel}</span>
					</c:if>
				</td>
			</tr>
			<tr>
				<th>운영일</th>
				<td>
					<input type="radio" name="ca_oper_date" value="평일+주말" ${oriCamp.ca_oper_date == '평일+주말' ? 'checked' : '' } />평일+주말
					<input type="radio" name="ca_oper_date" value="주말" ${oriCamp.ca_oper_date == '주말' ? 'checked' : '' } />주말
					<c:if test="${oriCamp.ca_oper_date ne newCamp.ca_oper_date}">
					<div>
						<input type="radio" disabled="disabled" ${newCamp.ca_oper_date == '평일+주말' ? 'checked' : '' } />평일+주말
						<input type="radio" disabled="disabled" ${newCamp.ca_oper_date == '주말' ? 'checked' : '' } />주말
						<span style="color: red"> api 변경정보 </span>
					</div>
					</c:if>
				</td>
			</tr>
			<tr>
				<th>업종</th>
				<td>
					<input type="checkbox" name="ca_induty" value="일반야영장" ${fn:contains(oriCamp.ca_induty, '일반야영장') ? 'checked' : ''} />일반 야영장
					<input type="checkbox" name="ca_induty" value="자동차야영장" ${fn:contains(oriCamp.ca_induty, '자동차야영장') ? 'checked' : ''} />자동차 야영장
					<input type="checkbox" name="ca_induty" value="카라반" ${fn:contains(oriCamp.ca_induty, '카라반') ? 'checked' : ''} />카라반
					<input type="checkbox" name="ca_induty" value="글램핑" ${fn:contains(oriCamp.ca_induty, '글램핑') ? 'checked' : ''} />글램핑
					<c:if test="${oriCamp.ca_induty ne newCamp.ca_induty}">
					<div>
						<input type="checkbox" disabled="disabled" ${fn:contains(newCamp.ca_induty, '일반야영장') ? 'checked' : ''} />일반 야영장
						<input type="checkbox" disabled="disabled" ${fn:contains(newCamp.ca_induty, '자동차야영장') ? 'checked' : ''} />자동차 야영장
						<input type="checkbox" disabled="disabled" ${fn:contains(newCamp.ca_induty, '카라반') ? 'checked' : ''} />카라반
						<input type="checkbox" disabled="disabled" ${fn:contains(newCamp.ca_induty, '글램핑') ? 'checked' : ''} />글램핑
						<span style="color: red"> api 변경정보 </span>
					</div>
					</c:if>
				</td>
			</tr>
			<tr>
				<th>운영계절</th>
				<td>
					<input type="checkbox" name="ca_oper_period" value="봄" ${fn:contains(oriCamp.ca_oper_period, '봄') ? 'checked' : ''} />봄
					<input type="checkbox" name="ca_oper_period" value="여름" ${fn:contains(oriCamp.ca_oper_period, '여름') ? 'checked' : ''} />여름
					<input type="checkbox" name="ca_oper_period" value="가을" ${fn:contains(oriCamp.ca_oper_period, '가을') ? 'checked' : ''} />가을
					<input type="checkbox" name="ca_oper_period" value="겨울" ${fn:contains(oriCamp.ca_oper_period, '겨울') ? 'checked' : ''} />겨울
					<c:if test="${oriCamp.ca_oper_period ne newCamp.ca_oper_period}">
					<div>
						<input type="checkbox" disabled="disabled" ${fn:contains(newCamp.ca_oper_period, '봄') ? 'checked' : ''} />봄
						<input type="checkbox" disabled="disabled" ${fn:contains(newCamp.ca_oper_period, '여름') ? 'checked' : ''} />여름
						<input type="checkbox" disabled="disabled" ${fn:contains(newCamp.ca_oper_period, '가을') ? 'checked' : ''} />가을
						<input type="checkbox" disabled="disabled" ${fn:contains(newCamp.ca_oper_period, '겨울') ? 'checked' : ''} />겨울
						<span style="color: red"> api 변경정보 </span>
					</div>
					</c:if>
				</td>
			</tr>
			<tr>
				<th>운영상태</th>
				<td>
					<input type="radio" name="ca_manage_status" value="운영" ${oriCamp.ca_manage_status == '운영' ? 'checked' : '' } />운영
					<input type="radio" name="ca_manage_status" value="휴장" ${oriCamp.ca_manage_status == '휴장' ? 'checked' : '' } />휴장
					<input type="radio" name="ca_manage_status" value="확인중" ${oriCamp.ca_manage_status == '확인중' ? 'checked' : '' } />확인중
					<c:if test="${oriCamp.ca_manage_status ne newCamp.ca_manage_status}">
					<div>
						<input type="radio" disabled="disabled" ${newCamp.ca_manage_status == '운영' ? 'checked' : '' } />운영
						<input type="radio" disabled="disabled" ${newCamp.ca_manage_status == '휴장' ? 'checked' : '' } />휴장
						<input type="radio" disabled="disabled" ${newCamp.ca_manage_status == '확인중' ? 'checked' : '' } />확인중
						<span style="color: red"> api 변경정보 </span>
					</div>
					</c:if>
				</td>
			</tr>
			<tr>
				<th>애견동반</th>
				<td>
					<input type="radio" name="ca_pet" value="가능" ${(oriCamp.ca_pet == '가능') || (oriCamp.ca_pet == '가능(소형견)') ? 'checked' : '' } /> 애견 동반 가능
					<input type="radio" name="ca_pet" value="불가능" ${oriCamp.ca_pet == '불가능' ? 'checked' : '' } /> 애견 동반 불가능
					<div>
						(※ 실제 결과는 현장사정 및 계절에 따라 달라질 수 있으니 캠핑장 사업주에 직접 확인 후 이용바랍니다.)
					</div>
					<c:if test="${oriCamp.ca_pet ne newCamp.ca_pet}">
					<div>
						<input type="radio" disabled="disabled" ${(newCamp.ca_pet == '가능') || (newCamp.ca_pet == '가능(소형견)') ? 'checked' : '' } /> 애견 동반 가능
						<input type="radio" disabled="disabled" ${newCamp.ca_pet == '불가능' ? 'checked' : '' } /> 애견 동반 불가능
						<span style="color: red"> api 변경정보 </span>
					</div>
					</c:if>
				</td>
			</tr>
			<tr>
				<th>캠핑장 장비대여</th>
				<td>
					<input type="checkbox" name="ca_tool" value="텐트" ${fn:contains(oriCamp.ca_tool, '텐트') ? 'checked' : ''} />텐트
					<input type="checkbox" name="ca_tool" value="릴선" ${fn:contains(oriCamp.ca_tool, '릴선') ? 'checked' : ''} />릴선
					<input type="checkbox" name="ca_tool" value="화로대" ${fn:contains(oriCamp.ca_tool, '화로대') ? 'checked' : ''} />화로대
					<input type="checkbox" name="ca_tool" value="난방기구" ${fn:contains(oriCamp.ca_tool, '난방기구') ? 'checked' : ''} />난방기구
					<input type="checkbox" name="ca_tool" value="침낭" ${fn:contains(oriCamp.ca_tool, '침낭') ? 'checked' : ''} />침낭
					<input type="checkbox" name="ca_tool" value="식기" ${fn:contains(oriCamp.ca_tool, '식기') ? 'checked' : ''} />식기
					<c:if test="${oriCamp.ca_tool ne newCamp.ca_tool}">
					<div>
						<input type="checkbox" disabled="disabled" ${fn:contains(newCamp.ca_tool, '텐트') ? 'checked' : ''} />텐트
						<input type="checkbox" disabled="disabled" ${fn:contains(newCamp.ca_tool, '릴선') ? 'checked' : ''} />릴선
						<input type="checkbox" disabled="disabled" ${fn:contains(newCamp.ca_tool, '화로대') ? 'checked' : ''} />화로대
						<input type="checkbox" disabled="disabled" ${fn:contains(newCamp.ca_tool, '난방기구') ? 'checked' : ''} />난방기구
						<input type="checkbox" disabled="disabled" ${fn:contains(newCamp.ca_tool, '침낭') ? 'checked' : ''} />침낭
						<input type="checkbox" disabled="disabled" ${fn:contains(newCamp.ca_tool, '식기') ? 'checked' : ''} />식기
						<span style="color: red"> api 변경정보 </span>
					</div>
					</c:if>
				</td>
			</tr>
			<tr>
				<th>화로대</th>
				<td>
					<input type="checkbox" name="ca_fire_cnt" value="개별" ${fn:contains(oriCamp.ca_fire_cnt, '개별') ? 'checked' : ''} />개별
					<input type="checkbox" name="ca_fire_cnt" value="불가" ${fn:contains(oriCamp.ca_fire_cnt, '불가') ? 'checked' : ''} />불가
					<input type="checkbox" name="ca_fire_cnt" value="공동취사장" ${fn:contains(oriCamp.ca_fire_cnt, '공동취사장') ? 'checked' : ''} />공동취사장
					<c:if test="${oriCamp.ca_fire_cnt ne newCamp.ca_fire_cnt}">
					<div>
						<input type="checkbox" disabled="disabled" ${fn:contains(newCamp.ca_fire_cnt, '개별') ? 'checked' : ''} />개별
						<input type="checkbox" disabled="disabled" ${fn:contains(newCamp.ca_fire_cnt, '불가') ? 'checked' : ''} />불가
						<input type="checkbox" disabled="disabled" ${fn:contains(newCamp.ca_fire_cnt, '공동취사장') ? 'checked' : ''} />공동취사장
						<span style="color: red"> api 변경정보 </span>
					</div>
					</c:if>
				</td>
			</tr>
			<tr>
				<th>캠핑장 환경</th>
				<td>
					<input type="checkbox" name="ca_environment" value="산" ${fn:contains(oriCamp.ca_environment, '산') ? 'checked' : ''} />산
					<input type="checkbox" name="ca_environment" value="섬" ${fn:contains(oriCamp.ca_environment, '섬') ? 'checked' : ''} />섬
					<input type="checkbox" name="ca_environment" value="숲" ${fn:contains(oriCamp.ca_environment, '숲') ? 'checked' : ''} />숲
					<input type="checkbox" name="ca_environment" value="강" ${fn:contains(oriCamp.ca_environment, '강') ? 'checked' : ''} />강
					<input type="checkbox" name="ca_environment" value="호수" ${fn:contains(oriCamp.ca_environment, '호수') ? 'checked' : ''} />호수
					<input type="checkbox" name="ca_environment" value="도심" ${fn:contains(oriCamp.ca_environment, '도심') ? 'checked' : ''} />도심
					<input type="checkbox" name="ca_environment" value="계곡" ${fn:contains(oriCamp.ca_environment, '계곡') ? 'checked' : ''} />계곡
					<input type="checkbox" name="ca_environment" value="해변" ${fn:contains(oriCamp.ca_environment, '해변') ? 'checked' : ''} />해변
					<c:if test="${oriCamp.ca_environment ne newCamp.ca_environment}">
					<div>
						<input type="checkbox" disabled="disabled" ${fn:contains(newCamp.ca_environment, '산') ? 'checked' : ''} />산
						<input type="checkbox" disabled="disabled" ${fn:contains(newCamp.ca_environment, '섬') ? 'checked' : ''} />섬
						<input type="checkbox" disabled="disabled" ${fn:contains(newCamp.ca_environment, '숲') ? 'checked' : ''} />숲
						<input type="checkbox" disabled="disabled" ${fn:contains(newCamp.ca_environment, '강') ? 'checked' : ''} />강
						<input type="checkbox" disabled="disabled" ${fn:contains(newCamp.ca_environment, '호수') ? 'checked' : ''} />호수
						<input type="checkbox" disabled="disabled" ${fn:contains(newCamp.ca_environment, '도심') ? 'checked' : ''} />도심
						<input type="checkbox" disabled="disabled" ${fn:contains(newCamp.ca_environment, '계곡') ? 'checked' : ''} />계곡
						<input type="checkbox" disabled="disabled" ${fn:contains(newCamp.ca_environment, '해변') ? 'checked' : ''} />해변
						<span style="color: red"> api 변경정보 </span>
					</div>
					</c:if>
				</td>
			</tr>
			<tr>
				<th>부대시설</th>
				<td>
					<input type="checkbox" name="ca_sub_facility" value="전기" ${fn:contains(oriCamp.ca_sub_facility, '전기') ? 'checked' : ''} />전기
					<input type="checkbox" name="ca_sub_facility" value="무선인터넷" ${fn:contains(oriCamp.ca_sub_facility, '무선인터넷') ? 'checked' : ''} />무선인터넷
					<input type="checkbox" name="ca_sub_facility" value="장작판매" ${fn:contains(oriCamp.ca_sub_facility, '장작판매') ? 'checked' : ''} />장작판매
					<input type="checkbox" name="ca_sub_facility" value="온수" ${fn:contains(oriCamp.ca_sub_facility, '온수') ? 'checked' : ''} />온수
					<input type="checkbox" name="ca_sub_facility" value="트램플린" ${fn:contains(coriCampamp.ca_sub_facility, '트램플린') ? 'checked' : ''} />트램플린
					<input type="checkbox" name="ca_sub_facility" value="물놀이장" ${fn:contains(oriCamp.ca_sub_facility, '물놀이장') ? 'checked' : ''} />물놀이장
					<input type="checkbox" name="ca_sub_facility" value="놀이터" ${fn:contains(oriCamp.ca_sub_facility, '놀이터') ? 'checked' : ''} />놀이터
					<input type="checkbox" name="ca_sub_facility" value="산책로" ${fn:contains(oriCamp.ca_sub_facility, '산책로') ? 'checked' : ''} />산책로
					<input type="checkbox" name="ca_sub_facility" value="운동장" ${fn:contains(oriCamp.ca_sub_facility, '운동장') ? 'checked' : ''} />운동장
					<input type="checkbox" name="ca_sub_facility" value="운동시설" ${fn:contains(oriCamp.ca_sub_facility, '운동시설') ? 'checked' : ''} />운동시설
					<input type="checkbox" name="ca_sub_facility" value="마트.편의점" ${fn:contains(oriCamp.ca_sub_facility, '마트.편의점') ? 'checked' : ''} />마트.편의점
					<c:if test="${oriCamp.ca_sub_facility ne newCamp.ca_sub_facility}">
					<div>
						<input type="checkbox" disabled="disabled" ${fn:contains(newCamp.ca_sub_facility, '전기') ? 'checked' : ''} />전기
						<input type="checkbox" disabled="disabled" ${fn:contains(newCamp.ca_sub_facility, '무선인터넷') ? 'checked' : ''} />무선인터넷
						<input type="checkbox" disabled="disabled" ${fn:contains(newCamp.ca_sub_facility, '장작판매') ? 'checked' : ''} />장작판매
						<input type="checkbox" disabled="disabled" ${fn:contains(newCamp.ca_sub_facility, '온수') ? 'checked' : ''} />온수
						<input type="checkbox" disabled="disabled" ${fn:contains(newCamp.ca_sub_facility, '트램플린') ? 'checked' : ''} />트램플린
						<input type="checkbox" disabled="disabled" ${fn:contains(newCamp.ca_sub_facility, '물놀이장') ? 'checked' : ''} />물놀이장
						<input type="checkbox" disabled="disabled" ${fn:contains(newCamp.ca_sub_facility, '놀이터') ? 'checked' : ''} />놀이터
						<input type="checkbox" disabled="disabled" ${fn:contains(newCamp.ca_sub_facility, '산책로') ? 'checked' : ''} />산책로
						<input type="checkbox" disabled="disabled" ${fn:contains(newCamp.ca_sub_facility, '운동장') ? 'checked' : ''} />운동장
						<input type="checkbox" disabled="disabled" ${fn:contains(newCamp.ca_sub_facility, '운동시설') ? 'checked' : ''} />운동시설
						<input type="checkbox" disabled="disabled" ${fn:contains(newCamp.ca_sub_facility, '마트.편의점') ? 'checked' : ''} />마트.편의점
						<span style="color: red"> api 변경정보 </span>
					</div>
					</c:if>
				</td>
			</tr>
			<tr>
				<th>한줄소개</th>
				<td>
					<textarea rows="2" cols="100" name="ca_intro">${oriCamp.ca_intro }</textarea>
					<c:if test="${oriCamp.ca_intro ne newCamp.ca_intro}">
						<div style="color: red">api 변경정보 : ${newCamp.ca_intro }</div>
					</c:if>
				</td>
			</tr>
			<tr>
				<th>주변이용가능시설</th>
				<td>
					<input type="checkbox" name="ca_possibilty" value="계곡 물놀이" ${fn:contains(oriCamp.ca_possibilty, '계곡 물놀이') ? 'checked' : ''} />계곡 물놀이
					<input type="checkbox" name="ca_possibilty" value="운동장" ${fn:contains(oriCamp.ca_possibilty, '운동장') ? 'checked' : ''} />운동장
					<input type="checkbox" name="ca_possibilty" value="강/물놀이" ${fn:contains(oriCamp.ca_possibilty, '강/물놀이') ? 'checked' : ''} />강/물놀이
					<input type="checkbox" name="ca_possibilty" value="낚시" ${fn:contains(oriCamp.ca_possibilty, '낚시') ? 'checked' : ''} />낚시
					<input type="checkbox" name="ca_possibilty" value="산책로" ${fn:contains(oriCamp.ca_possibilty, '산책로') ? 'checked' : ''} />산책로
					<input type="checkbox" name="ca_possibilty" value="농어촌체험시설" ${fn:contains(oriCamp.ca_possibilty, '농어촌체험시설') ? 'checked' : ''} />농어촌체험시설<br/>
					<input type="checkbox" name="ca_possibilty" value="해수욕" ${fn:contains(oriCamp.ca_possibilty, '해수욕') ? 'checked' : ''} />해수욕
					<input type="checkbox" name="ca_possibilty" value="수상레저" ${fn:contains(oriCamp.ca_possibilty, '수상레저') ? 'checked' : ''} />수상레저
					<input type="checkbox" name="ca_possibilty" value="수영장" ${fn:contains(oriCamp.ca_possibilty, '수영장') ? 'checked' : ''} />수영장
					<input type="checkbox" name="ca_possibilty" value="어린이놀이시설" ${fn:contains(oriCamp.ca_possibilty, '어린이놀이시설') ? 'checked' : ''} />어린이놀이시설
					<input type="checkbox" name="ca_possibilty" value="청소년체험시설" ${fn:contains(oriCamp.ca_possibilty, '청소년체험시설') ? 'checked' : ''} />청소년체험시설
					<c:if test="${oriCamp.ca_possibilty ne newCamp.ca_possibilty}">
					<div>
						<input type="checkbox" disabled="disabled" ${fn:contains(newCamp.ca_possibilty, '계곡 물놀이') ? 'checked' : ''} />계곡 물놀이
						<input type="checkbox" disabled="disabled" ${fn:contains(newCamp.ca_possibilty, '운동장') ? 'checked' : ''} />운동장
						<input type="checkbox" disabled="disabled" ${fn:contains(newCamp.ca_possibilty, '강/물놀이') ? 'checked' : ''} />강/물놀이
						<input type="checkbox" disabled="disabled" ${fn:contains(newCamp.ca_possibilty, '낚시') ? 'checked' : ''} />낚시
						<input type="checkbox" disabled="disabled" ${fn:contains(newCamp.ca_possibilty, '산책로') ? 'checked' : ''} />산책로
						<input type="checkbox" disabled="disabled" ${fn:contains(newCamp.ca_possibilty, '농어촌체험시설') ? 'checked' : ''} />농어촌체험시설<br/>
						<input type="checkbox" disabled="disabled" ${fn:contains(newCamp.ca_possibilty, '해수욕') ? 'checked' : ''} />해수욕
						<input type="checkbox" disabled="disabled" ${fn:contains(newCamp.ca_possibilty, '수상레저') ? 'checked' : ''} />수상레저
						<input type="checkbox" disabled="disabled" ${fn:contains(newCamp.ca_possibilty, '수영장') ? 'checked' : ''} />수영장
						<input type="checkbox" disabled="disabled" ${fn:contains(newCamp.ca_possibilty, '어린이놀이시설') ? 'checked' : ''} />어린이놀이시설
						<input type="checkbox" disabled="disabled" ${fn:contains(newCamp.ca_possibilty, '청소년체험시설') ? 'checked' : ''} />청소년체험시설
						<span style="color: red"> api 변경정보 </span>
					</div>
					</c:if>
				</td>
			</tr>
			
			<tr>
				<th>테마환경</th>
				<td>
					<input type="checkbox" name="ca_theme" value="항공레저" ${fn:contains(oriCamp.ca_theme, '항공레저') ? 'checked' : ''} />항공레저
					<input type="checkbox" name="ca_theme" value="수상레저" ${fn:contains(oriCamp.ca_theme, '수상레저') ? 'checked' : ''} />수상레저
					<input type="checkbox" name="ca_theme" value="액티비티" ${fn:contains(oriCamp.ca_theme, '액티비티') ? 'checked' : ''} />액티비티
					<input type="checkbox" name="ca_theme" value="겨울눈꽃명소" ${fn:contains(oriCamp.ca_theme, '겨울눈꽃명소') ? 'checked' : ''} />겨울눈꽃명소
					<input type="checkbox" name="ca_theme" value="가을단풍명소" ${fn:contains(oriCamp.ca_theme, '가을단풍명소') ? 'checked' : ''} />가을단풍명소
					<input type="checkbox" name="ca_theme" value="수상레저" ${fn:contains(oriCamp.ca_theme, '수상레저') ? 'checked' : ''} />수상레저
					<input type="checkbox" name="ca_theme" value="봄꽃여행" ${fn:contains(oriCamp.ca_theme, '봄꽃여행') ? 'checked' : ''} />봄꽃여행<br/>
					<input type="checkbox" name="ca_theme" value="일출명소" ${fn:contains(oriCamp.ca_theme, '일출명소') ? 'checked' : ''} />일출명소
					<input type="checkbox" name="ca_theme" value="일몰명소" ${fn:contains(oriCamp.ca_theme, '일몰명소') ? 'checked' : ''} />일몰명소
					<input type="checkbox" name="ca_theme" value="걷기길" ${fn:contains(oriCamp.ca_theme, '걷기길') ? 'checked' : ''} />걷기길
					<input type="checkbox" name="ca_theme" value="낚시" ${fn:contains(oriCamp.ca_theme, '낚시') ? 'checked' : ''} />낚시
					<input type="checkbox" name="ca_theme" value="스키" ${fn:contains(oriCamp.ca_theme, '스키') ? 'checked' : ''} />스키
					<input type="checkbox" name="ca_theme" value="여름물놀이" ${fn:contains(oriCamp.ca_theme, '여름물놀이') ? 'checked' : ''} />여름물놀이

					<c:if test="${oriCamp.ca_theme ne newCamp.ca_theme}">
					<div>
						<input type="checkbox" disabled="disabled" ${fn:contains(newCamp.ca_theme, '항공레저') ? 'checked' : ''} />항공레저
						<input type="checkbox" disabled="disabled" ${fn:contains(newCamp.ca_theme, '수상레저') ? 'checked' : ''} />수상레저
						<input type="checkbox" disabled="disabled" ${fn:contains(newCamp.ca_theme, '액티비티') ? 'checked' : ''} />액티비티
						<input type="checkbox" disabled="disabled" ${fn:contains(newCamp.ca_theme, '겨울눈꽃명소') ? 'checked' : ''} />겨울눈꽃명소
						<input type="checkbox" disabled="disabled" ${fn:contains(newCamp.ca_theme, '가을단풍명소') ? 'checked' : ''} />가을단풍명소
						<input type="checkbox" disabled="disabled" ${fn:contains(newCamp.ca_theme, '수상레저') ? 'checked' : ''} />수상레저
						<input type="checkbox" disabled="disabled" ${fn:contains(newCamp.ca_theme, '봄꽃여행') ? 'checked' : ''} />봄꽃여행<br/>
						<input type="checkbox" disabled="disabled" ${fn:contains(newCamp.ca_theme, '일출명소') ? 'checked' : ''} />일출명소
						<input type="checkbox" disabled="disabled" ${fn:contains(newCamp.ca_theme, '일몰명소') ? 'checked' : ''} />일몰명소
						<input type="checkbox" disabled="disabled" ${fn:contains(newCamp.ca_theme, '걷기길') ? 'checked' : ''} />걷기길
						<input type="checkbox" disabled="disabled" ${fn:contains(newCamp.ca_theme, '낚시') ? 'checked' : ''} />낚시
						<input type="checkbox" disabled="disabled" ${fn:contains(newCamp.ca_theme, '스키') ? 'checked' : ''} />스키
						<input type="checkbox" disabled="disabled" ${fn:contains(newCamp.ca_theme, '여름물놀이') ? 'checked' : ''} />여름물놀이
						<span style="color: red"> api 변경정보 </span>
					</div>
					</c:if>
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<div>
						 * Camper에 등록된 정보는 현장상황과 다소 다를 수 있으니 반려동물 동반 여부, 부가 시설물, 추가차량 등 원활한 캠핑을 위해 꼭 필요한 사항은 해당 캠핑장에 미리 확인하시기 바랍니다.
					</div>
				</td>
			</tr>
		</table>
		<input type="submit" value="수정">
		<input type="button" value="목록" onclick="location.href='/campingAdmList.go ' ">
	</form>
	</div>
	
	<%@ include file="/resources/inc/footer.jsp" %>
</body>
<script>
var msg = ${msg};
if(msg!=''){
	alert(msg);
}
	
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
            document.getElementById('ca_postcode').value = data.zonecode;
            // console.log(data.zonecode);
            document.getElementById("ca_addr_default").value = addr;
            // console.log(addr);
            // 커서를 상세주소 필드로 이동한다.
            document.getElementById("ca_addr_detail").focus();
            
          
           console.log(data.sido);  // 시/도 (서울, 경기, 경북 등으로 표시)
            document.getElementById('ca_sido').value = data.sido;
            
           console.log(data.sigungu); // 시/군/구 (서초구, 광명시 , 곡성군 등으로 표시)
            document.getElementById('ca_sigungu').value = data.sigungu.split(' ',1);
            
            
        }
    }).open();
}
	
</script>
</html>