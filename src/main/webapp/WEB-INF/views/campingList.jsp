<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../../resources/inc/header.jsp" %>


		
		<table>
			<c:forEach items="${campingList}" var="campingList">
						
				<div class="c_list update">
					<a href="campingView.go?ca_idx=${campingList.ca_idx}" class="dc_none"><span class="skip"></span>
						<div class="img_box">
							<img src="${campingList.ca_img}">
							</div>
						</div> </a>
					<div class="camp_cont">
						
						<h2 class="camp_tt">
							<a href="campingView?ca_idx=${campingList.ca_idx}">[${campingList.ca_sido}] ${campingList.ca_name} </a>
						</h2>
						<span class="camp_stt">${campingList.ca_intro}</span> <span class="camp_txt"> <a href="/캠핑장 상세보기"><span class="skip"></span></a>
								</span>
						<ul class="camp_info01">
							<li class="addr">${ca_addr_default}  ${campingList.ca_name} </li>
							</ul>
						<p class="item_group">
							
							<span class="item_t02">좋아요 ${campingList.cntLike}</span> <span class="item_t03">후기 ${campingList.cntReview}</span> 
						</p>
					</div>
				</div> 
			</c:forEach>				
		</table>
			
			

<%@ include file="../../resources/inc/footer.jsp" %>
<script></script>
</html>