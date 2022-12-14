<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/resources/inc/header.jsp" %>
				<aside>
					<h2>마이페이지</h2>
					<ul>
						<li><a href="/mypageInfo.go">내 정보 수정</a></li>
						<li><a href="/myCampingLikeList.go">찜한 캠핑장</a></li>
						<li><a href="/myCrewWriteList.go">내가 쓴 모집글</a></li>
						<li><a href="/myCampingReview.go">캠핑장 후기</a></li>
						<li><a href="/myCrewReviewR.go">크루 후기</a></li>
						<li><a href="/myCrewList.go">참여한 크루 목록</a></li>
						<li><a href="/myChatList.do">참여 중인 채팅방</a></li>
						<li><a href="/myBlockList.go">차단 회원</a></li>
						<li class="active"><a href="/myInquiryList.go">1:1 문의</a></li>
					</ul>
				</aside>
				<div class="right mypg">
					<h3>1:1 문의 상세보기</h3>
					<table>
						<thead>
							<tr>
								<th colspan="6" style="text-align: left;">${dto.in_title}</th>
							</tr>
							<tr>
								<th>작성자</th>
								<td>${dto.mb_id}</td>
								<th>등록일시</th>
								<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${dto.in_datetime}"/></td>
								<th>답변상태</th>
								<td>${dto.in_status}</td>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td colspan="6">${dto.in_content}</td>
							</tr>
						<c:if test="${dto.in_status eq '답변완료'}">
							<tr>
								<th>관리자</th>
								<td>${answer.mb_id}</td>
								<th>답변일시</th>
								<td colspan="3"><fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${answer.ia_datetime}"/></td>
							</tr>
							<tr>
								<td colspan="6">${answer.ia_content}</td>
							</tr>
						</c:if>
						</tbody>
						<tfoot>
							<tr>
								<td colspan="6" style="text-align: right;">
									<input type="button" class="btn btnList" value="목록" onclick="location.href='/myInquiryList.go?filter=${filter}&amp;type=${type}&amp;keyword=${keyword}&amp;pageNum=${pageNum}'" style="float: left;"/>
									<input type="button" class="btn btnModify" value="수정" onclick="update(${dto.in_idx})"/>
									<input type="button" class="btn btnDelete" value="삭제" onclick="del(${dto.in_idx})"/>
								</td>
							</tr>
						</tfoot>
					</table>
				</div>
<%@ include file="/resources/inc/footer.jsp" %>
	<script>
		
		var status = "${dto.in_status}";
		var type = "${type}";
		var keyword = "${keyword}";
		var pageNum = "${pageNum}";
		
		function update(idx){
			
			if(status == "답변대기"){
				location.href="/myInquiryUpdate.go?idx="+idx+"&type="+type+"&keyword="+keyword+"&pageNum="+pageNum;
			} else {
				alert("해당 글은 수정할 수 없습니다.");
			}
			
		}
		
		function del(idx){
			
			if (status == "답변대기") {

				var cf = confirm("삭제하시겠습니까?");
				if (cf == true) {
					location.href="/myInquiryDelete.do?idx="+idx;
				}

			} else {
				alert("답변 대기중이거나 답변완료글은 삭제할 수 없습니다.");
			}
			
		}
	</script>
</html>