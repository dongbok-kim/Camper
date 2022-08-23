<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../../resources/inc/header.jsp" %>
<style>
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
		padding: 10px;
		width: 120px;
		border: 1px solid #787878;
		background-color: #f9f9f9;
	}
	
	#searchBox > form > table > tbody > tr > td {
		padding: 10px;
		border: 1px solid #787878;
	}
	
	#searchBox > form > table > tbody > tr > td > input[name="ca_name"] {
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
	  
	#totalCnt > a {
		padding: 5px 10px;
		float: right;
		color: #fff;
		background-color: #32405d;
	}
</style>
				<div id="full">
                    <h3>크루추천</h3>
                    <ul id="crewVote" class="crewList">
                    <c:forEach items="${recomList}" var="recomList">                    
                        <li>
                            <a href="/crewTogetherView.do?ct_idx=${recomList.ct_idx}">
                                <div class="imgBox">
                                    <span><i class="xi-maker"></i> ${recomList.ca_sido} ${fn:substring(recomList.ct_wish_start,5,7)}/${fn:substring(recomList.ct_wish_start,8,10)} ~ ${fn:substring(recomList.ct_wish_end,5,7)}/${fn:substring(recomList.ct_wish_end,8,10)}</span>
                                    <img src="${recomList.ca_img}" onerror="javascript:this.src='../../resources/images/no_picture.png';" alt="캠핑장 이미지" />
                                </div>
                                <div class="infoBox">
                                    <strong><span>모집중</span>${recomList.ct_title}</strong>
                                    <p>${recomList.ca_name}</p>
                                    <span>${recomList.mb_nickname}</span>
                                    <span>${recomList.ct_age}대 ${recomList.ct_gender}<c:if test="${recomList.ct_gender ne '혼성'}">성</c:if> 모집인원:${recomList.ct_people_cnt}명</span>
                                </div>
                            </a>
                        </li>
                    </c:forEach>
                    </ul>
                    <div style="clear: both;"></div>
                    <div id="searchBox">
                        <form id="crewTogetherSearchForm" action="crewTogetherList.do" method="post" onsubmit="javascript:return checkCrewTogetherSearchForm();">
                        	<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}" />
                            <table>
                                <tbody>
                                    <tr>
                                        <th>성별</th>
                                        <td>
                                            <label><input type="radio" name="ct_gender" value="남" <c:if test="${ct_gender eq '남'}">checked="checked"</c:if> /> 남성</label>
                                            <label><input type="radio" name="ct_gender" value="여" <c:if test="${ct_gender eq '여'}">checked="checked"</c:if> /> 여성</label>
                                            <label><input type="radio" name="ct_gender" value="혼성" <c:if test="${ct_gender eq '혼성'}">checked="checked"</c:if> /> 혼성</label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th>캠핑종류</th>
                                        <td>
                                            <label><input type="checkbox" name="ct_camping_type" value="백패킹" <c:if test="${fn:contains(ct_camping_type, '백패킹')}">checked="checked"</c:if> /> 백패킹</label>
                                            <label><input type="checkbox" name="ct_camping_type" value="오토패킹" <c:if test="${fn:contains(ct_camping_type, '오토패킹')}">checked="checked"</c:if> /> 오토패킹</label>
                                            <label><input type="checkbox" name="ct_camping_type" value="글램핑" <c:if test="${fn:contains(ct_camping_type, '글램핑')}">checked="checked"</c:if> /> 글램핑</label>
                                            <label><input type="checkbox" name="ct_camping_type" value="부쉬크래프트" <c:if test="${fn:contains(ct_camping_type, '부쉬크래프트')}">checked="checked"</c:if> /> 부쉬크래프트</label>
                                            <label><input type="checkbox" name="ct_camping_type" value="비박" <c:if test="${fn:contains(ct_camping_type, '비박')}">checked="checked"</c:if> /> 비박</label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th>연령대</th>
                                        <td>
                                           <label><input type="checkbox" name="ct_age" value="20" <c:if test="${fn:contains(ct_age, 20)}">checked="checked"</c:if> /> 20대</label>
                                           <label><input type="checkbox" name="ct_age" value="30" <c:if test="${fn:contains(ct_age, 30)}">checked="checked"</c:if> /> 30대</label>
                                           <label><input type="checkbox" name="ct_age" value="40" <c:if test="${fn:contains(ct_age, 40)}">checked="checked"</c:if> /> 40대</label>
                                           <label><input type="checkbox" name="ct_age" value="50" <c:if test="${fn:contains(ct_age, 50)}">checked="checked"</c:if> /> 50대</label>
                                           <label><input type="checkbox" name="ct_age" value="60" <c:if test="${fn:contains(ct_age, 60)}">checked="checked"</c:if> /> 60대 이상</label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th>기타정보</th>
                                        <td>
                                            <label><input type="checkbox" name="ct_pet" value="1" <c:if test="${ct_pet eq 1}">checked="checked"</c:if> /> 애견동반가능</label>
                                            <label><input type="checkbox" name="ct_tool" value="1" <c:if test="${ct_tool eq 1}">checked="checked"</c:if> /> 장비제공가능</label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th>날짜선택</th>
                                        <td>
                                            <input type="text" name="ct_wish_start" id="startDate" class="datePicker" readonly value="${ct_wish_start}" />
											~ &nbsp; 
                                            <input type="text" name="ct_wish_end" id="endDate" class="datePicker" readonly value="${ct_wish_end}" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <th>캠핑장명</th>
                                        <td>
                                           <input type="text" name="ca_name" value="${ca_name}" />
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
							<div id="btn">
								<input type="submit" value="SEARCH" />
							</div>
                        </form>
                    </div>
                    <p id="totalCnt">총 <strong>${crewCnt}</strong>건<a href="crewTogetherReg.go">크루 모집하기</a></p>
                    <c:choose>
                    	<c:when test="${crewCnt eq 0}">
                    	검색 결과가 없습니다.
                    	</c:when>
                    	<c:otherwise>
		                    <ul id="crewVote" class="crewList">
		                    <c:forEach items="${list}" var="list">
		                        <li>
		                            <a href="crewTogetherView.do?ct_idx=${list.ct_idx}">
		                                <div class="imgBox">
		                                    <span><i class="xi-maker"></i> ${list.ca_sido} ${fn:substring(list.ct_wish_start,5,7)}/${fn:substring(list.ct_wish_start,8,10)} ~ ${fn:substring(list.ct_wish_end,5,7)}/${fn:substring(list.ct_wish_end,8,10)}</span>
		                                    <img src="${list.ca_img}" onerror="javascript:this.src='../../resources/images/no_picture.png';" alt="캠핑장 이미지" />
		                                </div>
		                                <div class="infoBox">
		                                    <strong><span>모집중</span>${list.ct_title}</strong>
		                                    <p>${list.ca_name}</p>
		                                    <span>${list.mb_nickname}</span>
		                                    <span>${list.ct_age}대 ${list.ct_gender}<c:if test="${list.ct_gender ne '혼성'}">성</c:if> 모집인원:${list.ct_people_cnt}명</span>
		                                </div>
		                            </a>
		                        </li>
		                    </c:forEach>
		                    </ul>
                    	</c:otherwise>
                    </c:choose>
                    <div style="clear: both;"></div>
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
<%@ include file="../../resources/inc/footer.jsp" %>
	<script>
		$('ul > li.pageInfo_btn > a').on('click', function() {
			$('input:hidden[name="pageNum"]').val($(this).attr('data'));
			$('#crewTogetherSearchForm').submit();
		});
		
		$('#startDate').datepicker({
			minDate: 0,
			dateFormat: 'yy-mm-dd',
			showOn: 'both',
			buttonImageOnly: true,
			buttonImage: '../../resources/images/ico_calendar.jpg',
			onSelect: function(selected) {
				var dt = new Date(selected);
				dt.setDate(dt.getDate());
				$('#endDate').datepicker('option', 'minDate', dt);
			}
		});
		
		var minEndDate = $.trim($('#startDate').val()) == '' ? 0 : $('#startDate').val();
		
		$('#endDate').datepicker({
			minDate: minEndDate,
			dateFormat: 'yy-mm-dd',
			showOn: 'both',
			buttonImageOnly: true,
			buttonImage: '../../resources/images/ico_calendar.jpg',
			onSelect: function(selected) {
				var dt = new Date(selected);
				dt.setDate(dt.getDate());
				$('#startDate').datepicker('option', 'maxDate', dt);
			}
		});
		
		function checkCrewTogetherSearchForm() {
			if($.trim($('#startDate').val()) == '' || $.trim($('#endDate').val()) == '') {
				$('#startDate, #endDate').val('');
			}
		}
	</script>
</html>