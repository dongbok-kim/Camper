<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>크루인원 확정</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<style></style>
</head>
<body>
	<h2>${info.ca_name}</h2>
	<p>(${info.ct_wish_start} ~ ${info.ct_wish_end})</p>
	<form action="crewUpdate.do" method="post" name="crewForm">
		<table>
			<c:forEach items="${list}" var="crew">
				<tr>
					<td><input type="checkbox" name="crew_chk" value="${crew.mb_id}"/>
					</td>
					<td>${crew.mb_nickname}</td>
				</tr>
			</c:forEach>
		</table>
		<!-- 
		<button>완료</button>
		<button onclick="window.close();">닫기</button>  -->
		<input type="submit" value="완료" onclick="chkarr(idx)"/>
		<input type="button" value="닫기" onclick="window.close();"/>
	</form>
</body>
<script>
	function chkarr(idx){
		
		var form = document.crewForm;
		/*
		var obj = $("[name=crew_chk]");        
		var chkArray = new Array(); // 배열 선언         
		
		$('input:checkbox[name=crew_chk]:checked').each(function() { // 체크된 체크박스의 value 값을 가지고 온다.           
			 chkArray.push(this.value);        
		});       
			 
		$('#hiddenValue').val(chkArray);                
		console.log(chkArray);*/
		// form.submit(); 
		console.log(idx);
	}
</script>
</html>