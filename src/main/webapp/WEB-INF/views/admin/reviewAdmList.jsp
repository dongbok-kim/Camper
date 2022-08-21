<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

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
	width: 50%; height: 50%;
	text-align:center;
	box-sizing:border-box; padding:30px 0;
	/*
	width:400px; height:200px;
	background:#fff; border-radius:10px;	
	margin-top:-100px; margin-left:-200px;		
	line-height:23px; cursor:pointer;
	*/
}
textarea {
	resize:none;
	width: 80%; height: 8.25em;;
}
.md_table {
	border:1px solid black;
	border-collapse:collapse;
}

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
				<div>
					<h3>후기 관리</h3>
				</div>
<body>
	<div>
		<a href="/reviewAdmList.go">캠핑장 후기</a>
		<a href="/reviewMemberAdmList.go">회원 후기</a>
	</div>
	<div>등록된 캠핑장 후기 수 : ${listCnt}건</div>
	<div>
		<table id="campingReview">
			<colgroup>
				<col width="50"></col>
				<col width="200"></col>
				<col width="50"></col>
				<col width="50"></col>
				<col width="50"></col>
				<col width="50"></col>
			</colgroup>
			<thead>
				<tr>
					<th>번호</th>
					<th>캠핑장명 및 후기내용</th>
					<th>평가항목</th>
					<th>작성자</th>
					<th>작성일시</th>
					<th>블라인드</th>
				</tr>
			</thead>
			<tbody>
			<c:choose>
			<c:when test="${list.size() eq 0}">
				<tr align="center">
					<td colspan="6">데이터가 없습니다</td>
				</tr>
			</c:when>
			<c:otherwise>
			<c:forEach items="${list}" var="review" varStatus="i">
				<tr>
					<td>${listCnt - skip - i.index}</td>
					<td class="subject">
					<!-- 상세보기용 파라메터 값 필요한 사람 가져다 쓰세요 -->
					<!-- 
					<a href="?idx=${review.cr_idx}      &amp;type=${type}&amp;keyword=${keyword}&amp;pageNum=${pageMaker.cri.pageNum}"></a>
					-->
					${review.ca_name }<br/>
					${review.cr_content }
					</td>
					<td>${review.cr_assessment}</td>
					<td class="contextMenu contextMenuMember" data-id="${review.mb_id}">${review.mb_id}</td>
					<td>${review.cr_datetime}</td>
					<td>
						<c:if test="${review.bb_count eq 0}">
							<button class="blind_button" data-target="#insertBlind" data-content="${review.cr_content }" data-writer="${review.mb_id}" data-idx="${review.cr_idx}">
							블라인드
							</button>
						</c:if>
					</td>
				</tr>
			</c:forEach>
			</c:otherwise>
			</c:choose>
			</tbody>
		</table>
		<ul>
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
	</div>
	<div>
		<form action="reviewAdmList.go" method="post" id="reviewAdmList">
			<select name="filter">
				<option value=""  >평가항목</option>
				<option value="좋아요" <c:if test="${filter eq '좋아요'}">selected="selected"</c:if> >좋아요</option>
				<option value="싫어요" <c:if test="${filter eq '싫어요'}">selected="selected"</c:if> >싫어요</option>
				<option value="보통" <c:if test="${filter eq '보통'}">selected="selected"</c:if> >보통</option>
			</select>
			<select name="type">
				<option value="all">전체</option>
				<option value="mb_id" <c:if test="${type eq 'mb_id'}">selected="selected"</c:if>>작성자명</option>
				<option value="ca_name" <c:if test="${type eq 'ca_name'}">selected="selected"</c:if>>캠핑장명</option>
			</select>
			<input type="text" name="keyword" value="${keyword}" placeholder="검색"/>
			<input type="submit" value="search"/>
		</form>
	</div>
	
	<!-- 블라인드 모달창 -->
	<div class="modal" id="insertBlind">
		<div class="modal_content" title="후기 블라인드">
			<h2>후기 블라인드</h2>
			<form action="blindCamping.do" method="post" id="blindfm">
				<table class="md_table">
					<tr>
						<th id="md_cr_content" colspan="2">후기 내용</th>
					</tr>
					<tr>
						<th>작성자 아이디</th>
						<td id="md_cr_writer">후기 작성자</td>
					</tr>
					<tr>
						<td colspan="2">
							<input type="hidden" name="idx" value="idx"/>
							<textarea name="reason" id="reason" placeholder="사유를 입력하세요."></textarea>
						</td>
					</tr>
					<tr>
						<th>처리자 아이디</th>
						<th>${sessionScope.loginId }</th>
					</tr>
				</table>
				<input type="button" id="blindDo" value="완료"/>
				<input type="button" id="md_close_btn" value="닫기"/>
			</form>
		</div>
	</div>
	
	<%@ include file="/resources/inc/footer.jsp" %>
</body>
<script>
$('#campingReview > tbody > tr > td.subject').on('click', function() {
	$('#campingReview > tbody > tr > td.subject').removeClass('active');
	$(this).addClass('active');
});

$('#reviewAdmList select[name="filter"]').on('change', function() {
	$('#reviewAdmList').submit();
});


// 블라인드 모달창 
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
		$("#md_cr_writer").html(writer);
		$("input[name='idx']").val(idx);
		if (content.length>20){
			$("#md_cr_content").html(content.substr(0,20)+'...');		
		}else{
			$("#md_cr_content").html(content);
		}	
	});
	
	// 사유 입력 유효성 검사
	$("#blindDo").click(function(){
		if($("#reason").val() == ""){
			alert("정지 사유를 입력하세요.");
		} else {
			$("#blindfm").submit();
			$(".modal").fadeOut();
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