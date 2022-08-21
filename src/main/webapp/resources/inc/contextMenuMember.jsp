<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<ul id="contextMenuMember" class="contextMenuList">
	<li id="contextMenuMemberProfile"><a href=""><i class="xi-profile"></i> 프로필보기</a></li>
	<c:if test="${(sessionScope.loginId != null) and (sessionScope.mb_grade eq '회원') }">
	<li id="contextMenuMemberReport"><a href=""><i class="xi-pen"></i> 신고</a></li>
	<li id="contextMenuMemberBan"><a href=""><i class="xi-ban"></i> 차단</a></li>
	</c:if>
	<c:if test="${(sessionScope.loginId != null) and (sessionScope.mb_grade eq '관리자') }">
	<li id="contextMenuMemberView"><a href=""><i class="xi-user"></i> 회원 상세보기</a></li>
	<li id="contextMenuMemberStop"><a href=""><i class="xi-ban"></i> 회원 정지하기</a></li>
	</c:if>
</ul>