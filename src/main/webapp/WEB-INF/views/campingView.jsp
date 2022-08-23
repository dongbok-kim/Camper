<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../../resources/inc/header.jsp" %>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=5441fe9e7268a0c759538ea32950dac7"></script>
<style>
	#imgBox {
		float: left !important;
		max-width: 200px !important;
		width: 100% !important;
	}
	#imgBox > img {
		max-width: 100%;
	}
	#infoBox {
		padding-left: 20px;
		float: left;
		max-width: 1000px;
		width: 100%;
		box-sizing: border-box;
	}
	#infoBox > table {
		border: 1px solid #787878;
	}
	#infoBox > table > tbody > tr > th {
		padding: 10px;
		border: 1px solid #787878;
		background-color: #f9f9f9;
	}
	#infoBox > table > tbody > tr > td {
		padding: 10px;
		border: 1px solid #787878;
	}
	#btn {
		margin: 10px 0 20px 0;
		text-align: right;
	}
	#btn > #btnCrew {
		padding: 5px 10px;
		display: inline-block;
		width: 120px;
		text-align: center;
		border: 1px solid #787878;
	}
	#btn > #likeCnt {
		padding: 5px 10px;
		display: inline-block;
		width: 120px;
		text-align: center;
		color: #fff;
		border: 1px solid #787878;
		background-color: #32405d;
	}
	#btn > #btnLike {
		padding: 5px 10px;
		display: inline-block;
		width: 120px;
		text-align: center;
		color: #fff;
		border: 1px solid #787878;
		background-color: #ff0000;
	}
	#tab {
		margin: 0;
		padding: 0;
		list-style: none;
	}
	#tab > li {
		float: left;
		width: 25%;
		height: 50px;
		line-height: 50px;
		text-align: center;
		font-size: 18px;
		cursor: pointer;
		box-sizing: border-box;
		border: 1px solid black;
	}
	#tab > li.active {
		font-weight: bold;
		color: #fff;
		background-color: #32405d;
	}
	#tabContent {
		margin: 0;
		padding: 0;
		list-style: none;
	}
	#tabContent > li > #ico {
		margin: 0;
		padding: 0;
		list-style: none;
		background-color: #f9f9f9;
	}
	#tabContent > li > #ico > li {
		padding: 10px;
		display: inline-block;
		width: 80px;
		height: 80px;
		background-position: 30px 15px;
		background-repeat: no-repeat;
	}
	#tabContent > li > #ico > li:before {
		padding-top: 40px;
		display: block;
		width: 75px;
		height: 30px;
		text-align: center;
	}
	#tabContent > li:not(:first-child) {
		display: none;
	}
	#tabContent > li > #ico > #icoWifi {background-image: url('../../resources/images/ico_wifi.png');}
	#tabContent > li > #ico > #icoWifi:before {content: '무선인터넷';}
	#tabContent > li > #ico > #icoPool {background-image: url('../../resources/images/ico_pool.png');}
	#tabContent > li > #ico > #icoPool:before {content: '물놀이장';}
	#tabContent > li > #ico > #icoSink {background-image: url('../../resources/images/ico_sink.png');}
	#tabContent > li > #ico > #icoSink:before {content: '';}
	#tabContent > li > #ico > #icoShower {background-image: url('../../resources/images/ico_shower.png');}
	#tabContent > li > #ico > #icoShower:before {content: '';}
	#tabContent > li > #ico > #icoToilet {background-image: url('../../resources/images/ico_toilet.png');}
	#tabContent > li > #ico > #icoToilet:before {content: '';}
	#tabContent > li > #ico > #icoVolt {background-image: url('../../resources/images/ico_volt.png');}
	#tabContent > li > #ico > #icoVolt:before {content: '전기';}
	#tabContent > li > #ico > #icoWood {background-image: url('../../resources/images/ico_wood.png');}
	#tabContent > li > #ico > #icoWood:before {content: '장작판매';}
	#tabContent > li > #ico > #icoMart {background-image: url('../../resources/images/ico_mart.png');}
	#tabContent > li > #ico > #icoMart:before {content: '마트.편의점';}
	#tabContent > li > #ico > #icoWalk {background-image: url('../../resources/images/ico_walk.png');}
	#tabContent > li > #ico > #icoWalk:before {content: '산책로';}
	#tabContent > li > #ico > #icoGround {background-image: url('../../resources/images/ico_ground.png');}
	#tabContent > li > #ico > #icoGround:before {content: '운동장';}
	#tabContent > li > #ico > #icoPlayZone {background-image: url('../../resources/images/ico_playzone.png');}
	#tabContent > li > #ico > #icoPlayZone:before {content: '놀이터';}
	#tabContent > li > #ico > #icoHotWater {background-image: url('../../resources/images/ico_hotwater.png');}
	#tabContent > li > #ico > #icoHotWater:before {content: '온수';}
	#tabContent > li > #ico > #icoSports {background-image: url('../../resources/images/ico_sports.png');}
	#tabContent > li > #ico > #icoSports:before {content: '운동시설';}
	#tabContent > li > #ico > #icoTramp {background-image: url('../../resources/images/ico_tramp.png');}
	#tabContent > li > #ico > #icoTramp:before {content: '트렘폴린';}
	#tabContent > li > #otherInfo, #tabContent > li > #otherInfo > tbody > tr > th, #tabContent > li > #otherInfo > tbody > tr > td {
		margin: 20px 0;
		padding: 10px;
		vertical-align: top;
		border: 1px solid #787878;
	}
	#tabContent > li > #otherInfo > tbody > tr > th {
		background-color: #f9f9f9;
	}
	#tabContent > li > #campingReview {
		border: 1px solid #787878;
	}
	#tabContent > li > #campingReview > thead > tr > th {
		text-align: center;
		border: 1px solid #787878;
		background-color: #f9f9f9;
	}
	#tabContent > li > #campingReview > tbody > tr > td {
		border: 1px solid #787878;
	}
	#tabContent > li > #campingReview > tbody > tr > td.subject {
		cursor: pointer;
	}
	#tabContent > li > #campingReview > tbody > tr > td.subject:not(.active) {
		max-width: 200px;
		text-overflow: ellipsis;
		overflow: hidden;
		white-space: nowrap;
	}
	#map {
		width: 100%;
		height: 400px;
	}
	#infoWindow {
		width: 150px;
		height: 20px;
		overflow: hidden;
	}
	
	
	#campingReview {
		border: 1px solid #787878;
	}
	#campingReview > thead > tr > th {
		padding: 10px;
		border: 1px solid #787878;
		background-color: #f9f9f9;
	}
	#campingReview > tbody > tr > td {
		padding: 10px;
		border: 1px solid #787878;
	}
	
	 .crewList {
      margin: 0;
      padding: 0;
      list-style: none;
      text-align: center;
   }
   
   .crewList > li {
      margin: 10px;
      float: left;
      max-width: 280px;
      width: 100%;
      text-align: left;
      box-sizing: border-box;
   }
   
   .crewList > li > a {
      
   }
   
   .crewList > li > a > div.imgBox {
      position: relative;
   }
   
   .crewList > li > a > div.imgBox > span {
      padding: 0 5px;
      position: absolute;
      top: 10px;
      left: 10px;
      display: inline-block;
      max-width: 180px;
      width: 100%;
      color: #fff;
      border-radius: 20px;
      background: rgba(0, 0, 0, 0.5);
   }
   
   .crewList > li > a > div.imgBox > span > i {
      border-radius: 10px;
      color: #000;
      background-color: #fff;
   }
   
   .crewList > li > a > div.imgBox > img {
      max-width: 100%;
   }
   
   .crewList > li > a > div.infoBox {
      background-color: #f0f0f0;
   }
   
   .crewList > li > a > div.infoBox > strong > span {
      margin-right: 5px;
      color: rgb(85, 207, 85);
   }
   
   .crewList > li > a > div.infoBox > p {
      line-height: 0;
   }
   
   .crewList > li > a > div.infoBox > span {
      font-size: 13px;
   }
   
   .crewList > li > a > div.infoBox > span:first-child {
      float: left;
   }
   
   .crewList > li > a > div.infoBox > span:last-child {
      float: right;
   }
	
</style>

				<h3>${campingView.ca_name}</h3>
				<div id="imgBox">
					<c:if test="${campingView.ca_img eq ''}"><img src="resources/images/no_picture.png"/></c:if>
					<img src="${campingView.ca_img}">
				</div>
				<div id="infoBox">
					<table>
						<colgroup>
							<col width="200"></col>
							<col width="*"></col>
						</colgroup>
						<tbody>
							<tr>
								<th>주소</th>
								<td>${campingView.ca_addr_default}</td>
							</tr>
							<tr>
								<th>전화번호</th>
								<td>${campingView.ca_tel}</td>
							</tr>
							<tr>
								<th>운영일</th>
								<td>${campingView.ca_oper_date}</td>
							</tr>
							<tr>
								<th>업종</th>
								<td>${campingView.ca_induty}</td>
							</tr>
							<tr>
								<th>운영계절</th>
								<td>${campingView.ca_oper_period}</td>
							</tr>
							<tr>
								<th>주변이용가능시설</th>
								<td>${campingView.ca_possibilty}</td>
							</tr>
							<tr>
								<th>캠핑장 환경</th>
								<td>${campingView.ca_environment}</td>
							</tr>
							<tr>
								<th>캠핑장 테마</th>
								<td>${campingView.ca_theme}</td>
							</tr>
						</tbody>
					</table>
					<div id="btn">
						<a href="crewTogetherReg.go?ca_idx=${campingView.ca_idx}&amp;ca_name=${campingView.ca_name}" id="btnCrew">크루 모집하기</a>
						<span id="likeCnt">좋아요 수 : ${campingView.cntLike}</span>
						<c:choose>
							<c:when test="${clIdx eq null}">
								<a href="campingLike.do?ca_idx=${campingView.ca_idx}" id="btnLike">♡ 찜하기</a>
							</c:when>
							<c:otherwise>
								<a href="campingLikeDelete.do?ca_idx=${campingView.ca_idx}" id="btnLike">♥ 찜해제</a>
							</c:otherwise>
						</c:choose>
					</div>
				</div>
				<div id="full">
					<ul id="tab">
						<li class="active">캠핑장 시설 정보</li>
						<li>캠핑장 위치</li>
						<li>캠핑장 후기</li>
						<li>크루 모집</li>
					</ul>
					<ul id="tabContent">
						<!-- 캠핑장 시설 정보 -->
						<li>
							<h2>부대시설</h2>
							<ul id="ico">
								<c:forEach items="${icoList}" var="ico">
									<li id="${ico}"></li>
								</c:forEach>
							</ul>
							<table id="otherInfo">
								<colgroup>
									<col width="200"></col>
									<col width="*"></col>
								</colgroup>
								<tbody>
									<tr>
										<th>애견동반가능여부</th>
										<td>
											${campingView.ca_pet}
											<p>(※ 실제 결과는 현장사정 및 계절에 따라 달라질 수 있으니 캠핑장 사업주에 직접 확인 후 이용바랍니다.)</p>
										</td>
									</tr>
									<tr>
										<th>캠핑장비대여</th>
										<td>${campingView.ca_tool}</td>
									</tr>
									<tr>
										<th>화로대</th>
										<td>${campingView.ca_fire_cnt}</td>
									</tr>
									<tr>
										<td colspan="2">
											* Camper에 등록된 정보는 현장사정과 다소 다를 수 있으니 반려동반 여부, 부가 시설물, 추가차량 등 원활한 캠핑을 위해 꼭 필요한 사항은 해당 캠핑장에 미리 확인하시기 바랍니다.
										</td>
									</tr>
								</tbody>
							</table>
						</li>
						
						<!-- 캠핑장 위치 -->
						<li>
							<div id="map"></div>
						</li>
						
						<!-- 캠핑장 후기 -->
						<li>
							<table id="campingReview">
								<colgroup>
									<col width="58"></col>
									<col width="120"></col>
									<col width="*"></col>
									<col width="120"></col>
									<col width="150"></col>
								</colgroup>
								<thead>
									<tr>
										<th>번호</th>
										<th>평가항목</th>
										<th>후기내용</th>
										<th>작성자</th>
										<th>후기작성일시</th>
									</tr>
								</thead>
								<tbody>
								<c:choose>
									<c:when test="${campingReview.size() == 0}">
										<tr align="center" height="180">
											<td colspan="5">등록된 캠핑장 후기가 없습니다.</td>
										</tr>
									</c:when>
									<c:otherwise>
									<c:forEach items="${campingReview}" var="campingReview">										
										<tr>
											<td>${campingReview.cr_idx}</td>
											<td>${campingReview.cr_assessment}</td>
											<td class="subject">${campingReview.cr_content}</td>
											<td>${campingReview.mb_id}</td>
											<td>${campingReview.cr_datetime}</td>
										</tr>
									</c:forEach>
									</c:otherwise>
								</c:choose>	
								</tbody>
							</table>
						</li>
						
						<!-- 크루모집 -->
						<li>
							<c:if test="${campingTogether.size() == 0}"><div style="text-align: center; height: 180px; line-height: 180px;">현재 등록된 크루모집이 없습니다.</div></c:if>
							<ul id="crewVote" class="crewList">
								<c:forEach items="${campingTogether}" var="campingTogether">
			                        <li>
			                            <a href="crewTogetherView.do?ct_idx=${campingTogether.ct_idx}"">
			                                <div class="imgBox"> 
			                                    <span><i class="xi-maker"></i> ${campingTogether.ca_sido}  ${fn:substring(campingTogether.ct_wish_start,5,7)}/${fn:substring(campingTogether.ct_wish_start,8,10)} ~ ${fn:substring(campingTogether.ct_wish_end,5,7)}/${fn:substring(campingTogether.ct_wish_end,8,10)}</span>
			                                    <c:choose>
				                                    <c:when test="${campingTogether.ca_img ne ''}">
				                                  	  	<img src="${campingTogether.ca_img}" alt="크루추천 이미지" />
				                                    </c:when>
				                                    <c:otherwise>
			                                   			 <img src="../../resources/images/no_picture.png"/>
			                                   		</c:otherwise>
			                                    </c:choose>
			                                </div>
			                                <div class="infoBox">
			                                    <strong><span>모집중</span>${campingTogether.ct_title}</strong>
			                                    <p>${campingTogether.ca_name}</p>
			                                    <span>${campingTogether.mb_nickname}</span>
			                                    <span>${campingTogether.ct_age}대 ${campingTogether.ct_gender} 모집인원 ${campingTogether.ct_people_cnt}명</span>
			                                </div>
			                            </a>
			                        </li>
			                    </c:forEach> 		              
		                    </ul>
						</li>
					</ul>
				</div>
				<div style="clear: both;"></div>
				<div style="margin-top: 20px; text-align: center;">
					<a href="campingList.go" class="btn btnList">목록</a>
				</div>
				
<%@ include file="../../resources/inc/footer.jsp" %>
<script>
	$('#full > #tab > li').on('click', function() {
		$('#full > #tab > li').removeClass();
		$(this).addClass('active');
		
		$('#tabContent > li').hide();
		$('#tabContent > li').eq($(this).index()).show();
	});
	
	$('#tabContent > li > #campingReview > tbody > tr > td.subject').on('click', function() {
		$('#tabContent > li > #campingReview > tbody > tr > td.subject').removeClass('active');
		$(this).addClass('active');
	});
	
	
	//카카오 지도 api
	var mapPosition = new kakao.maps.LatLng(${campingView.ca_mapY}, ${campingView.ca_mapX});
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = { 
        center: mapPosition, // 지도의 중심좌표
        level: 5 // 지도의 확대 레벨
    };

	var map = new kakao.maps.Map(mapContainer, mapOption);
	
	// 마커가 표시될 위치입니다 
	var markerPosition  = mapPosition; 
	
	// 마커를 생성합니다
	var marker = new kakao.maps.Marker({
	    position: markerPosition
	});
	
	// 마커가 지도 위에 표시되도록 설정합니다
	marker.setMap(map);
	
	// 캠핑장 이름, 주소, 연락처 표시 
	var iwContent = '<div id="infoWindow">'+'${campingView.ca_name}'+'</div>', // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
	    iwPosition = mapPosition; //인포윈도우 표시 위치입니다

	// 인포윈도우를 생성합니다
	var infowindow = new kakao.maps.InfoWindow({
	    position : iwPosition, 
	    content : iwContent 
	});
	  
	// 마커 위에 인포윈도우를 표시합니다. 두번째 파라미터인 marker를 넣어주지 않으면 지도 위에 표시됩니다
	infowindow.open(map, marker);
	
	$('#tab > li').eq(1).on('click', function() {
		map.relayout();
		map.setCenter(mapPosition);
	});
	
	
	
	
	

</script>
</html>