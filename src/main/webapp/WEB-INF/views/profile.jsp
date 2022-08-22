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
	
	
	




.tab_wrap {max-width: 800px;margin: 50px auto 0;padding: 0 15px;}
.tab_wrap .tit_list {position: relative;font-size: 0;}
.tab_wrap .tit_list:before {content:'';position: absolute;bottom: 0;left: 0;width: 100%;height: 1px;background: #ddd;z-index: 1;}
.tab_wrap .tit_list > li {display: inline-block;vertical-align: top;margin-right: 3px;}
.tab_wrap .tit_list > li a {display: inline-block;padding: 10px 15px;border: 1px solid #fff;border-radius:4px 4px 0 0;font-size: 14px;color: #000;text-decoration: none;}
.tab_wrap .tit_list > li a:hover {background: #efefef;border-color: #efefef;}
.tab_wrap .tit_list > li.active a {position: relative;border-color: #ddd;border-bottom: 1px solid #fff;background: #fff;color: #337ab7;z-index: 2;}
.tab_wrap .tab_con {border: 1px solid #ddd;border-top: none;}
.tab_wrap .tab_con .tab_list {display: none;height: 200px;padding: 15px;}
.tab_wrap .tab_list > ul {list-style:none; text-align:center; }
.tab_wrap .tab_con > ul {list-style:none; text-align:center; }
	
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
	
		


<div class="tab_wrap">
    <!-- 탭메뉴 제목 -->
    <ul class="tit_list">
        <!-- 디폴트 선택 li에 active 클래스 추가 -->
        <li><a href="javascript:;">작성한 모집글</a></li>
        <li><a href="javascript:;">받은 리뷰</a></li>
    </ul>
    <!-- 탭메뉴 컨텐츠 -->
    <div class="tab_con">
    	<table>
    		<tbody>
    			
    		</tbody>
    	</table>
    	<ul>
    		
    	</ul>
    </div>
</div>












	
	
	
	</body>	
	
	
	
	
	
	
			

	<script>
	
	
	
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
	
	var pageNum = 1;
	
	function getListPageing() {
		$.ajax({
			type: 'get',
			url: 'profile.ajax',
			data: {
				//tabIdx: $this.parent('li').index(),
				tabIdx: $('.tab_wrap > ul.tit_list > li.active').index(),
				mb_id: '${profileView.mb_id}',
				pageNum: pageNum
			},
			dataType: 'json',
			success: function(data) {
				console.log(data);
				$('.tab_con > table > tbody').empty().append(data.list);
				$('.tab_con > ul').empty().append(data.pageMaker);
			},
			error: function(e) {
				console.log(e);
			}
		});
	}
	
	$(document).on('click', '.tab_wrap > ul.tit_list > li:not(.active) > a', function() {
		var $this = $(this);
		pageNum = 1;
		
		$('.tab_wrap > ul.tit_list > li').removeClass('active');
		$(this).parent('li').addClass('active');
		
		getListPageing();
	});
	
	$('.tab_wrap > ul.tit_list > li:first-child').addClass('active');
	getListPageing();
	
	$(document).on('click', '.tab_con > ul > li > a[data]', function() {
		pageNum = $(this).attr('data');
		
		getListPageing();
	});
	
	</script>
	
	
</html>