var contextMenuMemberId = '';

$('.contextMenu').on('click', function() {
	contextMenuMemberId = $(this).data('id');
});

$(document).on('click', '.contextMenu.contextMenuMember[data-id]', function(e) {
	e.preventDefault();
	
	$('.contextMenuList').hide();
	
	$('#contextMenuMember').css({
		'display':'block',
		'left':e.pageX,
		'top':e.pageY
	});
});

$(document).on('click', function(e) {
	if($(e.target).hasClass('contextMenu') === false) {
		contextMenuMemberId = '';
		$('.contextMenuList').hide();
	}
});

// 컨텍스트 메뉴 기능 (지윤 작성)
// 관리자 페이지 > 회원 정지 > 정지 팝업 실행
$('#contextMenuMember > #contextMenuMemberStop > a').on('click', function(e) {
	e.preventDefault();
	console.log(this);
	window.open('/stopPopup.go?mb_id='+contextMenuMemberId,'popupMemberStop','width=800, height=600');
});

// 관리자 페이지 > 회원 상세보기
$('#contextMenuMember > #contextMenuMemberView > a').on('click', function(e) {
	e.preventDefault();
	console.log(this);
	location.href="/memberAdmDetail?mb_id="+contextMenuMemberId;
});

// 회원, 관리자 공통 > 회원 프로필 보기
$('#contextMenuMember > #contextMenuMemberProfile > a').on('click', function(e) {
	e.preventDefault();
	console.log(this);
	window.open('profile?mb_id='+contextMenuMemberId, 'profile', 'width=800, height=900');
});

// 마이페이지 > 회원 신고
$('#contextMenuMember > #contextMenuMemberReport > a').on('click', function(e) {
	e.preventDefault();
	console.log(this);	
	window.open('report?mb_id='+contextMenuMemberId, 'report', 'width=500, height=500');
});

// 마이페이지 > 회원 차단
$('#contextMenuMember > #contextMenuMemberBan > a').on('click', function(e) {
	e.preventDefault();
	console.log(this);
	window.open('report?mb_id='+contextMenuMemberId, 'report', 'width=500, height=500');
});