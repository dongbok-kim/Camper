<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>캠핑장 후기 작성페이지</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<style></style>
</head>
<body>
	<form action="campingReviewWrite.do" method="post">
		<table>
			<tr>
				<th>캠핑장명</th>
				<td>[${dto.ca_sido} ${dto.ca_sigungu}] ${dto.ca_name}
					<input type="hidden" name="ca_idx" value="${dto.ca_idx}"/>
				</td>
			</tr>
			<tr>
				<th>캠핑 기간</th>
				<td>${dto.ct_wish_start} ~ ${dto.ct_wish_end}</td>
			</tr>
			<tr>
				<th>닉네임</th>
				<td>${nickname}<input type="hidden" name="loginId" value="${loginId}"/></td>
			</tr>
			<tr>
				<th>캠핑장 평가</th>
				<td>
					<input type="radio" name="chk_info" value="싫어요"/>싫어요
					<input type="radio" name="chk_info" value="보통"/>보통
					<input type="radio" name="chk_info" value="좋아요"/>좋아요
				</td>
			</tr>
			<tr>
				<th>내용</th>
				<td><textarea name="content"></textarea></td>
			</tr>
		</table>
		<input type="submit" value="완료"/>
		<input type="button" value="닫기" onclick="window.close();"/>
	</form>
</body>
<script>
</script>
</html>