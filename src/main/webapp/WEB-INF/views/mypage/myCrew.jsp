<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="/resources/inc/header.jsp" %>
				<aside>
					<h2>마이페이지</h2>
					<ul>
						<li><a href="/mypageInfo.go">내 정보 수정</a></li>
						<li><a href="/myCampingLikeList.go">찜한 캠핑장</a></li>
						<li><a href="/myCrewWriteList.go">내가 쓴 모집글</a></li>
						<li><a href="/myCampingReview.go">캠핑장 후기</a></li>
						<li><a href="/myCrewReviewR.go">크루 후기</a></li>
						<li class="active"><a href="">참여한 크루 목록</a></li>
						<li><a href="/myChatList.do">참여 중인 채팅방</a></li>
						<li><a href="/myBlockList.go">차단 회원</a></li>
						<li><a href="/myInquiryList.go">1:1 문의</a></li>
					</ul>
				</aside>
				<div class="right mypg">
					<h3>참여한 크루 목록</h3>
					<h4>참여한 크루 목록 수 : ${listCnt} 건</h4>
					<table>
						<thead>
							<tr>
								<th>번호</th>
								<th>캠핑장명</th>
								<th>캠핑 날짜</th>
								<th>참여유형</th>
								<th>참석여부</th>
								<th>후기작성</th>
							</tr>
						</thead>
						<tbody>
							<c:if test="${list.size() == 0}">
								<tr><td colspan="6">참여한 크루 목록이 없습니다.</td></tr>
							</c:if>
							<c:forEach items="${list}" var="my" varStatus="i">
								<tr>
									<td>${listCnt - skip - i.index}</td>
									<td><a href="">${my.ca_name}</a></td>
									<td>${my.ct_wish_start} ~ ${my.ct_wish_end}</td>
									<c:choose>
										<c:when test="${my.cc_crew eq '크루장' and my.ct_end == 0}">			
											<td>${my.cc_crew}<br/>
												<a onclick="popup('${my.ct_idx}')">크루인원 확정</a>
											</td>
										</c:when>	
										<c:when test="${my.cc_crew eq '크루장' and my.ct_end == 1}">			
											<td>${my.cc_crew}</td>
										</c:when>
										<c:otherwise>
											<td>${my.cc_crew}</td>
										</c:otherwise>					
									</c:choose>
									<c:choose>
										<c:when test="${my.cc_is_join == 1}">
											<td style="color:blue">참석</td>
										</c:when>
										<c:otherwise>
											<td style="color:red">불참석</td>
										</c:otherwise>
									</c:choose>
									<c:choose>
										<c:when test="${my.cc_is_join == 1 and my.cntCR == 0 and my.cntMR == 0}">
											<td><a onclick="popupCamping('${my.ct_idx}')">캠핑장 후기</a><br/><a onclick="popupCrew('${my.ct_idx}')">크루 후기</a>
										</c:when>
										<c:when test="${my.cc_is_join == 1 and my.cntCR == 1 and my.cntMR ==0}">
											<td><a onclick="popupCrew('${my.ct_idx}')">크루 후기</a></td>
										</c:when>
										<c:when test="${my.cc_is_join == 1 and my.cntCR == 0 and my.cntMR != 0}">
											<td><a onclick="popupCrew('${my.ct_idx}')">캠핑장 후기</a></td>
										</c:when>
										<c:otherwise>
											<td></td>
										</c:otherwise>
									</c:choose>
								</tr>		
							</c:forEach>
						</tbody>
					</table>
					<ul class="pageInfo">
						<!-- 이전 페이지 버튼 -->
						<c:if test="${pageMaker.prev}">
							<li class="pageInfo_btn_prev"><a href="?keyword=${keyword}&amp;pageNum=${pageMaker.startPage-1}">이전</a></li>
						</c:if>
						<!-- 각 번호 페이지 버튼 -->
						<c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
							<li class="pageInfo_btn ${pageMaker.cri.pageNum eq num ? 'active' : ''}"><a href="?keyword=${keyword}&amp;pageNum=${num}">${num}</a></li>
						</c:forEach>
						
						<!--  다음 페이지 버튼 -->
						<c:if test="${pageMaker.next}">
							<li class="pageInfo_btn next"><a href="?pageNum=${pageMaker.startPage+1}">다음</a></li>
						</c:if>
					</ul>
				</div>
<%@ include file="/resources/inc/footer.jsp" %>
	<script>
		
		function popup(ct_idx){
			
			var w = 400;
			var h = 600;
			
			var screenLeft = window.screenLeft != undefined ? window.screenLeft : screen.left;
	        var screenTop = window.screenTop != undefined ? window.screenTop : screen.top;
	 
	        width = window.innerWidth ? window.innerWidth : document.documentElement.clientWidth ? document.documentElement.clientWidth : screen.width;
	        height = window.innerHeight ? window.innerHeight : document.documentElement.clientHeight ? document.documentElement.clientHeight : screen.height;
	 
	        var left = ((width / 2) - (w / 2)) + screenLeft;
	        var top = ((height / 2) - (h / 2)) + screenTop;
	 
	        window.open('/crewUpdate.go?idx='+ct_idx, 'pop', 'scrollbars=yes, width=' + w + ', height=' + h + ', top=' + top + ', left=' + left);
		}
		
		function popupCamping(ct_idx){
			
			var w = 500;
			var h = 600;
			
			var screenLeft = window.screenLeft != undefined ? window.screenLeft : screen.left;
	        var screenTop = window.screenTop != undefined ? window.screenTop : screen.top;
	 
	        width = window.innerWidth ? window.innerWidth : document.documentElement.clientWidth ? document.documentElement.clientWidth : screen.width;
	        height = window.innerHeight ? window.innerHeight : document.documentElement.clientHeight ? document.documentElement.clientHeight : screen.height;
	 
	        var left = ((width / 2) - (w / 2)) + screenLeft;
	        var top = ((height / 2) - (h / 2)) + screenTop;
	 
	        window.open('/campingReviewForm.go?idx='+ct_idx, 'pop', 'scrollbars=yes, width=' + w + ', height=' + h + ', top=' + top + ', left=' + left);
		}
		
		function popupCrew(ct_idx){
			
			var w = 500;
			var h = 600;
			
			var screenLeft = window.screenLeft != undefined ? window.screenLeft : screen.left;
	        var screenTop = window.screenTop != undefined ? window.screenTop : screen.top;
	 
	        width = window.innerWidth ? window.innerWidth : document.documentElement.clientWidth ? document.documentElement.clientWidth : screen.width;
	        height = window.innerHeight ? window.innerHeight : document.documentElement.clientHeight ? document.documentElement.clientHeight : screen.height;
	 
	        var left = ((width / 2) - (w / 2)) + screenLeft;
	        var top = ((height / 2) - (h / 2)) + screenTop;
	 
	        window.open('/crewReviewForm.go?idx='+ct_idx, 'pop', 'scrollbars=yes, width=' + w + ', height=' + h + ', top=' + top + ', left=' + left);
		}
		
		
	</script>
</html>