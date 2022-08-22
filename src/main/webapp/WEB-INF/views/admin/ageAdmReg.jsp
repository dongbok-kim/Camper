<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
						<li class="active"><a href="/ageAdmList.go">연령대 관리</a></li>
						<li><a href="/campingAdmList.go">캠핑장 관리</a></li>
						<li><a href="/reviewAdmList.go">후기 관리</a></li>
						<li><a href="/togetherAdmList.go">모집글 관리</a></li>
					</ul>
				</aside>
				<div class="right">
					<h3>연령대 추가</h3>
				</div>
<body>
	<div>
		<form action="ageReg.do" name="agefm" method="get">
			<table border="1">
				<tr>
					<th>연령대</th>
					<td><input type="text" name="ma_age" id="ma_age">대</td>
				</tr>
			</table>
			<input type="button" onclick=add() value="추가"/>
			<input type="button" onclick="location.href='ageAdmList.go' " value="목록"/>
		</form>
	</div>
	<%@ include file="/resources/inc/footer.jsp" %>
</body>
<script>
function add() {
	var age = document.getElementById('ma_age').value;
	if (isNaN(age)== false) {
		var yn = confirm("수정하시겠습니까?");
		if (yn == true){
			document.agefm.submit();
		}
	} else {
		console.log("true");
		alert("숫자만 입력하세요.");
	}
}
</script>
</html>