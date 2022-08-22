<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<% pageContext.setAttribute("newLine", "\n"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="//code.jquery.com/jquery-latest.min.js"></script>
<script src="resources/js/common.js" defer="defer"></script>
<link rel="stylesheet" href="resources/css/common.css" type="text/css"/>
<link rel="stylesheet" href="//fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap"/>
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css" />
<!--  jQuery UI CSS파일  -->
<link rel="stylesheet" href="//code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />
<!--  jQuery 기본 js파일 -->
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<!--  jQuery UI 라이브러리 js파일 -->
<script src="//code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
<style>
	#searchBox {
		margin: 20px 0;
		padding: 10px;
		box-sizing: border-box;
		border-radius: 10px;
		border: 1px solid #787878;
	}
	#searchBox > form > table {
		border: 1px solid #787878;
	}
	#searchBox > form > table > tbody > tr > th {
		padding: 10px;
		width: 120px;
		border: 1px solid #787878;
		background-color: #f9f9f9;
	}
	#searchBox > form > table > tbody > tr > td {
		border: 1px solid #787878;
	}
	#searchBox > form > table > tbody > tr > td > input[type="text"] {
		width: 99%;
	}
	#searchBox > form > #btn {
		text-align: center;
	}
	#searchBox > form > #btn > input[type="submit"] {
		margin-top: 20px;
		padding: 5px 10px;
		cursor: pointer;
		outline: none;
		border: none;
		color: #fff;
		background-color: #32405d;
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
	#campingList > li:hover {
		background-color: #fafafa;
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
		width: 960px;
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
	#campingList > li > div.parentBox {
		position: relative;
	}
	#campingList > li > div.parentBox > div {
		position: absolute;
		right: 12px;
		top: -75px;
	}
	#campingList > li > div.parentBox > div > input[type="button"]:not(:disabled) {
		padding: 5px 10px;
		outline: none;
		cursor: pointer;
		border: none;
		color: #fff;
		background-color: #32405d;
	}
</style>
</head>
<body>
				<div id="full">
					<h3>캠핑장 검색</h3>
					<div id="searchBox">
						<form action="campPopup.go" method="post" id="campingSearchfm">
							<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}" />
							<table>
								<tbody>
									<tr>
										<th>지역별</th>
										<td>
											<label><input type="checkbox" name="ca_sido" value="서울" <c:if test="${fn:contains(ca_sido, '서울')}">checked="checked"</c:if>/> 서울</label>
											<label><input type="checkbox" name="ca_sido" value="부산" <c:if test="${fn:contains(ca_sido, '부산')}">checked="checked"</c:if>/> 부산</label>
											<label><input type="checkbox" name="ca_sido" value="대구" <c:if test="${fn:contains(ca_sido, '대구')}">checked="checked"</c:if>/> 대구</label>
											<label><input type="checkbox" name="ca_sido" value="인천" <c:if test="${fn:contains(ca_sido, '인천')}">checked="checked"</c:if>/> 인천</label>
											<label><input type="checkbox" name="ca_sido" value="광주" <c:if test="${fn:contains(ca_sido, '광주')}">checked="checked"</c:if>/> 광주</label>
											<label><input type="checkbox" name="ca_sido" value="대전" <c:if test="${fn:contains(ca_sido, '대전')}">checked="checked"</c:if>/> 대전</label>
											<label><input type="checkbox" name="ca_sido" value="울산" <c:if test="${fn:contains(ca_sido, '울산')}">checked="checked"</c:if>/> 울산</label>
											<label><input type="checkbox" name="ca_sido" value="경기" <c:if test="${fn:contains(ca_sido, '경기')}">checked="checked"</c:if>/> 경기</label>
											<label><input type="checkbox" name="ca_sido" value="강원" <c:if test="${fn:contains(ca_sido, '강원')}">checked="checked"</c:if>/> 강원</label>
											<label><input type="checkbox" name="ca_sido" value="충북" <c:if test="${fn:contains(ca_sido, '충북')}">checked="checked"</c:if>/> 충북</label>
											<label><input type="checkbox" name="ca_sido" value="충남" <c:if test="${fn:contains(ca_sido, '충남')}">checked="checked"</c:if>/> 충남</label>
											<label><input type="checkbox" name="ca_sido" value="전북" <c:if test="${fn:contains(ca_sido, '전북')}">checked="checked"</c:if>/> 전북</label>
											<label><input type="checkbox" name="ca_sido" value="전남" <c:if test="${fn:contains(ca_sido, '전남')}">checked="checked"</c:if>/> 전남</label>
											<label><input type="checkbox" name="ca_sido" value="경북" <c:if test="${fn:contains(ca_sido, '경북')}">checked="checked"</c:if>/> 경북</label>
											<label><input type="checkbox" name="ca_sido" value="경남" <c:if test="${fn:contains(ca_sido, '경남')}">checked="checked"</c:if>/> 경남</label>
											<label><input type="checkbox" name="ca_sido" value="제주" <c:if test="${fn:contains(ca_sido, '제주')}">checked="checked"</c:if>/> 제주</label>
											<label><input type="checkbox" name="ca_sido" value="세종" <c:if test="${fn:contains(ca_sido, '세종')}">checked="checked"</c:if>/> 세종</label>
										</td>
									</tr>
									<tr>
										<th>테마별</th>
										<td>
											<label><input type="checkbox" name="ca_theme" value="항공레저" <c:if test="${fn:contains(ca_theme, '항공레저')}">checked="checked"</c:if>/> 항공레저</label>
											<label><input type="checkbox" name="ca_theme" value="수상레저" <c:if test="${fn:contains(ca_theme, '수상레저')}">checked="checked"</c:if>/> 수상레저</label>
											<label><input type="checkbox" name="ca_theme" value="액티비티" <c:if test="${fn:contains(ca_theme, '액티비티')}">checked="checked"</c:if>/> 액티비티</label>
											<label><input type="checkbox" name="ca_theme" value="겨울눈꽃명소" <c:if test="${fn:contains(ca_theme, '겨울눈꽃명소')}">checked="checked"</c:if>/> 겨울눈꽃명소</label>
											<label><input type="checkbox" name="ca_theme" value="가을단풍명소" <c:if test="${fn:contains(ca_theme, '가을단풍명소')}">checked="checked"</c:if>/> 가을단풍명소</label>
											<label><input type="checkbox" name="ca_theme" value="봄꽃여행" <c:if test="${fn:contains(ca_theme, '봄꽃여행')}">checked="checked"</c:if>/> 봄꽃여행</label>
											<label><input type="checkbox" name="ca_theme" value="일출명소" <c:if test="${fn:contains(ca_theme, '일출명소')}">checked="checked"</c:if>/> 일출명소</label>
											<label><input type="checkbox" name="ca_theme" value="일몰명소" <c:if test="${fn:contains(ca_theme, '일몰명소')}">checked="checked"</c:if>/> 일몰명소</label>
											<label><input type="checkbox" name="ca_theme" value="걷기길" <c:if test="${fn:contains(ca_theme, '걷기길')}">checked="checked"</c:if>/> 걷기길</label>
											<label><input type="checkbox" name="ca_theme" value="낚시" <c:if test="${fn:contains(ca_theme, '낚시')}">checked="checked"</c:if>/> 낚시</label>
											<label><input type="checkbox" name="ca_theme" value="스키" <c:if test="${fn:contains(ca_theme, '스키')}">checked="checked"</c:if>/> 스키</label>
											<label><input type="checkbox" name="ca_theme" value="여름물놀이" <c:if test="${fn:contains(ca_theme, '여름물놀이')}">checked="checked"</c:if>/> 여름물놀이</label>
										</td>
									</tr>
									<tr>
										<th>기타정보</th>
										<td>
											<label><input type="checkbox" name="ca_pet" value="가능" <c:if test="${ca_pet eq '가능'}">checked="checked"</c:if>/> 반려동물 동반 가능</label>
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
					<p id="totalCnt">총 <strong>${listCnt}</strong>건</p>
					
					<c:if test="${campingCnt eq 0}">검색결과가 없습니다.</c:if>
					<ul id="campingList">
					<c:forEach items="${list}" var="campingList">
						<li>
							<a href="/campingView.go?ca_idx=${campingList.ca_idx}" target="_blank">
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
							<span class="cnt cntLike">찜 ${campingList.cntLike}</span>
							<span class="cnt cntReview">후기 ${campingList.cntReview}</span>
							<div class="parentBox">
								<div>
									<input type="button" class="selectCamping" value="캠핑장 선택" data-idx="${campingList.ca_idx}" data-name="${campingList.ca_name}"/>
								</div>
							</div>
							<div style="clear:both;"></div>
						</li>
					</c:forEach>
					</ul>
					<ul class="pageInfo">	
						<!-- 이전페이지 버튼 -->
						<c:if test="${pageMaker.prev}">
						<li class="pageInfo_btn prev"><a href="javascript:;" data="${pageMaker.startPage-1}">이전</a></li>
						</c:if>
						
						<!-- 각 번호 페이지 버튼 -->
						<c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
						<li class="pageInfo_btn ${pageMaker.cri.pageNum eq num ? 'active' : ''}"><a href="javascript:;" data="${num}">${num}</a></li>
						</c:forEach>
						
						<!-- 다음페이지 버튼 -->
						<c:if test="${pageMaker.next}">
						<li class="pageInfo_btn next"><a href="javascript:;" data="${pageMaker.endPage+1}">다음</a></li>
						</c:if>
					</ul>	
					
				</div>
				<%@ include file="../../../resources/inc/footer.jsp" %>
</body>
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
		
		$('ul > li.pageInfo_btn > a').on('click', function() {
			$('input:hidden[name="pageNum"]').val($(this).attr('data'));
			$('#campingSearchfm').submit();
		});
	</script>
</html>