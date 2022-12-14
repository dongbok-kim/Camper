<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../../resources/inc/header.jsp" %>
<style>
	#left {
		margin-top: 20px;
		float: left !important;
		max-width: 980px !important;
		width: 100% !important;
	}
	
	#left > table {
		border: 1px solid #787878;
	}
	#left > table > thead > tr > td {
		padding: 10px;
		background-color: #f9f9f9;
	}
	#left > table > thead > tr > td > h3 {
		margin: 0;
	}
	#left > table > tbody > tr > th {
		padding: 10px;
		border: 1px solid #787878;
		background-color: #f9f9f9;
	}
	#left > table > tbody > tr > td {
		padding: 10px;
		border: 1px solid #787878;
	}
	#left > table > tbody > #ctContent {
		vertical-align: top;
		height: 180px;
	}
	#left > table > tfoot > tr > td {
		padding: 10px;
	}
	
	#right {
		margin-top: 20px;
		float: right !important;
		max-width: 200px !important;
		width: 100% !important;
	}
	#right > table {
		border: 1px solid #787878;
	}
	#right > table > tbody > tr > th {
		padding: 10px;
		border: 1px solid #787878;
		background-color: #f9f9f9;
	}
	#right > table > tbody > tr > td {
		padding: 10px;
		border: 1px solid #787878;
	}
	#right > table > tbody > tr > td > a {
		padding: 5px 10px;
		display: block;
		text-align: center;
		color: #fff;
		background-color: #32405d;
	}
</style>
<c:if test="${cct ne null}">
				<div id="left">
					<table>
						<colgroup>
							<col width="10%"></col>
							<col width="*"></col>
							<col width="10%"></col>
							<col width="20%"></col>
							<col width="10%"></col>
							<col width="20%"></col>
						</colgroup>
						<thead>
							<tr>
								<td colspan="6"><h3>${cct.ct_title}</h3></td>
							</tr>
						</thead>
						<tbody>
							<tr>
								<th>성별</th>
								<td>${cct.ct_gender}<c:if test="${cct.ct_gender ne null and cct.ct_gender ne '혼성'}">성</c:if></td>
								<th>연령대</th>
								<td>${cct.ct_age}대</td>
								<th>모집인원</th>
								<td>${cct.ct_people_cnt}명</td>
							</tr>                
							<tr>
								<th>캠핑종류</th>
								<td>${cct.ct_camping_type}</td>
								<th>장비제공</th>
								<td>	            
									<c:choose>
									<c:when test="${cct.ct_tool eq 1}">가능</c:when>
									<c:when test="${cct.ct_tool eq 0}">불가능</c:when>				   
									</c:choose>
								</td>	            
								<th>작성일시</th>
								<td>${fn:substring(cct.ct_datetime,0,16)}</td>
							</tr>
							<tr>
								<th>애견동반</th>
								<td>
									<c:choose>
									<c:when test="${cct.ct_pet eq 1}">가능</c:when>
									<c:when test="${cct.ct_pet eq 0}">불가능</c:when>					   
									</c:choose>
								</td>           
								<th>희망날짜</th>
								<td colspan="3">${cct.ct_wish_start}~${cct.ct_wish_end}</td>
							</tr>
							<tr>
								<th>캠핑장명</th>
								<td colspan="5">${cct.ca_name}</td>
							</tr>        
							<tr id="ctContent">
								<td colspan="6">${cct.ct_content}</td>
							</tr>
						</tbody>
						<tfoot>
							<tr>
								<td colspan="6">
									<input type="button" value="목록" class="btn btnList" onclick="location.href='crewTogetherList.do'"/> 
									<c:if test="${sessionScope.loginId eq cct.mb_id}">
									<input type="button" value="삭제" class="btn btnDelete" onclick="del(${cct.ct_idx})" style="float:right; margin-left:5px;"/>       
									<input type ="button" value="수정" class="btn btnModify" onclick="location.href='crewTogetherUpdate.go?ct_idx=${cct.ct_idx}'" style="float:right; margin-left:5px;"/>
									</c:if>
								</td>
							</tr>
						</tfoot>
					</table>
				</div>
				
				<div id="right">
					<table>	
						<tbody>
							<tr>
								<td>
									<strong class="contextMenu contextMenuMember" data-id="${cct.mb_id}">${cct.mb_nickname}</strong><br />
									${cct.ma_age}대/${cct.mb_gender}성
								</td>
							</tr>
							<tr>
								<td>크루모집현황 : <strong>${cct.cnt}</strong>명</td>           
							</tr>
							<tr>
								<td><a href="javascript:;" onclick="javascript:window.open('chat.do?cg_idx=${cct.cg_idx}', 'chat', 'width=1200, height=750')">크루신청</a></td>
							</tr>
						</tbody>
					</table>
				</div>
</c:if>
<%@ include file="../../resources/inc/footer.jsp" %>
	<script>
		var msg = "${msg}";
		if(msg != "") {
			window.alert(msg);
			location.href = 'crewTogetherList.do';
		}
		
		function del(ct_idx){
			var chk = confirm("삭제 시 채팅 방도 같이 삭제 됩니다. 정말 삭제하시겠습니까?")
			if(chk){
				location.href='crewTogetherDelete.do?ct_idx='+ct_idx;
			}
		}
	</script>
</html>