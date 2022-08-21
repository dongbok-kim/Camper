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
						<li><a href="/memberAdmList.go">회원 관리</a></li>
						<li><a href="/reportAdmList.go">신고 관리</a></li>
						<li><a href="/stopAdmList.go">정지 회원 관리</a></li>
						<li><a href="/blindAdmList.go">블라인드 관리</a></li>
						<li><a href="/answerAdmList.go">1:1문의 관리</a></li>
						<li><a href="/titleList.go">타이틀 관리</a></li>
						<li><a href="/ageAdmList.go">연령대 관리</a></li>
						<li><a href="/campingAdmList.go">캠핑장 관리</a></li>
						<li><a href="/reviewAdmList.go">후기 관리</a></li>
						<li class="active"><a href="/togetherAdmList.go">모집글 관리</a></li>
					</ul>
				</aside>
				<div>
					<h3>모집글 상세보기</h3>
				</div>
<body>
	<div>
		<table>
			<tr>
				<th colspan="6">${dto.ct_title }</th>
			</tr>
			<tr>
				<th>작성자</th>
				<td>${dto.mb_id }</td>
				<th>닉네임</th>
				<td>${dto.mb_nickname }</td>
				<th>작성일시</th>
				<td>${dto.ct_datetime }</td>
			</tr>
			<tr>
				<th>성별</th>
				<td>${dto.ct_gender }</td>
				<th>연령대</th>
				<td>${dto.ct_age }</td>
				<th>모집인원</th>
				<td>${dto.ct_people_cnt}</td>
			</tr>
			<tr>
				<th>캠핑종류</th>
				<td>${dto.ct_camping_type }</td>
				<th>장비제공</th>
				<td colspan="3">
					<c:if test="${dto.ct_tool eq 1}">제공</c:if> 
					<c:if test="${dto.ct_tool eq 0}">미제공</c:if> 
				</td>
			</tr>
			<tr>
				<th>애견동반</th>
				<td>
					<c:if test="${dto.ct_pet eq 1}">동반</c:if> 
					<c:if test="${dto.ct_pet eq 0}">동반하지않음</c:if> 
				</td>
				<th>희망날짜</th>
				<td colspan="3">${dto.ct_wish_start } - ${dto.ct_wish_end }</td>
			</tr>
			<tr>
				<th>캠핑장명</th>
				<td colspan="5">${dto.ca_name }</td>
			</tr>
			<tr>
				<td colspan="6">${dto.ct_content }</td>
			</tr>			
		</table>
		<c:if test="${dto.bb_count eq 0 }">
			<button class="blind_button" data-target="#insertBlind" data-title="${dto.ct_title }" data-writer="${dto.mb_id}" data-idx="${dto.ct_idx}">
				블라인드
			</button>
		</c:if>
		<input type="button" onclick="location.href='/togetherAdmList.go?type=${type}&amp;keyword=${keyword}&amp;pageNum=${pageNum}' " value="목록">
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
			<form action="blindTogether.do" method="post" id="blindfm">
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