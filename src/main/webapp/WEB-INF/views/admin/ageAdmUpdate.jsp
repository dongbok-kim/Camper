<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
						<li class="active"><a href="/ageAdmList.go">연령대 관리</a></li>
						<li><a href="/campingAdmList.go">캠핑장 관리</a></li>
						<li><a href="/reviewAdmList.go">후기 관리</a></li>
						<li><a href="/togetherAdmList.go">모집글 관리</a></li>
					</ul>
				</aside>
				<div class="right admpg">
					<h3>연령대 수정</h3>
					<form action="ageUpdate.do" name="agefm" method="get" onsubmit="return ageAgeUpdate()">
						<table>
							<colgroup>
								<col width="75"></col>
								<col width="*"></col>
							</colgroup>
							<tbody>
								<tr>
									<th><input type="hidden" name="ma_idx" value="${age.ma_idx }"> 연령대</th>
									<td><input type="text" name="ma_age" id="ma_age" maxlength="2" value="${age.ma_age }" style="width: 58px; text-align: right;">대</td>
								</tr>
							</tbody>
							<tfoot>
								<tr>
									<td colspan="2">
										<input type="submit" class="btn btnSubmit" value="수정"/>
										<input type="button" class="btn btnList" onclick="location.href='ageAdmList.go' " value="목록"/>
									</td>
								</tr>
							</tfoot>
						</table>
					</form>
				</div>
<%@ include file="/resources/inc/footer.jsp" %>
<script>
	function ageAgeUpdate() {
		var age = document.getElementById('ma_age');
		
		if (age.value == '') {
			window.alert("연령대를 입력해 주십시오.");
			age.focus();
			return false;
		}
		
		if (age.value % 10 != 0) {
			window.alert("연령대는 10단위로만 입력할 수 있습니다.");
			age.value = '';
			age.focus();
			return false;
		} else {
			return confirm("수정하시겠습니까?");
		}
	}
</script>
</html>