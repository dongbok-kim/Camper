<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 프로필</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<style>

button {
	background-color: red;
	color : white;
  	-webkit-appearance: none;
 	 -moz-appearance: none;
 	 appearance: none;
 	 
 	 margin: 0;
 	 padding: 0.5rem 1rem;

 	 
 	 font-size: 0.5rem;
 	 font-weight: 400;
	  text-align: center;
	  text-decoration: none;

	  display: inline-block;
 	 width: auto;

 	 border: none;
  	border-radius: 4px;
	}
	
	
	h3{
	color:grey;
	}
	
	
	#bold{
	font-weight:bold; 
	font-size:15px;
	}
	
	ul{
	list-style:none;
	}
	
	.tab_menu{position:relative;}
  .tab_menu .list{overflow:hidden; list-style:none;}
  .tab_menu .list li{float:left; margin-right:14px;}
  .tab_menu .list .btn{font-size:17px;}
  .tab_menu .list .cont{display:none; position:absolute; text-align:center; width:600px; height:500px; line-height:100px;}
  .tab_menu .list li.is_on .btn{font-weight:bold; color:white; background-color:purple;}
  .tab_menu .list li.is_on .cont{display:block;}


</style>

	<body>
	
	
	
	<h2>${profileView.mb_nickname}(${profileView.title})</h2>
	<h2><img src="resources/images/flame.png" width="20">${profileView.mb_fire}°C</h2>
	<h3>${profileView.age}대&nbsp;/&nbsp;${profileView.mb_gender}성</h3>
	
	
	<!-- 신고하기 -->
	<c:if test="${profileView.mb_id ne sessionScope.loginId}">	
		<button onclick="javascript:window.open('report?mb_id=${profileView.mb_id}', 'report', 'width=500, height=500');">
				신고하기</button>
 	</c:if>
 	
	<!-- 차단회원이 아닌경우 -->
	<c:if test="${profileView.mb_id ne sessionScope.loginId}">	
		<c:if test="${blockCheck eq null}">	
			<input type="button" onclick=block() value="차단하기"/>	
		</c:if>
	</c:if>
	
	
	<!-- 차단회원인 경우 -->
	<c:if test="${blockCheck ne null}">	
		<input type="button" onclick=blockDelete() value="차단해제"/>
	</c:if>
	
		
	
<div class="wrap">
  <div class="tab_menu">
    <ul class="list">
      <li class="is_on">
        <a href="#tab1" class="btn">크루모집 리스트</a>
        <div id="tab1" class="cont">
       	 <c:forEach items="${list}" var="Together" varStatus="i">
			<table>			
				<tr>
					<td id="bold"><a href="crewTogetherView.do?ct_idx=${Together.ct_idx}" target="_blank">${Together.ct_title}</a></td>
					<td>${Together.name}&nbsp;${Together.ct_wish_start}&nbsp;~&nbsp;${Together.ct_wish_end}</td>
				</tr>				
			</table>							
		</c:forEach>		
				<ul>
						<!-- 이전 페이지 버튼 -->
						<c:if test="${pageMaker.prev}">
							<li class="pageInfo_btn_prev"><a href="?mb_id=${profileView.mb_id}&amp;pageNum=${pageMaker.startPage-1}">이전</a></li>
						</c:if>
						<!-- 각 번호 페이지 버튼 -->
						<c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
							<li class="pageInfo_btn ${pageMaker.cri.pageNum eq num ? 'active' : ''}"><a href="?mb_id=${profileView.mb_id}&amp;pageNum=${num}">${num}</a></li>
						</c:forEach>
						
						<!--  다음 페이지 버튼 -->
						<c:if test="${pageMaker.next}">
							<li class="pageInfo_btn next"><a href="?mb_id=${profileView.mb_id}&amp;pageNum=${pageMaker.startPage+1}">다음</a></li>
						</c:if>
				</ul>	

		</div>
		
      </li>
      
      
      
      <li>
        <a href="#tab2" class="btn">받은 후기</a>
        <div id="tab2" class="cont">
      	  <c:forEach items="${list2}" var="Review" varStatus="i">
			<table>
				<tr>
					<td id="bold">${Review.mr_assessment}</td>
					<td>${Review.mr_content}</td>
				</tr>
			</table>
		</c:forEach>
		
				<ul>
						<!-- 이전 페이지 버튼 -->
						<c:if test="${pageMaker.prev}">
							<li class="pageInfo_btn_prev"><a href="?mb_id=${profileView.mb_id}&amp;pageNum=${pageMaker.startPage-1}">이전</a></li>
						</c:if>
						<!-- 각 번호 페이지 버튼 -->
						<c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
							<li class="pageInfo_btn ${pageMaker.cri.pageNum eq num ? 'active' : ''}"><a href="?mb_id=${profileView.mb_id}&amp;pageNum=${num}">${num}</a></li>
						</c:forEach>
						
						<!--  다음 페이지 버튼 -->
						<c:if test="${pageMaker.next}">
							<li class="pageInfo_btn next"><a href="?mb_id=${profileView.mb_id}&amp;pageNum=${pageMaker.startPage+1}">다음</a></li>
						</c:if>
				</ul>	
	</div>
      </li>
      
    </ul>
  </div>
</div>
	
	
	
	<!-- 
	
	<div>
	<c:forEach items="${list}" var="Together" varStatus="i">
		<table>
			<tr>
				<td></td>
			</tr>
			<tr>
				<td><a href="crewTogetherView.do?ct_idx=${Together.ct_idx}
				    &amp;type=${type}&amp;keyword=${keyword}&amp;pageNum=${pageMaker.cri.pageNum}" target="_blank">${Together.ct_title}</a></td>
				<td>${Together.name}&nbsp;${Together.ct_wish_start}&nbsp;~&nbsp;${Together.ct_wish_end}</td>
			</tr>
		</table>
	</c:forEach>
	<ul> 
	
	
					
	
	
	<!-- 받은리뷰
	<c:forEach items="${profileReview}" var="Review">
		<table>
			<tr>
				<td>${Review.mr_assessment}</td>
				<td>${Review.mr_content}</td>
			</tr>
		</table>
	</c:forEach>
	 -->
	
	
	
	</body>			

	<script>
	
	const tabList = document.querySelectorAll('.tab_menu .list li');
	for(var i = 0; i < tabList.length; i++){
	  tabList[i].querySelector('.btn').addEventListener('click', function(e){
	    e.preventDefault();
	    for(var j = 0; j < tabList.length; j++){
	      tabList[j].classList.remove('is_on');
	    }
	    this.parentNode.classList.add('is_on');
	  });
	}
	
	
	function block() {
		if (confirm("이 회원을 차단하시겠습니까?") == true){
			location.href='MemberBlock.do?mb_id=${profileView.mb_id}';
		}
	}
	
	
	function blockDelete() {
		if (confirm("이 회원을 차단해제 하시겠습니까?") == true){
			location.href='MemberBlockDelete.do?mb_id=${profileView.mb_id}';
		}
	}
	
	
	
	
	
	</script>
	
	
</html>