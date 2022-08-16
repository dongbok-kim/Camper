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
						<li><a href="reviewAdmList">후기 관리</a></li>
						<li class="active"><a href="togetherAdmList">모집글 관리</a></li>
					</ul>
				</aside>
				<div>
					<h3>모집글 관리</h3>
				</div>
<body>
	<div>모집글 수 : ${list.size()}건</div>
	<div>
		<table>
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>작성자</th>
				<th>작성일시</th>
				<th>블라인드</th>
			</tr>
			<c:forEach items="${list }" var="together">
				<tr>
					<td>${together.ct_idx}</td>
					<td>
					<a href="togetherAdmView?ct_idx=${together.ct_idx}">${together.ct_title }</a>
					</td>
					<td>${together.mb_id}</td>
					<td>${together.ct_datetime}</td>
					<td>
						<c:if test="${together.bb_count eq 0}">
							<button class="blind_button" data-target="#insertBlind" data-title="${together.ct_title }" data-writer="${together.mb_id}" data-idx="${together.ct_idx}">
								블라인드
							</button>
						</c:if>
					</td>
				</tr>
			</c:forEach>
		</table>
	</div>
	<div>
		<form action="reviewCampSearch.do" method="post">
			<select name="option">
				<option value="all">전체</option>
				<option value="title">제목</option>
				<option value="content">내용</option>
				<option value="mb_id">작성자</option>
			</select>
			<input type="text" name="keyword" placeholder="검색"/>
			<input type="submit" value="search"/>
		</form>
	</div>
	
	<!-- 블라인드 모달창 -->
	<div class="modal" id="insertBlind">
		<div class="modal_content" title="모집글 블라인드">
			<h2>모집글 블라인드</h2>
			<form action="blindTogether.do" method="post">
				<table class="md_table">
					<tr>
						<th id="md_ct_title" colspan="2">모집글 제목</th>
					</tr>
					<tr>
						<th>작성자 아이디</th>
						<td id="md_ct_writer">작성자</td>
					</tr>
					<tr>
						<td colspan="2">
							<input type="hidden" name="idx" value="idx"/>
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
//블라인드 모달창 
$(function(){
	
	// 블라인드 버튼 클릭시
	$(".blind_button").click(function(event){
		$(".modal").fadeIn();  // 모달창 띄우기
		
		// 후기내용, 후기 작성자 가져오기 ㅠㅠ
		var title= $(this).data('title');
		var writer= $(this).data('writer');
		var idx = $(this).data('idx');
		console.log(idx);
		// 후기내용 길면 생략해서 가져오기,,ㅠㅠ
		$("#md_ct_writer").html(writer);
		$("input[name='idx']").val(idx);
		if (title.length>20){
			$("#md_ct_title").html(title.substr(0,20)+'...');		
		}else{
			$("#md_ct_title").html(title);
		}	
	});
	
	// 닫기 버튼 클릭시 모달창 닫기
	$("#md_close_btn").click(function(){
		$(".modal").fadeOut();
	});

});
</script>
</html>