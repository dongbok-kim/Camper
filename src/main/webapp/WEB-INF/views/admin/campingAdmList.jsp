<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../../../resources/inc/header.jsp" %>
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
						<li class="active"><a href="/campingAdmList.go">캠핑장 관리</a></li>
						<li><a href="/reviewAdmList.go">후기 관리</a></li>
						<li><a href="/togetherAdmList.go">모집글 관리</a></li>
					</ul>
				</aside>
				<div>
					<h3>캠핑장 관리</h3>
				</div>
<body>
	<div>총 캠핑장 수 : ${listCnt}건</div>	
	<div><input type="checkbox" name="api" value="api"/>API 정보 관리</div>
	<div>
		<table>
			<thead>
				<tr>
					<th>번호</th>
					<th>캠핑장 이름</th>
					<th>시/도</th>
					<th>시/군/구</th>
					<th>전화번호</th>
					<th>등록일</th>
					<th>수정일</th>
					<th>운영상태</th>
				</tr>
			</thead>
			<tbody>
				<c:if test="${list.size() == 0}">
					<tr><td colspan="4">캠핑장 목록이 없습니다.</td></tr>
				</c:if>
				<c:forEach items="${list }" var="camp" varStatus="i">
					<tr>
						<td>${listCnt - skip - i.index}</td>
						<td>
							<a href="campingAdmUpdate.go?ca_idx=${camp.ca_idx}&amp;filterSido=${filterSido}&amp;filterStatus=${filterStatus}&amp;keyword=${keyword}&amp;pageNum=${pageMaker.cri.pageNum}">${camp.ca_name}</a>
						</td>
						<td>${camp.ca_sido}</td>
						<td>${camp.ca_sigungu}</td>
						<td>${camp.ca_tel}</td>
						<td>${camp.ca_create_date}</td>
						<td>${camp.ca_modified_date}</td>
						<td>${camp.ca_manage_status}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
			<ul>
			<!-- 이전페이지 버튼 -->
			<c:if test="${pageMaker.prev}">
			<li class="pageInfo_btn prev"><a href="?keyword=${keyword}&amp;pageNum=${pageMaker.startPage-1}">이전</a></li>
			</c:if>
			
			<!-- 각 번호 페이지 버튼 -->
			<c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
			<li class="pageInfo_btn ${pageMaker.cri.pageNum eq num ? 'active' : ''}"><a href="?type=${type}&amp;keyword=${keyword}&amp;pageNum=${num}">${num}</a></li>
			</c:forEach>
			
			<!-- 다음페이지 버튼 -->
			<c:if test="${pageMaker.next}">
			<li class="pageInfo_btn next"><a href="?keyword=${keyword}&amp;pageNum=${pageMaker.endPage+1}">다음</a></li>
			</c:if>
		</ul>
	</div>
	<div>
		<form action="campingAdmList.go" method="post" id="campingList">
			<select name="filterSido">
				<option value="">시/도</option>
				<option value="서울" <c:if test="${filterSido eq '서울'}">selected="selected"</c:if> >서울</option>
				<option value="부산" <c:if test="${filterSido eq '부산'}">selected="selected"</c:if> >부산</option>
				<option value="대구" <c:if test="${filterSido eq '대구'}">selected="selected"</c:if> >대구</option>
				<option value="인천" <c:if test="${filterSido eq '인천'}">selected="selected"</c:if> >인천</option>
				<option value="광주" <c:if test="${filterSido eq '광주'}">selected="selected"</c:if> >광주</option>
				<option value="대전" <c:if test="${filterSido eq '대전'}">selected="selected"</c:if> >대전</option>
				<option value="울산" <c:if test="${filterSido eq '울산'}">selected="selected"</c:if> >울산</option>
				<option value="경기" <c:if test="${filterSido eq '경기'}">selected="selected"</c:if> >경기</option>
				<option value="강원" <c:if test="${filterSido eq '강원'}">selected="selected"</c:if> >강원</option>
				<option value="충북" <c:if test="${filterSido eq '충북'}">selected="selected"</c:if> >충북</option>
				<option value="충남" <c:if test="${filterSido eq '충남'}">selected="selected"</c:if> >충남</option>
				<option value="전북" <c:if test="${filterSido eq '전북'}">selected="selected"</c:if> >전북</option>
				<option value="전남" <c:if test="${filterSido eq '전남'}">selected="selected"</c:if> >전남</option>
				<option value="경북" <c:if test="${filterSido eq '경북'}">selected="selected"</c:if> >경북</option>
				<option value="경남" <c:if test="${filterSido eq '경남'}">selected="selected"</c:if> >경남</option>
				<option value="제주" <c:if test="${filterSido eq '제주'}">selected="selected"</c:if> >제주</option>
				<option value="세종" <c:if test="${filterSido eq '세종'}">selected="selected"</c:if> >세종</option>
			</select>
			<select name="filterStatus">
				<option value="">운영상태</option>
				<option value="운영" <c:if test="${filterStatus eq '운영'}">selected="selected"</c:if> >운영</option>
				<option value="휴장" <c:if test="${filterStatus eq '휴장'}">selected="selected"</c:if> >휴장</option>
				<option value="확인중" <c:if test="${filterStatus eq '확인중'}">selected="selected"</c:if> >확인중</option>
			</select>
			<input type="text" name="keyword" value="${keyword}" placeholder="검색"/>
			<input type="submit" value="search"/>
		</form>
	</div>
	<%@ include file="/resources/inc/footer.jsp" %>
</body>
<script>
	$('#campingList select[name="filterStatus"]').on('change', function() {
		$('#campingList').submit();
	});
	
	$('#campingList select[name="filterSido"]').on('change', function() {
		$('#campingList').submit();
	});
</script>
</html>