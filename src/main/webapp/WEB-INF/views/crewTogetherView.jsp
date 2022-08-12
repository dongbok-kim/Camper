<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../../resources/inc/header.jsp" %>
<body>
	<div >	
		<form action="crewTogetherView.do" method="post">
			<table class="cct">        
		          <tr>
		              <th colspan="6" align="left">${cct.ct_title}</th>
		          </tr>
		          <tr>
		            <th>성별</th>
		            <td>${cct.ct_gender}</td>
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
		            <td>${fn:substring(cct.ct_datetime,0,19)}</td>
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
		            <td colspan="5">${cct.ca_idx}</td>
		          </tr>        
		          <tr>
		            <td colspan="6">${cct.ct_content}</td>
		          </tr>
		       </table>
	             <input type="button" value="목록" onclick="location.href='crewTogetherList.do'"/> 
	             <input type ="submit" value="수정" onclick="location.href='crewTogetherUpdate.go?ct_idx=${cct.ct_idx}'" style="float:right; margin-left:5px;"/>
	             <input type="button" value="삭제" onclick="del(${cct.ct_idx})" style="float:right; margin-left:5px;"/>       
	      </form>
	</div>

	
		<tr>
            <td>${cct.mb_id}/</td>
            <td>${cct.mb_nickname}/</td>
            <td>${cct.ma_age}대/</td>
            <td>${cct.ct_gender}</td>   
            <td><a href="/chat.do">크루신청</a></td>
          </tr>   
                  	

		</form>

</body>



<%@ include file="../../resources/inc/footer.jsp" %>
	<script>
		function del(ct_idx){
			var chk = confirm("삭제 시 크루 및 채팅방도 같이 삭제 됩니다. 정말 삭제하시겠습니까?")
			if(chk){
				location.href='crewTogetherList?ct_idx='+ct_idx;
			}
		}
	</script>
</html>