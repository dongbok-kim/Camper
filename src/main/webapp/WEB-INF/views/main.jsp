<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../../resources/inc/header.jsp" %>
<style>
	h3 {
		margin-top: 30px;
		display: inline-block;
		width: 94%;
	}

	h4.more {
		display: inline-block;
		width: 5%;
		text-align: right;
	}

	#campingList {
		margin: 0;
		padding: 0;
		list-style: none;
	}
	#campingList > li {
		margin: 10px 0;
	}
	#campingList > li > a > span.imgBox {
		float: left;
		width: 200px;
	}
	#campingList > li > a > span.imgBox > img {
		max-width: 100%;
	}
	#campingList > li > a > span.infoBox {
		margin: 0px 10px;
		float: left;
		width: 980px;
		line-height: 180%;
	}
	#campingList > li > a > span.infoBox > strong {
		display: inline-block;
		width: 100%;
	}
	#campingList > li > a span.infoBox > span.intro {
		font-size: 13px;
		color: #787878;
	}
	#campingList > li > a > span.infoBox > span.address {
		padding-left: 24px;
		display: block;
		font-size: 12px;
		background-image: url('../../resources/images/ico_map.png');
		background-repeat: no-repeat;
		background-position: 0px 3px;
	}
	#campingList > li > .cnt {
		margin: 10px 0px 10px 5px;
		padding: 0px 10px;
		display: inline-block;
	}
	#campingList > li > .cnt.cntLike {
		color: #fff;
		background-color: #d6394c;
	}
	#campingList > li > .cnt.cntReview {
		color: #fff;
		background-color: #585858;
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
		max-width: 120px;
		width: 100%;
		font-size: 11px;
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
		max-height: 186px;
	}
	
	.crewList > li > a > div.infoBox {
		background-color: #f0f0f0;
	}
	
	.crewList > li > a > div.infoBox > strong {
		display: block;
		text-overflow: ellipsis;
		overflow: hidden;
		white-space: nowrap;
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
				<a href="crewTogetherList.do"><img src="resources/images/main_visual.jpg" alt="내 취향과 딱 맞는 여행 동행을 찾아보세요! 바로 구경하러 가볼까요? 여행친구찾기"></a>
				<h3>이 캠핑장 어때요? </h3>
				<h4 class="more"><a href="campingList.go">+더보기</a></h4>
				<c:forEach items="${list}" var="campingList">
				<ul id="campingList">
					<li>
						<a href="campingView.go?ca_idx=${campingList.ca_idx}">
							<span class="imgBox">
								<c:choose>
									<c:when test="${campingList.ca_img ne ''}">
										<img src="${campingList.ca_img}" onerror="javascript:this.src='../../resources/images/no_picture.png';" alt="캠핑장 이미지" />
									</c:when>
									<c:otherwise>
										<img src="../../resources/images/no_picture.png"/>
									</c:otherwise>
								</c:choose>
							</span>
							<span class="infoBox">
								<strong>[${campingList.ca_sido} ${campingList.ca_sigungu}] ${campingList.ca_name}</strong>
								<c:choose>
									<c:when test="${campingList.ca_intro ne ''}">
										<span class="intro">${campingList.ca_intro}</span>
									</c:when>
									<c:otherwise>
										<span class="intro">등록된 소개글이 없습니다.</span>
									</c:otherwise>
								</c:choose>
								<span class="address">${campingList.ca_addr_default} ${campingList.ca_addr_detail}</span>
							</span>
						</a>
						<span class="cnt cntLike">찜 ${campingList.cl_cnt}</span>
						<span class="cnt cntReview">후기 ${campingList.cr_cnt}</span>
						<div style="clear:both;"></div>
					</li>
				</ul>
				</c:forEach>
				
				<h3>같이 가실래요?</h3>
				<h4 class="more"><a href="crewTogetherList.do">+더보기</a></h4>
                <ul id="crewVote" class="crewList">
				<c:forEach items="${crew}" var="crew">
                    <li>
                        <a href="crewTogetherView.do?ct_idx=${crew.ct_idx}">
                            <div class="imgBox">
                                <span><i class="xi-maker"></i> ${crew.sido} ${fn:substring(crew.ct_wish_start,5,7)}/${fn:substring(crew.ct_wish_start,8,10)} ~ ${fn:substring(crew.ct_wish_end,5,7)}/${fn:substring(crew.ct_wish_end,8,10)}</span>
                                <img src="${crew.img}" onerror="javascript:this.src='../../resources/images/no_picture.png';" alt="캠핑장 이미지" />
                            </div>
                            <div class="infoBox">
                                <strong><span>모집중</span>${crew.ct_title}</strong>
                                <p>${crew.camp_name}</p>
                                <span>${crew.name}</span>
                                <span>${crew.ct_age}대 ${crew.ct_gender} 모집인원:${crew.ct_people_cnt}명</span>
                            </div>
                        </a>
                    </li>
                </c:forEach>
                </ul>
<%@ include file="../../resources/inc/footer.jsp" %>
	<script>	
		var msg = "${msg}";
	    if (msg != "") {
	        window.alert(msg);
	    }
	</script>
</html>