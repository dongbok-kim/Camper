<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../../resources/inc/header.jsp" %>
		
				${campingView.ca_name}
				
				
				
				<c:choose>
					<c:when test="${campingView_review.size() == 0}">
						<p>글 없음</p>
					</c:when>
					<c:otherwise>
						<c:forEach items="${campingView_review}" var="campingView_review">		
							${campingView_review.mb_id}
						</c:forEach>
					</c:otherwise>
				</c:choose>
		
<%-- 				${campingView_together.ct_title}
 --%>
<%@ include file="../../resources/inc/footer.jsp" %>
<script></script>
</html>