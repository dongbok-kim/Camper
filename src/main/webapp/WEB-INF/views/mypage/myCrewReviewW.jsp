<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<style>
	#campingReview > tbody > tr > td.subject {
		cursor: pointer;
	}
	#campingReview > tbody > tr > td.subject:not(.active) {
		max-width: 200px;
		text-overflow: ellipsis;
		overflow: hidden;
		white-space: nowrap;
	}
</style>
<%@ include file="/resources/inc/header.jsp" %>
				<aside>
					<h2>마이페이지</h2>
					<ul>
						<li><a href="/mypageInfo.go">내 정보 수정</a></li>
						<li><a href="/myCampingLikeList.go">찜한 캠핑장</a></li>
						<li><a href="/myCrewWriteList.go">내가 쓴 모집글</a></li>
						<li><a href="/myCampingReview.go">캠핑장 후기</a></li>
						<li  class="active"><a href="/myCrewReviewR.go">크루 후기</a></li>
						<li><a href="/myCrewList.go">참여한 크루 목록</a></li>
						<li><a href="/myChatList.do">참여 중인 채팅방</a></li>
						<li><a href="/myBlockList.go">차단 회원</a></li>
						<li><a href="">1:1 문의</a></li>
					</ul>
				</aside>
				<div class="right mypg">
					<h3>크루 후기 - 작성 후기</h3>
					<a href="/myCrewReviewR.go">받은 후기</a><a href="/myCrewReviewW.go">작성 후기</a>
					<h4>작성 후기 수 : ${listCnt} 건</h4>
					<table id="campingReview">
						<colgroup>
								<col width="60"></col>
								<col width="*"></col>
								<col width="80"></col>
								<col width="80"></col>
								<col width="120"></col>
								<col width="60"></col>
							</colgroup>
						<thead>
							<tr>
								<th>번호</th>
								<th>후기내용</th>
								<th>평가회원</th>
								<th>평가항목<br/>평가점수</th>
								<th>후기작성일시</th>
								<th>삭제</th>
							</tr>
						</thead>
						<tbody>
							<c:if test="${list.size() == 0}">
								<tr><td colspan="6">작성한 후기가 없습니다.</td></tr>
							</c:if>
							<c:forEach items="${list}" var="rv" varStatus="i">
								<tr>
									<td>${listCnt - skip - i.index}</td>
									<td  class="subject" >${rv.mr_content }</td>
									<td>${rv.mb_nickname}</td>
									<td>${rv.mr_assessment}<br/>(+${rv.mr_score })</td>
									<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${rv.mr_datetime}"/></td>
									<c:if test="${rv.delAble> rv.today}">
										<td><input type="button" value="삭제" onclick="del(${rv.mr_idx})"/></td>
									</c:if>
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
							<li class="pageInfo_btn next"><a href="?keyword=${keyword}&amp;pageNum=${pageMaker.startPage+1}">다음</a></li>
						</c:if>
					</ul>
				</div>
<%@ include file="/resources/inc/footer.jsp" %>
	<script>
	
		function del(idx){
			
			var cf = confirm("삭제하시겠습니까?");
			if (cf == true) {
				location.href="crewReviewDelete.do?idx="+idx;
			} else{
				
			}
		}
	
	
		$('#campingReview > tbody > tr > td.subject').on('click', function() {
			$('#campingReview > tbody > tr > td.subject').removeClass('active');
			$(this).addClass('active');
		});
		
	</script>
</html>