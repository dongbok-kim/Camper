<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="/resources/inc/header.jsp" %>
				<aside>
					<h2>마이페이지</h2>
					<ul>
						<li><a href="/mypageInfo.go">내 정보 수정</a></li>
						<li><a href="/myCampingLikeList.go">찜한 캠핑장</a></li>
						<li class="active"><a href="">내가 쓴 모집글</a></li>
						<li><a href="/myCampingReview.go">캠핑장 후기</a></li>
						<li><a href="/myCrewReviewR.go">크루 후기</a></li>
						<li><a href="/myCrewList.go">참여한 크루 목록</a></li>
						<li><a href="/myChatList.do">참여 중인 채팅방</a></li>
						<li><a href="/myBlockList.go">차단 회원</a></li>
						<li><a href="/myInquiryList.go">1:1 문의</a></li>
					</ul>
				</aside>
				<div class="right mypg">
					<h3>내가 쓴 모집글</h3>
					<h4>참여한 크루 목록 수 : ${list.size()} 건</h4>
					<table>
						<thead>
							<tr>
								<th>번호</th>
								<th>제목</th>
								<th>모집인원 수</th>
								<th>크루모집현황</th>
								<th>작성일자</th>
								<th>삭제</th>
							</tr>
						</thead>
						<tbody>
							<c:if test="${list.size() == 0}">
								<tr><td colspan="6">등록된 크루모집글이 없습니다.</td></tr>
							</c:if>
							<c:forEach items="${list}" var="my" varStatus="i">
								<tr>
									<td>${listCnt - skip - i.index}</td>
									<td><a href="/crewTogetherView.do?ct_idx=${my.ct_idx}">${my.ct_title}</a></td>
									<td>${my.ct_people_cnt} 명</td>
									<td>${my.nowCnt} 명</td>
									<td><fmt:formatDate pattern="yyyy-MM-dd" value="${my.ct_datetime}"/></td>
									<td><input type="button" value="삭제" onclick="yn(${my.ct_idx})"/></td>
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
	
		function yn(idx){
			
			var cf = confirm("크루 모집글과 채팅방이 삭제됩니다. 삭제하시겠습니까?");
			if (cf == true) {
				location.href="myCrewWriteDelete.do?idx="+idx;
			} else{
				
			}
		}
		
	</script>
</html>