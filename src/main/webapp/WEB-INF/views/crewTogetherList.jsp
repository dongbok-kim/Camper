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
	
	#searchBox > form > #btn {
		text-align: center;
	}
	
	#searchBox > form > #btn > input[type="submit"] {
	
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
                                    <span>${recomList.ct_age}대 ${recomList.ct_gender} 모집인원:${recomList.ct_people_cnt}명</span>
                                </div>
                            </a>
                        </li>
                    </c:forEach>
                    </ul>
                    <div style="clear: both;"></div>
                    <div id="searchBox">
                        <form action="/crewTogetherList.do" method="post">
                            <table>
                                <tbody>
                                    <tr>
                                        <th>성별</th>
                                        <td>
                                            <label><input type="radio" name="gender" value="남자" /> 남자</label>
                                            <label><input type="radio" name="gender" value="여자" /> 여자</label>
                                            <label><input type="radio" name="gender" value="혼성" /> 혼성</label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th>캠핑종류</th>
                                        <td>
                                            <label><input type="checkbox" name="camping" value="백팩킹" /> 백팩킹</label>
                                            <label><input type="checkbox" name="camping" value="오토캠핑" /> 오토캠핑</label>
                                            <label><input type="checkbox" name="camping" value="글램핑" /> 글램핑</label>
                                            <label><input type="checkbox" name="camping" value="부쉬크래프트" /> 부쉬크래프트</label>
                                            <label><input type="checkbox" name="camping" value="비박" /> 비박</label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th>연령대</th>
                                        <td>
                                           <label><input type="checkbox" name="age" value="2" /> 20대</label>
                                           <label><input type="checkbox" name="age" value="3" /> 30대</label>
                                           <label><input type="checkbox" name="age" value="4" /> 40대</label>
                                           <label><input type="checkbox" name="age" value="5" /> 50대</label>
                                           <label><input type="checkbox" name="age" value="6" /> 60대 이상</label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th>기타정보</th>
                                        <td>
                                            <label><input type="checkbox" name="isPet" value="1" /> 애견동반가능</label>
                                            <label><input type="checkbox" name="isTool" value="1" /> 장비제공가능</label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th>날짜선택</th>
                                        <td>
                                            <input type="date" name="startDate" />
                                            <input type="date" name="endDate" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <th>캠핑장명</th>
                                        <td>
                                           <input type="text" name="keyword" />
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
							<div id="btn">
								<input type="submit" value="SEARCH" />
							</div>
                        </form>
                    </div>
                    <p id="totalCnt">총 <strong>${crewCnt}</strong>건<a href="">크루 모집하기</a></p>
                    <ul id="crewVote" class="crewList">
                    <c:forEach items="${list}" var="list">
                        <li>
                            <a href="/crewTogetherView.do?ct_idx=${list.ct_idx}">
                                <div class="imgBox">
                                    <span><i class="xi-maker"></i> ${list.ca_sido} ${fn:substring(list.ct_wish_start,5,7)}/${fn:substring(list.ct_wish_start,8,10)} ~ ${fn:substring(list.ct_wish_end,5,7)}/${fn:substring(list.ct_wish_end,8,10)}</span>
                                    <img src="${list.ca_img}" onerror="javascript:this.src='../../resources/images/no_picture.png';" alt="캠핑장 이미지" />
                                </div>
                                <div class="infoBox">
                                    <strong><span>모집중</span>${list.ct_title}</strong>
                                    <p>${list.ca_name}</p>
                                    <span>${list.mb_nickname}</span>
                                    <span>${list.ct_age}대 ${list.ct_gender} 모집인원:${list.ct_people_cnt}명</span>
                                </div>
                            </a>
                        </li>
                    </c:forEach>
                    </ul>
                    <div style="clear: both;"></div>
                </div>
<%@ include file="../../resources/inc/footer.jsp" %>
	<script></script>
</html>