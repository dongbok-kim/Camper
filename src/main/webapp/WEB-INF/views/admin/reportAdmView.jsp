<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../../../resources/inc/header.jsp" %>
				<aside>
					<h2>관리자페이지</h2>
					<ul>
						<li><a href="/memberAdmList.go">회원 관리</a></li>
						<li class="active"><a href="/reportAdmList.go">신고 관리</a></li>
						<li><a href="/stopAdmList.go">정지 회원 관리</a></li>
						<li><a href="/blindAdmList.go">블라인드 관리</a></li>
						<li><a href="/answerAdmList.go">1:1문의 관리</a></li>
						<li><a href="/titleList.go">타이틀 관리</a></li>
						<li><a href="/ageAdmList.go">연령대 관리</a></li>
						<li><a href="/campingAdmList.go">캠핑장 관리</a></li>
						<li><a href="/reviewAdmList.go">후기 관리</a></li>
						<li><a href="/togetherAdmList.go">모집글 관리</a></li>
					</ul>
				</aside>
				<div class="right admpg">
					<h3>신고 상세보기</h3>
					<form action="reportUpdate.do" method="post" enctype="multipart/form-data">
						<table>
							<colgroup>
								<col width="15%"></col>
								<col width="35%"></col>
								<col width="15%"></col>
								<col width="35%"></col>
							</colgroup>
							<tbody>
								<tr>
									<th>신고대상아이디</th>
									<td class="contextMenu contextMenuMember" data-id="${report.mb_id}">${report.mb_id }</td>
									<th>신고누적횟수</th>
									<td>${report.rp_count }회</td>
								</tr>
								<tr>
									<th>신고자</th>
									<td colspan="3" class="contextMenu contextMenuMember" data-id="${stop.rp_id}">${report.rp_id }</td>
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
										<p><img src="/reportImg/${report.ri_new_name }" height="200"/></p>
									</c:forEach>
									</td>
								</tr>
								<tr>
									<th>신고일시</th>
									<td colspan="3"><fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${report.rp_datetime}"/></td>
								</tr>
								<tr>
									<th>처리한 관리자</th>
									<td colspan="3">${report.rp_admin }</td>
								</tr>
								<tr>
									<th>처리일시</th>
									<td colspan="3"><fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${report.rp_proc_date }"/></td>
								</tr>
								<tr>
									<th>처리여부</th>
									<td colspan="3">
										<c:if test="${report.rp_status != '처리완료' }">
										<select name="rp_status" id="selectBox">
											<option value="미처리" ${report.rp_status == '미처리' ? 'selected="selected" ':''}>미처리</option>
											<option value="처리중" ${report.rp_status == '처리중' ? 'selected="selected" ':''} >처리중</option>
											<option value="처리완료" >처리완료</option>
										</select>
										</c:if>
										<c:if test="${report.rp_status == '처리완료' }">처리완료</c:if>
									</td>
								</tr>
							</tbody>
							<tfoot>
								<tr>
									<td colspan="4">
										<c:if test="${report.rp_status == '처리완료' }"></c:if>
										<c:if test="${report.rp_status != '처리완료' }"><input type="submit" class="btn btnSubmit" value="변경" /></c:if>
										<input type="button" class="btn btnList" onclick="location.href='/reportAdmList.go'" value="목록"/>
									</td>
								</tr>
							</tfoot>
						</table>
					</form>
				</div>
<%@ include file="/resources/inc/footer.jsp" %>
<script>
</script>
</html>