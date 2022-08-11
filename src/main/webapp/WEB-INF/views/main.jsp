<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../../resources/inc/header.jsp" %>
				<a href=""><img src="resources/images/main_visual.jpg" alt="내 취향과 딱 맞는 여행 동행을 찾아보세요! 바로 구경하러 가볼까요? 여행친구찾기"></a>
<%@ include file="../../resources/inc/footer.jsp" %>
	
	
	<style>
	
	h1 {
	position : relative;
	display: block;
	left : 200px;
	
	}
	
	
	h2 {
	display: block;
	position : absolute;
	right:200px;
	
	
	
	}
	
	#camplist {	
	padding: 10px;
	display:block;
	position:relative;
	left : 250px;
	margin:0;
	width:900px;
	}
	
	
	
	#name {	
	font-size : 25px;
	}
	
	#zzim {
	display : inline-block;
	background-color:red;
	color : white;
	}
	
	#review {
	display : inline-block;
	background-color: lightgrey;
	color:white;
	}
	
	
	#crewlist {	
	padding: 10px;
	position: relative;
	display: inline-block;
	left : 250px;
	margin:0;
	float: left;
	width:300px;
	height: 400px;
	background-color:#DCDCDC;
	text-align: left;
	
	}
	
	#title1{
	color:green;
	font-size:18px;		
	}
	
	#title2{
	font-size:16px;
	font-weight: bold;
	text-align:center;
	}
	
	#date {
	position: absolute;
	display : inline-block;
	color: white;
	background-color:#696969;
	right:100px;
	bottom:350px;
	font-size:15px;
	opacity: 0.7;
	}
	
	#text {
	margin:0;
	font-size:12px;
	width:10px;
	text-align:right;	
	color:gray;
	}


	</style>
	<body>
	<h1>이 캠핑장 어때요? </h1>
	<h2><a href="#">+&nbsp;더보기</a></h2>
	
	<c:forEach items="${list}" var="camp">
	<table id="camplist">
			<tr>
				<td rowspan="4">
					<c:if test="${camp.ca_img ne ''}">
						<img src="${camp.ca_img}" alt="캠핑장사진" width="300">
					</c:if>					
					<c:if test="${camp.ca_img eq ''}">
						<img src="resources/images/no_picture.png" width="300">
					</c:if>
				</td>
				<td id="name">[${camp.ca_sido}&nbsp;${camp.ca_sigungu}]${camp.ca_name}</td>
			</tr>
			<tr>									
				<td>${camp.ca_intro}</td>
			</tr>
			<tr>
				<td>${camp.ca_addr_default}${camp.ca_addr_detail}</td>
			</tr>
			<tr>
				<td id="zzim">&nbsp;찜 ${camp.cl_cnt}&nbsp;</td>
				<td id="review">&nbsp;후기 ${camp.cr_cnt}&nbsp;</td>
			</tr>
			
		
		</table>
	</c:forEach>
	<h1>같이 가실래요?</h1>
	
	<c:forEach items="${crew}" var="crew">
	<table id ="crewlist">
			
			<tr>
				<td>
					<c:if test="${crew.img ne ''}">
						<img src="${crew.img}" alt="모집사진" width="200" height="150">
					</c:if>					
					<c:if test="${crew.img eq ''}">
						<img src="resources/images/no_picture.png" width="200" height="150">
					</c:if>
				
				</td>
				<td id="date">${crew.sido}&nbsp;${crew.ct_wish_start}~${crew.ct_wish_end}</td>
				
			</tr>
			<tr>									
				<td id="title1">모집중</td>
				
			</tr>
			
			<tr>
				<td id="title2">${crew.ct_title}</td>
			</tr>
			<tr>
				<td>${crew.camp_name}</td>
			</tr>
			<tr>
				<td>${crew.name}&nbsp;</td>
			</tr>
			<tr>				
				<td id="text">${crew.ct_age}대&nbsp;${crew.ct_gender}&nbsp;모집인원&nbsp;${crew.ct_people_cnt}명</td>											
			</tr>			
			<tr>								
				<td><a href="profile?mb_id=${crew.mb_id}">프로필&nbsp;${crew.name}</a></td>					
				<td><button onclick="javascript:window.open('profile?mb_id=${crew.mb_id}', 'profile', 'width=900, height=800');">
				팝업:${crew.name}</button></td>
			</tr>		
	</table>
	
	</c:forEach>
	
	</body>
	
	<script>
	
		
	
	</script>
</html>