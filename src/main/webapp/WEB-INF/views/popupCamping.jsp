<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../../resources/inc/header.jsp" %>
<style>
	#campingVote {
		margin: 0;
		padding: 0;
		list-style: none;
		text-align: center;
	}
	#campingVote > li {
		margin: 0 20px;
		display: inline-block;
		width: 21%;
	}
	#campingVote > li > a {
		text-align: left;
	}
	#campingVote > li > a > img {
		max-width: 100%;
	}
	#campingVote > li > a > strong, #campingVote > li > a > span {
		display: block;
	}
	#searchBox {
		padding: 10px;
		box-sizing: border-box;
		border-radius: 10px;
		border: 1px solid #787878;
	}
	#searchBox > form > table {
		border: 1px solid #787878;
	}
	#searchBox > form > table > tbody > tr > th {
		border: 1px solid #787878;
		background-color: #f9f9f9;
	}
	#searchBox > form > table > tbody > tr > td {
		border: 1px solid #787878;
	}
	#searchBox > form > table > tbody > tr > td > input[type="text"] {
		width: 90%;
	}
	#searchBox > form > #btn {
		text-align: center;
	}
	#searchBox > form > #btn > input[type="submit"] {
		
	}
	#totalCnt > strong {
		color: orange;
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
</style>
				<div id="full">
					<h3>캠핑장 추천</h3>
					
					<ul id="campingVote">
					<c:forEach items="${campingRecom}" var="campingRecom">
						<li>
							<a href="/campingView.go?ca_idx=${campingRecom.ca_idx}">
								<c:choose>
									<c:when test="${campingRecom.ca_img ne ''}">
										<img src="${campingRecom.ca_img}" onerror="javascript:this.src='../../resources/images/no_picture.png';" alt="캠핑장 이미지" />
									</c:when>
									<c:otherwise>
										<img src="../../resources/images/no_picture.png"/>
									</c:otherwise>
								</c:choose>
								<strong>${campingRecom.ca_name}</strong>
								<span>${campingRecom.ca_sido} ${campingRecom.ca_sigungu}</span>
							</a>
						</li>
					</c:forEach>
					</ul>
					
					<div id="searchBox">
						<form action="campingSearch" method="post">
							<table>
								<tbody>
									<tr>
										<th>지역별</th>
										<td>
											<label><input type="checkbox" name="ca_sido" value="서울" /> 서울</label>
											<label><input type="checkbox" name="ca_sido" value="부산" /> 부산</label>
											<label><input type="checkbox" name="ca_sido" value="대구" /> 대구</label>
											<label><input type="checkbox" name="ca_sido" value="인천" /> 인천</label>
											<label><input type="checkbox" name="ca_sido" value="광주" /> 광주</label>
											<label><input type="checkbox" name="ca_sido" value="대전" /> 대전</label>
											<label><input type="checkbox" name="ca_sido" value="울산" /> 울산</label>
											<label><input type="checkbox" name="ca_sido" value="경기" /> 경기</label>
											<label><input type="checkbox" name="ca_sido" value="강원" /> 강원</label>
											<label><input type="checkbox" name="ca_sido" value="충북" /> 충북</label>
											<label><input type="checkbox" name="ca_sido" value="충남" /> 충남</label>
											<label><input type="checkbox" name="ca_sido" value="전북" /> 전북</label>
											<label><input type="checkbox" name="ca_sido" value="전남" /> 전남</label>
											<label><input type="checkbox" name="ca_sido" value="경북" /> 경북</label>
											<label><input type="checkbox" name="ca_sido" value="경남" /> 경남</label>
											<label><input type="checkbox" name="ca_sido" value="제주" /> 제주</label>
											<label><input type="checkbox" name="ca_sido" value="세종" /> 세종</label>
										</td>
									</tr>
									<tr>
										<th>테마별</th>
										<td>
											<label><input type="checkbox" name="ca_theme" value="항공레저" /> 항공레저</label>
											<label><input type="checkbox" name="ca_theme" value="수상레저" /> 수상레저</label>
											<label><input type="checkbox" name="ca_theme" value="액티비티" /> 액티비티</label>
											<label><input type="checkbox" name="ca_theme" value="겨울눈꽃명소" /> 겨울눈꽃명소</label>
											<label><input type="checkbox" name="ca_theme" value="가을단풍명소" /> 가을단풍명소</label>
											<label><input type="checkbox" name="ca_theme" value="수상레저" /> 수상레저</label>
											<label><input type="checkbox" name="ca_theme" value="봄꽃여행" /> 봄꽃여행</label>
											<label><input type="checkbox" name="ca_theme" value="일출명소" /> 일출명소</label>
											<label><input type="checkbox" name="ca_theme" value="일몰명소" /> 일몰명소</label>
											<label><input type="checkbox" name="ca_theme" value="걷기길" /> 걷기길</label>
											<label><input type="checkbox" name="ca_theme" value="낚시" /> 낚시</label>
											<label><input type="checkbox" name="ca_theme" value="스키" /> 스키</label>
											<label><input type="checkbox" name="ca_theme" value="여름물놀이" /> 여름물놀이</label>
										</td>
									</tr>
									<tr>
										<th>기타정보</th>
										<td>
											<label><input type="checkbox" name="ca_pet" value="1" /> 반려동물 동반 가능</label>
										</td>
									</tr>
									<tr>
										<th>캠핑장명</th>
										<td><input type="text" name="ca_name" /></td>
									</tr>
								</tbody>
							</table>
							<div id="btn">
								<input type="submit" value="SEARCH" />
							</div>
						</form>
					</div>
					<p id="totalCnt">총 <strong>${list.size()}</strong>건</p>
					
					<ul id="campingList">
					<c:forEach items="${list}" var="campingList">
						<li>
							<a href="/campingView.go?ca_idx=${campingList.ca_idx}">
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
									<span class="address">${campingList.ca_addr_default}</span>
								</span>
							</a>
							<span class="cnt cntLike">좋아요 ${campingList.cntLike}</span>
							<span class="cnt cntReview">후기 ${campingList.cntReview}</span>
							<div style="clear:both;"></div>
							<input type="button" class="selectCamping" value="캠핑장 선택" data-idx="${campingList.ca_idx}" data-name="${campingList.ca_name}"/>
						</li>
					</c:forEach>
					</ul>
					
				</div>
<%@ include file="../../resources/inc/footer.jsp" %>
	<script>	
		$('.selectCamping').on('click', function(){
			 var name = $(this).data('name');
			 var idx = $(this).data('idx');
			 $(opener.document).find("#campingSelect").text(name);
			 $(opener.document).find("#campingSelectIdx").val(idx);
			 window.close();
		});
		
		var selectIdx = $(opener.document).find("#campingSelectIdx").val();
		$('.selectCamping[data-idx='+selectIdx+']').attr('disabled', 'disabled');
	</script>
</html>