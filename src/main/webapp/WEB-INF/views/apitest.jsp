<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../../resources/inc/header.jsp" %>
				

			<h3>${campingNew.ca_name}</h3>
			
				
				<div id="infoBox">
					<table>
						<colgroup>
							<col width="200"></col>
							<col width="*"></col>
						</colgroup>
						<tbody>
							<tr>
								<th>이름</th>
								<td>${campingNew.ca_name} 
									<c:if test="${campingNew.ca_name ne apiCa_name}">
										<td style="color: red">api정보 : ${apiCa_name}</td>
									</c:if>
								</td>
							</tr>
							<tr>
								<th>우편번호</th>
								<td>${campingNew.ca_postcode}
									<c:if test="${campingNew.ca_addr_default ne apiCa_postcode}">
										<td style="color: red">api정보 : ${apiCa_postcode}</td>
									</c:if>
								</td>
							</tr>
							<tr>
								<th>전화번호</th>
								<td>${campingNew.ca_tel}</td>
							</tr>
							<tr>
								<th>운영일</th>
								<td>${campingNew.ca_oper_date}</td>
							</tr>
							<tr>
								<th>업종</th>
								<td>${campingNew.ca_induty}</td>
							</tr>
							<tr>
								<th>운영계절</th>
								<td>${campingNew.ca_oper_period}</td>
							</tr>
							<tr>
								<th>주변이용가능시설</th>
								<td>${campingNew.ca_possibilty}</td>
							</tr>
							<tr>
								<th>캠핑장 환경</th>
								<td>${campingNew.ca_environment}</td>
							</tr>
							<tr>
								<th>캠핑장 테마</th>
								<td>${campingNew.ca_theme}</td>
							</tr>
						</tbody>
					</table>



<%@ include file="../../resources/inc/footer.jsp" %>
	<script></script>
</html>