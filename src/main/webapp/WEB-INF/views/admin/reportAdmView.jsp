<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../../../resources/inc/header.jsp" %>
<body>
<aside>
		<h2>관리자페이지</h2>
		<ul>
			<li ><a href="">회원 관리</a></li>
			<li class="active"><a href="reportAdmList">신고 관리</a></li>
			<li><a href="stopAdmList">정지 회원 관리</a></li>
			<li><a href="blindAdmList">블라인드 관리</a></li>
			<li><a href="answerAdmList">1:1문의 관리</a></li>
			<li><a href="">타이틀 관리</a></li>
			<li><a href="ageAdmList">연령대 관리</a></li>
			<li><a href="campingAdmList">캠핑장 관리</a></li>
			<li><a href="reviewAdmList">후기 관리</a></li>
			<li><a href="togetherAdmList">모집글 관리</a></li>
		</ul>
	</aside>
	<div>
		<h3>신고 상세보기</h3>
	</div>
	<div>
	<form action="reportUpdate.do" method="post" enctype="multipart/form-data">
		<table>
			<tr>
				<th>신고대상아이디</th>
				<td class="contextMenu contextMenuMember" data-id="${report.mb_id }">
				${report.mb_id }
				</td>
				<th>신고누적횟수</th>
				<td>${report.rp_count }회</td>
			</tr>
			<tr>
				<th>신고자</th>
				<td colspan="3">${report.rp_id }</td>
			</tr>
			<tr>
				<th>신고 내용</th>
				<td colspan="3">
				${report.rp_content }
				<input type="hidden" name="rp_idx" value="${report.rp_idx }"/>
				</td>
			</tr>
			<tr>
				<th>이미지</th>
				<td colspan="3">
				<c:forEach items="${list }" var="report">
					<p><img src="/report/${report.ri_new_name }" height="200"/></p>
				</c:forEach>
				<input type="file" name="rp_img">
				</td>
			</tr>
			<tr>
				<th>신고일자</th>
				<td colspan="3">${report.rp_datetime }</td>
			</tr>
			<tr>
				<th>처리한 관리자</th>
				<td colspan="3">${report.rp_admin }</td>
			</tr>
			<tr>
				<th>처리일자</th>
				<td colspan="3">${report.rp_proc_date }</td>
			</tr>
			<tr>
				<th>처리여부</th>
				<td colspan="3">
					<select name="rp_status" id="selectBox">
						<option value="미처리" ${report.rp_status == '미처리' ? 'selected="selected" ':''}>미처리</option>
						<option value="처리중" ${report.rp_status == '처리중' ? 'selected="selected" ':''} >처리중</option>
						<option value="처리완료" ${report.rp_status == '처리완료' ? 'selected="selected" ':''} >처리완료</option>
					</select>
				</td>
			</tr>
		</table>
		<input type="submit" value="변경">
		<input type="button" onclick="location.href='/reportAdmList' " value="목록">
	</form>
	</div>
<%@ include file="../../../resources/inc/footer.jsp" %>
</body>
<script>
</script>
</html>