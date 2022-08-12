<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
</style>
				<aside>
					<h2>관리자페이지</h2>
					<ul>
						<li><a href="">회원 관리</a></li>
						<li><a href="reportAdmList">신고 관리</a></li>
						<li><a href="stopAdmList">정지 회원 관리</a></li>
						<li><a href="blindAdmList">블라인드 관리</a></li>
						<li><a href="answerAdmList">1:1문의 관리</a></li>
						<li><a href="">타이틀 관리</a></li>
						<li><a href="ageAdmList">연령대 관리</a></li>
						<li><a href="campingAdmList">캠핑장 관리</a></li>
						<li class="active"><a href="reviewAdmList">후기 관리</a></li>
						<li><a href="togetherAdmList">모집글 관리</a></li>
					</ul>
				</aside>
				<div>
					<h3>후기 관리</h3>
				</div>
<body>
	<div>
		<a href="reviewAdmList">캠핑장 후기</a>
		<a href="reviewMemberAdmList">회원 후기</a>
	</div>
	<div>등록된 캠핑장 후기 수 : ${list.size()}건</div>
	<div>
		<table>
			<tr>
				<th>번호</th>
				<th>후기내용</th>
				<th>평가한 회원</th>
				<th>평가받은 회원</th>
				<th>평가항목<br/>(평가점수)</th>
				<th>작성일시</th>
				<th>블라인드</th>
			</tr>
			<c:forEach items="${list }" var="review">
				<tr>
					<td>${review.mr_idx}</td>
					<td class="mr_content">${review.mr_content }</td>
					<td>${review.mr_id}</td>
					<td>${review.mb_id}</td>
					<td>
					${review.mr_assessment} <br/>
					(${review.mr_score})
					</td>				
					<td>${review.mr_datetime}</td>
					<td>
						<c:if test="${review.bb_count eq 0}">
							<button class="blind_button" data-target="#insertBlind" data-content="${review.mr_content }" data-writer="${review.mr_id}" data-idx="${review.mr_idx}">
							블라인드
							</button>
						</c:if>
					</td>
				</tr>
			</c:forEach>
		</table>
	</div>
	<div>
		<form action="reviewMemberSearch.do" method="post">
			<select name="cr_assessment">
				<option value="평가항목">평가항목</option>
				<option value="좋아요">좋아요</option>
				<option value="싫어요">싫어요</option>
				<option value="보통이에요">보통이에요</option>
			</select>
			<select name="option">
				<option value="all">전체</option>
				<option value="mr_id">평가한 회원</option>
				<option value="mb_id">평가받은 회원</option>
				<option value="mr_content">후기 내용</option>
			</select>
			<input type="text" name="keyword" placeholder="검색"/>
			<input type="submit" value="search"/>
		</form>
	</div>
	
	<!-- 블라인드 모달창 -->
	<div class="modal" id="insertBlind">
		<div class="modal_content" title="후기 블라인드">
			<h2>후기 블라인드</h2>
			<form action="blindMember.do" method="post">
				<table class="md_table">
					<tr>
						<th id="md_mr_content" colspan="2">후기 내용</th>
					</tr>
					<tr>
						<th>작성자 아이디</th>
						<td id="md_mr_writer">후기 작성자</td>
					</tr>
					<tr>
						<td colspan="2">
							<input type="hidden" name="md_mr_idx" value="idx"/>
							<textarea name="reason" placeholder="사유를 입력하세요."></textarea>
						</td>
					</tr>
					<tr>
						<th>처리자 아이디</th>
						<th>관리자아이디</th>
					</tr>
				</table>
				<input type="submit" value="완료"/>
				<input type="button" id="md_close_btn" value="닫기"/>
			</form>
		</div>
	</div>
	
	<%@ include file="../../../resources/inc/footer.jsp" %>
</body>
<script>
//후기내용 생략
$('.mr_content').each(function(){
	var length = 10;
	$(this).each(function(){
		if($(this).text().length >= length) {
			$(this).text($(this).text().substr(0, length)+'...');
		}
	});
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
		$("input[name='md_mr_idx']").val(idx);
		if (content.length>20){
			$("#md_mr_content").html(content.substr(0,20)+'...');		
		}else{
			$("#md_mr_content").html(content);
		}	
	});
	
	// 닫기 버튼 클릭시 모달창 닫기
	$("#md_close_btn").click(function(){
		$(".modal").fadeOut();
	});

});

</script>
</html>