<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 프로필</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>
<script type="text/javascript" src="resources/js/jquery.twbsPagination.js"></script>


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
	
	.tab_menu{position:relative;}
  .tab_menu .list{overflow:hidden;}
  .tab_menu .list li{float:left; margin-right:14px;}
  .tab_menu .list .btn{font-size:17px;}
  .tab_menu .list .cont{display:none; position:absolute; text-align:center; width:600px; height:500px; line-height:100px;}
  .tab_menu .list li.is_on .btn{font-weight:bold; color:green;}
  .tab_menu .list li.is_on .cont{display:block;}


</style>

	<body>
	
	
	<h2>${profileView.mb_nickname}(${profileView.title})</h2>
	<h2><img src="resources/images/flame.png" width="20">${profileView.mb_fire}°C</h2>
	<h3>${profileView.age}대&nbsp;/&nbsp;${profileView.mb_gender}성</h3>
	
	
	<!-- 신고하기 -->
	<c:if test="${profileView.mb_id ne sessionScope.loginId}">	
		<button onclick="javascript:window.open('report?mb_id=${profileView.mb_id}', 'report', 'width=550, height=500');">
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
        <table>
       	 <thead>
        	<tr>
        		<th>글번호</th>
				<th>제목</th>
        	</tr>
        	</thead>
        <tbody id="list">
		
		</tbody>
		<tr>
			<td colspan="4" id="paging">
				<!-- plugin 사용법(twbspagination) -->
				<div class="container">
					<nav arial-label="Page navigation" style="text-align:center">
						<ul class="pagination" id="pagination"></ul>
					</nav>
				</div>
			</td>
		</tr>
       	</table> 
		
		 
		
		</div>
      </li>
      <li>
        <a href="#tab2" class="btn">받은 후기</a>
        <div id="tab2" class="cont">
      	  <c:forEach items="${profileReview}" var="Review">
			<table>
				<tr>
					<td id="bold">${Review.mr_assessment}</td>
					<td>${Review.mr_content}</td>
				</tr>
			</table>
		</c:forEach>
	</div>
      </li>
      
    </ul>
  </div>
</div>

	
	
	
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
	
	
	var currPage = 1;

	listCall(currPage);

	$('#pagePerNum').on('change',function(){	
		console.log('currPage : '+currPage);
		
		//페이지당 보여줄 수 변경시 계산된 페이지 적용이 안된다.(플러그인의 문제)
		//페이지당 보여줄 수 변경시 기존 페이징 요소를 없애고 다시 만들어 준다.
		$("#pagination").twbsPagination('destroy');
		listCall(currPage);
		
	});


	function listCall(page){
		
		var pagePerNum = $('#pagePerNum').val();
		console.log("param page : "+page);
		$.ajax({
			type:'GET',
			url:'list.ajax',
			data:{
				cnt : pagePerNum,
				page : page
			},
			dataType:'JSON',
			success:function(data){
				console.log(data);
				drawList(data.list);
				currPage = data.currPage;
				//불러오기가 성공되면 플러그인 을 이용해 페이징 처리
				$("#pagination").twbsPagination({
					startPage:data.currPage, //시작 페이지
					totalPages: data.pages, // 총 페이지(전체 개시물 수 / 한 페이지에 보여줄 게시물 수)
					visiblePages: 5, //한번에 보여줄 페이지 수 [1][2][3][4][5]
					onPageClick:function(e,page){
						//console.log(e);//클릭한 페이지와 관련된 이벤트 객체
						console.log(page);//사용자가 클릭한 페이지
						currPage = page;
						listCall(page);
					}
				});
				
			},
			error:function(e){
				console.log(e);
			}
		});	
	}
	
	


	function drawList(list){
		var content = '';
		profileTogether.forEach(function(profileTogether){
			//console.log(item);
			content += '<tr>';			
			content += '<td>'+Together.ct_title+'</td>';
			content += '<td>'+profileTogether.name&nbsp;profileTogether.ct_wish_start&nbsp;~&nbsp;profileTogether.ct_wish_end+'</td>';			
			content += '</tr>';
		});
		$('#list').empty();
		$('#list').append(content);
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