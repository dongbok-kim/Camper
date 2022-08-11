<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>크루원 후기 작성페이지</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<style></style>
</head>
<body>
	<form action="crewReview.do" method="post" name="crewForm">
		<table>
			<tr>
				<th>캠핑장명</th>
				<td>[${dto.ca_sido} ${dto.ca_sigungu}] ${dto.ca_name}
					<input type="hidden" name="ct_idx" value="${dto.ct_idx}"/>
				</td>
			</tr>
			<tr>
				<th>캠핑 기간</th>
				<td>${dto.ct_wish_start} ~ ${dto.ct_wish_end}</td>
			</tr>
			<c:forEach items="${list}" var="crew">
				<tr>
					<th>크루원 닉네임</th>	
					<td>${crew.mb_nickname}</td>
				</tr>
				<tr>
					<th>크루원 평가</th>
					<td>
						<input type="radio" name="assessment[${crew.mb_id}]" id="assessment" value="싫어요"/>싫어요
						<input type="radio" name="assessment[${crew.mb_id}]" id="assessment" value="보통"/>보통
						<input type="radio" name="assessment[${crew.mb_id}]" id="assessment" value="좋아요"/>좋아요
					</td>
				</tr>
				<tr>
					<th>내용</th>
					<td><textarea name="content[${crew.mb_id}]" id="content"></textarea></td>
				</tr>
			</c:forEach>
		</table>
		<input type="button" value="완료" onclick="radioChk()"/>
		<input type="button" value="닫기" onclick="window.close();"/>
	</form>
</body>
<script>

	function radioChk(){
		
		var form = document.crewForm;
		
		if ($('input[type=radio][id="assessment"]:checked').val()) {
			console.log($('input[type=radio][id="assessment"]:checked').val())
			form.submit();
		} 
		
	}
	
</script>
</html>