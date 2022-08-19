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
        <li class="active"><a href="#con01">작성한 모집글</a></li>
        <li><a href="#con02">받은 리뷰</a></li>
        
    </ul>
    <!-- 탭메뉴 컨텐츠 -->
    <div class="tab_con">
        <div id="con01" class="tab_list">
            <c:forEach items="${list}" var="Together" varStatus="i">
			<table>			
				<tr>
					<td>${listCnt - skip - i.index}</td>
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
							<li class="pageInfo_btn ${pageMaker.cri.pageNum eq num ? 'active' : ''}"><a href="?mb_id=${profileView.mb_id}&amp;pageNum=${num}&amp;tabName=con01">${num}</a></li>
						</c:forEach>
						
						<!--  다음 페이지 버튼 -->
						<c:if test="${pageMaker.next}">
							<li class="pageInfo_btn next"><a href="?mb_id=${profileView.mb_id}&amp;pageNum=${pageMaker.startPage+1}">다음</a></li>
						</c:if>
				</ul>	
        </div>
            
        <div id="con02" class="tab_list">
            <c:forEach items="${list2}" var="Review" varStatus="i">
			<table>
				<tr>
					<td>${listCnt2 - skip2 - i.index}</td>
					<td id="bold">${Review.mr_assessment}</td>
					<td>${Review.mr_content}</td>
				</tr>
			</table>
		</c:forEach>
				<ul>
						<!-- 이전 페이지 버튼 -->
						<c:if test="${pageMaker2.prev}">
							<li class="pageInfo_btn_prev"><a href="?mb_id=${profileView.mb_id}&amp;pageNum=${pageMaker2.startPage-1}">이전</a></li>
						</c:if>
						<!-- 각 번호 페이지 버튼 -->
						<c:forEach var="num2" begin="${pageMaker2.startPage}" end="${pageMaker2.endPage}">
							<li class="pageInfo_btn ${pageMaker2.cri.pageNum eq num2 ? 'active' : ''}"><a href="?mb_id=${profileView.mb_id}&amp;pageNum=${num2}&amp;tabName=con02">${num2}</a></li>
						</c:forEach>
						
						<!--  다음 페이지 버튼 -->
						<c:if test="${pageMaker2.next}">
							<li class="pageInfo_btn next"><a href="?mb_id=${profileView.mb_id}&amp;pageNum=${pageMaker2.startPage+1}">다음</a></li>
						</c:if>
				</ul>
        </div>

        
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
	
	
	
	
	
	$(document).ready(function(){
	    tab();
	})

	function tab(){
	    //탭메뉴 클릭할 때 실행
	    $('.tab_wrap .tit_list > li a').on('click', function(e) {
	        e.preventDefault();
	    
	        //초기화
	        $('.tab_wrap .tit_list > li').removeClass('active');
	        $('.tab_wrap .tab_list').hide(); 
	        
	        //실행
	        $(this).parent().addClass('active'); 
	        var activeTab = $(this).attr('href');
	        $(activeTab).show();

	        //파라미터 확인
	        urlParam =  location.search.substr(location.search.indexOf("?") + 1);
	        if(urlParam != ''){
	            urlParam = '?' + urlParam;
	        }

	        //파라미터 변경
	        getNewUrl('tabName', urlParam); //(변경·추가할 파라미터 이름, 현재 파라미터)
	        function getNewUrl(paramName, oldUrl) {
	            var newUrl;
	            var urlChk = new RegExp('[?&]'+paramName+'\\s*=');
	            var urlChk2 = new RegExp('(?:([?&])'+paramName+'\\s*=[^?&]*)')
	            
	            
	            if (urlChk.test(oldUrl)) { //해당 파라미터가 있을 때
	                newUrl = oldUrl.replace(urlChk2, "$1"+paramName+"=" + activeTab.substr(1));
	            } else if (/\?/.test(oldUrl)) { //해당 파라미터가 없고 다른 파라미터가 있을 때
	                newUrl = oldUrl + "&"+paramName+"=" + activeTab.substr(1);
	            } else { //파라미터가 없을 때
	                newUrl = oldUrl + "?"+paramName+"=" + activeTab.substr(1);
	            }

	            history.pushState(null, null, newUrl);
	        }
	    });

	    //파라미터 값 검사
	    function getParameter(name) {
	        name = name.replace(/[\[]/, "\\[").replace(/[\]]/, "\\]");
	        var regex = new RegExp("[\\?&]" + name + "=([^&#]*)"),
	            results = regex.exec(location.search);
	        return results === null ? "" : decodeURIComponent(results[1].replace(/\+/g, " "));
	    }

	    var getParam = getParameter('tabName'); //선택한 탭 파라미터
	    var loadChk = getParameter('loadChk'); //첫 로드 여부 체크
	    
	    if(getParam != ''){ //파라미터 값이 있으면 파라미터 값 기준으로 탭메뉴 선택
	        $('.tab_wrap .tit_list > li a[href="#'+getParam+'"]').parent().addClass('active'); 
	        $('.tab_wrap .tit_list > li a[href="#'+getParam+'"]').trigger('click');

	        if(loadChk == 'on'){ //처음 로드되었으면 스크롤 이동
	            //탭 위치로 이동
	            var tabTop = $('.tab_wrap').offset().top;
	            $(window).scrollTop(tabTop - 100);

	            //파라미터 확인
	            var urlParam =  location.search.substr(location.search.indexOf("?") + 1);
	            if(urlParam != ''){
	                urlParam = '?' + urlParam;
	            }
	            
	            //loadChk 파라미터 값 변경
	            loadChange('loadChk', urlParam);
	            function loadChange(paramName, oldUrl) {
	                var newUrl;
	                var urlChk = new RegExp('[?&]'+paramName+'\\s*=');
	                var urlChk2 = new RegExp('(?:([?&])'+paramName+'\\s*=[^?&]*)')
	                newUrl = oldUrl.replace(urlChk2, "$1"+paramName+"=off");
	                history.pushState(null, null, newUrl);
	            }
	        }
	    }else{ //파라미터 값이 없으면 active 클래스 기준으로 탭메뉴 선택
	        var activeChk = 0;
	        $('.tab_wrap .tit_list > li').each(function(i) { 
	            if ($(this).hasClass('active')){
	                $(this).addClass('active'); 
	                $(this).find('a').trigger('click');
	                activeChk ++
	            }
	        });

	        //active 지정 안했을 시 첫 탭메뉴 선택
	        if(activeChk == 0){
	            $('.tab_wrap .tit_list > li:first-child a').trigger('click');
	        }
	    }

	    //뒤로가기 탭메뉴 복구
	    window.onpopstate = function(event) {
	        //초기화
	        $('.tab_wrap .tit_list > li').removeClass('active');
	        $('.tab_wrap .tab_list').hide(); 
	        var getParam2 = getParameter('tabName'); //선택한 탭 파라미터
	        
	        //탭메뉴 열기
	        if(getParam2 != ''){
	            $('.tab_wrap .tit_list > li a[href="#'+getParam2+'"]').parent().addClass('active');
	            $('#'+getParam2).show()
	        }else{
	            $('.tab_wrap .tit_list > li:first-child').addClass('active');
	            $('.tab_wrap .tab_list:first-of-type').show();
	        }
	    };
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

	
	</script>
	
	
</html>