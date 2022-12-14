<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../../resources/inc/header.jsp" %>
<style>
	#campingVote {
		margin: 0;
		padding: 0;
		list-style: none;
		text-align: center;
	}
	#campingVote > li {
		margin: 0 20px;
		display: inline-block;
		width: 21%;
	}
	#campingVote > li > a {
		text-align: left;
	}
	#campingVote > li > a > img {
		max-width: 100%;
	}
	#campingVote > li > a > strong, #campingVote > li > a > span {
		display: block;
	}
	#searchBox {
		margin: 20px 0;
		padding: 10px;
		box-sizing: border-box;
		border-radius: 10px;
		border: 1px solid #787878;
	}
	#searchBox > form > table {
		border: 1px solid #787878;
	}
	#searchBox > form > table > tbody > tr > th {
		padding: 10px;
		width: 120px;
		border: 1px solid #787878;
		background-color: #f9f9f9;
	}
	#searchBox > form > table > tbody > tr > td {
		padding: 10px;
		border: 1px solid #787878;
	}
	#searchBox > form > table > tbody > tr > td > input[type="text"] {
		width: 99%;
	}
	#searchBox > form > #btn {
		text-align: center;
	}
	#searchBox > form > #btn > input[type="submit"] {
		margin-top: 20px;
		padding: 5px 10px;
		cursor: pointer;
		outline: none;
		border: none;
		color: #fff;
		background-color: #32405d;
	}
	#totalCnt > strong {
		color: orange;
	}
	#campingList {
		margin: 0;
		padding: 0;
		list-style: none;
	}
	#campingList > li {
		margin: 10px 0;
	}
	#campingList > li > a > span.imgBox {
		float: left;
		width: 200px;
	}
	#campingList > li > a > span.imgBox > img {
		max-width: 100%;
	}
	#campingList > li > a > span.infoBox {
		margin: 0px 10px;
		float: left;
		width: 980px;
		line-height: 180%;
	}
	#campingList > li > a > span.infoBox > strong {
		display: inline-block;
		width: 100%;
	}
	#campingList > li > a span.infoBox > span.intro {
		font-size: 13px;
		color: #787878;
	}
	#campingList > li > a > span.infoBox > span.address {
		padding-left: 24px;
		display: block;
		font-size: 12px;
		background-image: url('../../resources/images/ico_map.png');
		background-repeat: no-repeat;
		background-position: 0px 3px;
	}
	#campingList > li > .cnt {
		margin: 10px 0px 10px 5px;
		padding: 0px 10px;
		display: inline-block;
	}
	#campingList > li > .cnt.cntLike {
		color: #fff;
		background-color: #d6394c;
	}
	#campingList > li > .cnt.cntReview {
		color: #fff;
		background-color: #585858;
	}
</style>
				<div id="full">
					<h3>????????? ??????</h3>
					<ul id="campingVote">
					<c:forEach items="${campingRecom}" var="campingRecom">
						<li>
							<a href="/campingView.go?ca_idx=${campingRecom.ca_idx}">
								<c:choose>
									<c:when test="${campingRecom.ca_img ne ''}">
										<img src="${campingRecom.ca_img}" onerror="javascript:this.src='../../resources/images/no_picture.png';" alt="????????? ?????????" />
									</c:when>
									<c:otherwise>
										<img src="../../resources/images/no_picture.png"/>
									</c:otherwise>
								</c:choose>
								<strong>${campingRecom.ca_name}</strong>
								<span>${campingRecom.ca_sido} ${campingRecom.ca_sigungu}</span>
							</a>
						</li>
					</c:forEach>
					</ul>
					
					<div id="searchBox">
						<form id="campingSearchForm" action="campingList.go" method="post">
							<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}" />
							<table>
								<tbody>
									<tr>
										<th>?????????</th>
										<td>
											<label><input type="checkbox" name="ca_sido" value="??????" <c:if test="${fn:contains(ca_sido, '??????')}">checked="checked"</c:if>/> ??????</label>
											<label><input type="checkbox" name="ca_sido" value="??????" <c:if test="${fn:contains(ca_sido, '??????')}">checked="checked"</c:if>/> ??????</label>
											<label><input type="checkbox" name="ca_sido" value="??????" <c:if test="${fn:contains(ca_sido, '??????')}">checked="checked"</c:if>/> ??????</label>
											<label><input type="checkbox" name="ca_sido" value="??????" <c:if test="${fn:contains(ca_sido, '??????')}">checked="checked"</c:if>/> ??????</label>
											<label><input type="checkbox" name="ca_sido" value="??????" <c:if test="${fn:contains(ca_sido, '??????')}">checked="checked"</c:if>/> ??????</label>
											<label><input type="checkbox" name="ca_sido" value="??????" <c:if test="${fn:contains(ca_sido, '??????')}">checked="checked"</c:if>/> ??????</label>
											<label><input type="checkbox" name="ca_sido" value="??????" <c:if test="${fn:contains(ca_sido, '??????')}">checked="checked"</c:if>/> ??????</label>
											<label><input type="checkbox" name="ca_sido" value="??????" <c:if test="${fn:contains(ca_sido, '??????')}">checked="checked"</c:if>/> ??????</label>
											<label><input type="checkbox" name="ca_sido" value="??????" <c:if test="${fn:contains(ca_sido, '??????')}">checked="checked"</c:if>/> ??????</label>
											<label><input type="checkbox" name="ca_sido" value="??????" <c:if test="${fn:contains(ca_sido, '??????')}">checked="checked"</c:if>/> ??????</label>
											<label><input type="checkbox" name="ca_sido" value="??????" <c:if test="${fn:contains(ca_sido, '??????')}">checked="checked"</c:if>/> ??????</label>
											<label><input type="checkbox" name="ca_sido" value="??????" <c:if test="${fn:contains(ca_sido, '??????')}">checked="checked"</c:if>/> ??????</label>
											<label><input type="checkbox" name="ca_sido" value="??????" <c:if test="${fn:contains(ca_sido, '??????')}">checked="checked"</c:if>/> ??????</label>
											<label><input type="checkbox" name="ca_sido" value="??????" <c:if test="${fn:contains(ca_sido, '??????')}">checked="checked"</c:if>/> ??????</label>
											<label><input type="checkbox" name="ca_sido" value="??????" <c:if test="${fn:contains(ca_sido, '??????')}">checked="checked"</c:if>/> ??????</label>
											<label><input type="checkbox" name="ca_sido" value="??????" <c:if test="${fn:contains(ca_sido, '??????')}">checked="checked"</c:if>/> ??????</label>
											<label><input type="checkbox" name="ca_sido" value="??????" <c:if test="${fn:contains(ca_sido, '??????')}">checked="checked"</c:if>/> ??????</label>
										</td>
									</tr>
									<tr>
										<th>?????????</th>
										<td>
											<label><input type="checkbox" name="ca_theme" value="????????????" <c:if test="${fn:contains(ca_theme, '????????????')}">checked="checked"</c:if>/> ????????????</label>
											<label><input type="checkbox" name="ca_theme" value="????????????" <c:if test="${fn:contains(ca_theme, '????????????')}">checked="checked"</c:if>/> ????????????</label>
											<label><input type="checkbox" name="ca_theme" value="????????????" <c:if test="${fn:contains(ca_theme, '????????????')}">checked="checked"</c:if>/> ????????????</label>
											<label><input type="checkbox" name="ca_theme" value="??????????????????" <c:if test="${fn:contains(ca_theme, '??????????????????')}">checked="checked"</c:if>/> ??????????????????</label>
											<label><input type="checkbox" name="ca_theme" value="??????????????????" <c:if test="${fn:contains(ca_theme, '??????????????????')}">checked="checked"</c:if>/> ??????????????????</label>
											<label><input type="checkbox" name="ca_theme" value="????????????" <c:if test="${fn:contains(ca_theme, '????????????')}">checked="checked"</c:if>/> ????????????</label>
											<label><input type="checkbox" name="ca_theme" value="????????????" <c:if test="${fn:contains(ca_theme, '????????????')}">checked="checked"</c:if>/> ????????????</label>
											<label><input type="checkbox" name="ca_theme" value="????????????" <c:if test="${fn:contains(ca_theme, '????????????')}">checked="checked"</c:if>/> ????????????</label>
											<label><input type="checkbox" name="ca_theme" value="?????????" <c:if test="${fn:contains(ca_theme, '?????????')}">checked="checked"</c:if>/> ?????????</label>
											<label><input type="checkbox" name="ca_theme" value="??????" <c:if test="${fn:contains(ca_theme, '??????')}">checked="checked"</c:if>/> ??????</label>
											<label><input type="checkbox" name="ca_theme" value="??????" <c:if test="${fn:contains(ca_theme, '??????')}">checked="checked"</c:if>/> ??????</label>
											<label><input type="checkbox" name="ca_theme" value="???????????????" <c:if test="${fn:contains(ca_theme, '???????????????')}">checked="checked"</c:if>/> ???????????????</label>
										</td>
									</tr>
									<tr>
										<th>????????????</th>
										<td>
											<label><input type="checkbox" name="ca_pet" <c:if test="${ca_pet eq '??????'}">checked="checked"</c:if> value="??????" /> ???????????? ?????? ??????</label>
										</td>
									</tr>
									<tr>
										<th>????????????</th>
										<td><input type="text" name="ca_name" value="${ca_name}"/></td>
									</tr>
								</tbody>
							</table>
							<div id="btn">
								<input type="submit" value="SEARCH" />
							</div>
						</form>
					</div>
					<p id="totalCnt">??? <strong>${campingCnt}</strong>???</p>
					<c:if test="${campingCnt eq 0}">??????????????? ????????????.</c:if>
					<ul id="campingList">
					<c:forEach items="${campingList}" var="campingList">
						<li>
							<a href="/campingView.go?ca_idx=${campingList.ca_idx}">
								<span class="imgBox">
									<c:choose>
										<c:when test="${campingList.ca_img ne ''}">
											<img src="${campingList.ca_img}" onerror="javascript:this.src='../../resources/images/no_picture.png';" alt="????????? ?????????" />
										</c:when>
										<c:otherwise>
											<img src="../../resources/images/no_picture.png"/>
										</c:otherwise>
									</c:choose>
								</span>
								<span class="infoBox">
									<strong>[${campingList.ca_sido} ${campingList.ca_sigungu}] ${campingList.ca_name}</strong>
									<c:choose>
										<c:when test="${campingList.ca_intro ne ''}">
											<span class="intro">${campingList.ca_intro}</span>
										</c:when>
										<c:otherwise>
											<span class="intro">????????? ???????????? ????????????.</span>
										</c:otherwise>
									</c:choose>
									<span class="address">${campingList.ca_addr_default} ${campingList.ca_addr_detail}</span>
								</span>
							</a>
							<span class="cnt cntLike">????????? ${campingList.cntLike}</span>
							<span class="cnt cntReview">?????? ${campingList.cntReview}</span>
							<div style="clear:both;"></div>
						</li>
					</c:forEach>
					</ul>
					<ul class="pageInfo">	
						<!-- ??????????????? ?????? -->
						<c:if test="${pageMaker.prev}">
						<li class="pageInfo_btn prev"><a href="javascript:;" data="${pageMaker.startPage-1}">??????</a></li>
						</c:if>
						
						<!-- ??? ?????? ????????? ?????? -->
						<c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
						<li class="pageInfo_btn ${pageMaker.cri.pageNum eq num ? 'active' : ''}"><a href="javascript:;" data="${num}">${num}</a></li>
						</c:forEach>
						
						<!-- ??????????????? ?????? -->
						<c:if test="${pageMaker.next}">
						<li class="pageInfo_btn next"><a href="javascript:;" data="${pageMaker.endPage+1}">??????</a></li>
						</c:if>
					</ul>	
				</div>
<%@ include file="../../resources/inc/footer.jsp" %>
	<script>
		$('ul > li.pageInfo_btn > a').on('click', function() {
			$('input:hidden[name="pageNum"]').val($(this).attr('data'));
			$('#campingSearchForm').submit();
		})
	</script>
</html>