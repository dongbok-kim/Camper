<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../../../resources/inc/header.jsp" %>
<style>
.modal{
	position:fixed;
	width:100%; height:100%;
	z-index:100;
	background: rgba(0,0,0,0.7);
	top:0 ; left:0;	
	right:0; bottom:0;
	display: none;
}
.modal_content{
	position:relative; top:20%; left:20%;
	background : #fff;
	width: 50%; height: 58%;
	text-align:center;
	box-sizing:border-box; padding:30px 0;
	/*
	width:400px; height:200px;
	background:#fff; border-radius:10px;	
	margin-top:-100px; margin-left:-200px;		
	line-height:23px; cursor:pointer;
	*/
}
.md_table {
	border:1px solid black;
	border-collapse:collapse;
}

#memberReview > tbody > tr > td.mr_content {
		cursor: pointer;
	}
#memberReview > tbody > tr > td.mr_content:not(.active) {
	max-width: 200px;
	text-overflow: ellipsis;
	overflow: hidden;
	white-space: nowrap;
}
</style>
				<aside>
					<h2>관리자페이지</h2>
					<ul>
						<li><a href="/memberAdmList.go">회원 관리</a></li>
						<li><a href="/reportAdmList.go">신고 관리</a></li>
						<li><a href="/stopAdmList.go">정지 회원 관리</a></li>
						<li><a href="/blindAdmList.go">블라인드 관리</a></li>
						<li><a href="/answerAdmList.go">1:1문의 관리</a></li>
						<li><a href="/titleList.go">타이틀 관리</a></li>
						<li><a href="/ageAdmList.go">연령대 관리</a></li>
						<li><a href="/campingAdmList.go">캠핑장 관리</a></li>
						<li class="active"><a href="/reviewAdmList.go">후기 관리</a></li>
						<li><a href="/togetherAdmList.go">모집글 관리</a></li>
					</ul>
				</aside>
				<div class="right admpg">
					<h3>후기 관리</h3>
					<ul class="tab">
						<li><a href="/reviewAdmList.go">캠핑장 후기</a></li>
						<li class="active"><a href="/reviewMemberAdmList.go">회원 후기</a></li>
					</ul>
					<h4>등록된 회원 후기 수 : <strong>${listCnt}</strong>건</h4>
					<table id="memberReview">
						<colgroup>
							<col width="58"></col>
							<col width="*"></col>
							<col width="120"></col>
							<col width="120"></col>
							<col width="100"></col>
							<col width="180"></col>
							<col width="100"></col>
						</colgroup>
						<thead>
							<tr>
								<th>번호</th>
								<th>후기내용</th>
								<th>평가한 회원</th>
								<th>평가받은 회원</th>
								<th>평가항목<br/>(평가점수)</th>
								<th>작성일시</th>
								<th>블라인드</th>
							</tr>
						</thead>
						<tbody>
						<c:if test="${list.size() eq 0}">
							<tr align="center" height="180">
								<td colspan="7">데이터가 없습니다.</td>
							</tr>
						</c:if>
						<c:forEach items="${list }" var="review" varStatus="i">
							<tr>
								<td align="center">${listCnt - skip - i.index}</td>
								<td class="mr_content">${review.mr_content }</td>
								<td align="center" class="contextMenu contextMenuMember" data-id="${review.mr_id}">${review.mr_id}</td>
								<td align="center" class="contextMenu contextMenuMember" data-id="${review.mb_id}">${review.mb_id}</td>
								<td align="center">
									${review.mr_assessment} <br/>
									(${review.mr_score})
								</td>				
								<td align="center"><fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${review.mr_datetime}"/></td>
								<td align="center">
									<c:if test="${review.bb_count eq 0}">
									<button class="btn btnDelete blind_button" data-target="#insertBlind" data-content="${review.mr_content }" data-writer="${review.mr_id}" data-idx="${review.mr_idx}">블라인드</button>
									</c:if>
								</td>
							</tr>
						</c:forEach>
						</tbody>
					</table>
					<ul class="pageInfo">
						<!-- 이전페이지 버튼 -->
						<c:if test="${pageMaker.prev}">
						<li class="pageInfo_btn prev"><a href="?type=${type}&amp;keyword=${keyword}&amp;pageNum=${pageMaker.startPage-1}">이전</a></li>
						</c:if>
						
						<!-- 각 번호 페이지 버튼 -->
						<c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
						<li class="pageInfo_btn ${pageMaker.cri.pageNum eq num ? 'active' : ''}"><a href="?type=${type}&amp;keyword=${keyword}&amp;pageNum=${num}">${num}</a></li>
						</c:forEach>
						
						<!-- 다음페이지 버튼 -->
						<c:if test="${pageMaker.next}">
						<li class="pageInfo_btn next"><a href="?type=${type}&amp;keyword=${keyword}&amp;pageNum=${pageMaker.endPage+1}">다음</a></li>
						</c:if>
					</ul>
					<form action="reviewMemberAdmList.go" method="post" id="reviewList">
						<select name="filter">
							<option value="">평가항목</option>
							<option value="좋아요" <c:if test="${filter eq '좋아요'}">selected="selected"</c:if> >좋아요</option>
							<option value="싫어요" <c:if test="${filter eq '싫어요'}">selected="selected"</c:if> >싫어요</option>
							<option value="보통" <c:if test="${filter eq '보통'}">selected="selected"</c:if> >보통</option>
						</select>
						<select name="type">
							<option value="all">전체</option>
							<option value="mr_id" <c:if test="${type eq 'mr_id'}">selected="selected"</c:if> >평가한 회원</option>
							<option value="mb_id" <c:if test="${type eq 'mb_id'}">selected="selected"</c:if> >평가받은 회원</option>
							<option value="mr_content" <c:if test="${type eq 'mr_content'}">selected="selected"</c:if> >후기 내용</option>
						</select>
						<input type="text" name="keyword" value="${keyword }" placeholder="검색"/>
						<input type="submit" class="btn btnSubmit" value="SEARCH"/>
					</form>
					
					<!-- 블라인드 모달창 -->
					<div class="modal" id="insertBlind">
						<div class="modal_content" title="후기 블라인드">
							<h2>후기 블라인드</h2>
							<form action="blindMember.do" method="post" id="blindfm">
								<table class="md_table">
									<colgroup>
										<col width="180"></col>
										<col width="*"></col>
									</colgroup>
									<tbody>
										<tr>
											<th id="md_mr_content" colspan="2" style="text-align: left;">후기 내용</th>
										</tr>
										<tr>
											<th>작성자 아이디</th>
											<td style="text-align: left;" id="md_mr_writer">후기 작성자</td>
										</tr>
										<tr>
											<td colspan="2">
												<input type="hidden" name="idx" value="idx"/>
												<textarea name="reason" id="reason" placeholder="사유를 입력하세요."></textarea>
											</td>
										</tr>
										<tr>
											<th>처리자 아이디</th>
											<th style="text-align: left;">${sessionScope.loginId }</th>
										</tr>
									</tbody>
									<tfoot>
										<tr>
											<td colspan="2">
												<input type="button" class="btn btnSubmit" id="blindDo" value="완료"/>
												<input type="button" class="btn btnList" id="md_close_btn" value="닫기"/>
											</td>
										</tr>
									</tfoot>
								</table>
							</form>
						</div>
					</div>
				</div>
	
	<%@ include file="../../../resources/inc/footer.jsp" %>
<script>
//후기내용 생략
$('#memberReview > tbody > tr > td.mr_content').on('click', function() {
	$('#memberReview > tbody > tr > td.mr_content').removeClass('active');
	$(this).addClass('active');
});

// 검색 필터
$('#reviewList select[name="filter"]').on('change', function() {
	$('#reviewList').submit();
});

//블라인드 모달창 
$(function(){
	
	// 블라인드 버튼 클릭시
	$(".blind_button").click(function(event){
		$(".modal").fadeIn();  // 모달창 띄우기
		
		// 후기내용, 후기 작성자 가져오기 ㅠㅠ
		var content= $(this).data('content');
		var writer= $(this).data('writer');
		var idx = $(this).data('idx');
		console.log(idx);
		// 후기내용 길면 생략해서 가져오기,,ㅠㅠ
		$("#md_mr_writer").html(writer);
		$("input[name='idx']").val(idx);
		if (content.length>20){
			$("#md_mr_content").html(content.substr(0,20)+'...');		
		}else{
			$("#md_mr_content").html(content);
		}	
	});
	
	// 사유 입력 유효성 검사
	$("#blindDo").click(function(){
		if($("#reason").val() == ""){
			alert("정지 사유를 입력하세요.");
		} else {
			
			// by.승진 2022-08-22
			var cf = confirm("블라인드 처리하시겠습니까?");
			if (cf == true) {			
				$("#blindfm").submit();
				$(".modal").fadeOut();
			}
		}
	});
	
	
	// 닫기 버튼 클릭시 모달창 닫기
	$("#md_close_btn").click(function(){
		$(".modal").fadeOut();
	});
	
	// 바탕 클릭 시 모달창 닫기
	$(document).click(function(e){
		if($(".modal").is(e.target)){
			$(".modal").fadeOut();
		}
	});
	

});

</script>
</html>