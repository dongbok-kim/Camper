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
				<div class="right admpg">
					<h3>모집글 관리</h3>
					<h4>모집글 수 : <strong>${listCnt}</strong>건</h4>
					<table>
						<colgroup>
							<col width="58"></col>
							<col width="*"></col>
							<col width="120"></col>
							<col width="180"></col>
							<col width="100"></col>
						</colgroup>
						<thead>
							<tr>
								<th>번호</th>
								<th>제목</th>
								<th>작성자</th>
								<th>작성일시</th>
								<th>블라인드</th>
							</tr>
						</thead>
						<tbody>
							<c:if test="${list.size() == 0}">
							<tr align="center" height="180">
								<td colspan="4">문의 내역이 없습니다.</td>
							</tr>
							</c:if>
							<c:forEach items="${list }" var="together" varStatus="i">
							<tr>
								<td align="center">${listCnt - skip - i.index}</td>
								<td>
									<a href="togetherAdmView?ct_idx=${together.ct_idx}&amp;type=${type}&amp;keyword=${keyword}&amp;pageNum=${pageMaker.cri.pageNum}">${together.ct_title }</a>
								</td>
								<td align="center" class="contextMenu contextMenuMember" data-id="${together.mb_id}">${together.mb_id}</td>
								<td align="center"><fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${together.ct_datetime}"/></td>
								<td align="center">
									<c:if test="${together.bb_count eq 0}">
									<button class="btn btnDelete blind_button" data-target="#insertBlind" data-title="${together.ct_title }" data-writer="${together.mb_id}" data-idx="${together.ct_idx}">블라인드</button>
									</c:if>
								</td>
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
							<li class="pageInfo_btn ${pageMaker.cri.pageNum eq num ? 'active' : ''}"><a href="?keyword=${keyword}&amp;type=${type}&amp;pageNum=${num}">${num}</a></li>
						</c:forEach>
						
						<!--  다음 페이지 버튼 -->
						<c:if test="${pageMaker.next}">
							<li class="pageInfo_btn next"><a href="?keyword=${keyword}&amp;pageNum=${pageMaker.startPage+1}">다음</a></li>
						</c:if>
					</ul>
					<form action="togetherAdmList.go" method="post" id="togetherfm">
						<select name="type">
							<option value="all">전체</option>
							<option value="제목">제목</option>
							<option value="내용">내용</option>
							<option value="작성자">작성자</option>
						</select>
						<input type="text" name="keyword" value="${keyword }" placeholder="검색"/>
						<input type="submit" class="btn btnSubmit" value="SEARCH"/>
					</form>
					
					<!-- 블라인드 모달창 -->
					<div class="modal" id="insertBlind">
						<div class="modal_content" title="모집글 블라인드">
							<h2>모집글 블라인드</h2>
							<form action="blindTogether.do" method="post" id="blindfm">
								<table class="md_table">
									<colgroup>
										<col width="180"></col>
										<col width="*"></col>
									</colgroup>
									<tbody>
										<tr>
											<th id="md_ct_title" colspan="2" style="text-align: left;">모집글 제목</th>
										</tr>
										<tr>
											<th>작성자 아이디</th>
											<td style="text-align: left;" id="md_ct_writer">작성자</td>
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
	
	<%@ include file="/resources/inc/footer.jsp" %>
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
			if(confirm("블라인드 처리하시겠습니까?")) {
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