var contextMenuMemberId = '';

$(document).on('click', '.contextMenu', function() {
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
$(document).on('click', '#contextMenuMember > #contextMenuMemberStop > a', function(e) {
	e.preventDefault();
	console.log(this);
	window.open('/stopPopup.go?mb_id='+contextMenuMemberId,'popupMemberStop','width=800, height=600');
});

// 관리자 페이지 > 회원 상세보기
$(document).on('click', '#contextMenuMember > #contextMenuMemberView > a', function(e) {
	e.preventDefault();
	console.log(this);
	location.href="/memberAdmDetail?mb_id="+contextMenuMemberId;
});

// 회원, 관리자 공통 > 회원 프로필 보기
$(document).on('click', '#contextMenuMember > #contextMenuMemberProfile > a', function(e) {
	e.preventDefault();
	console.log(this);
	window.open('profile?mb_id='+contextMenuMemberId, 'profile', 'width=800, height=600');
});

// 마이페이지 > 회원 신고
$(document).on('click', '#contextMenuMember > #contextMenuMemberReport > a', function(e) {
	e.preventDefault();
	console.log(this);	
	window.open('report?mb_id='+contextMenuMemberId, 'report', 'width=500, height=500');
});

// 마이페이지 > 회원 차단
$(document).on('click', '#contextMenuMember > #contextMenuMemberBan > a', function(e) {
	e.preventDefault();
	console.log(this);

	if (confirm("이 회원을 차단하시겠습니까?") == true){
		window.open('/MemberBlock.do?mb_id='+contextMenuMemberId, 'block', 'width=800, height=900');
		
	};

});