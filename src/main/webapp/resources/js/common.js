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

// 관리자 페이지 > 회원 팝업
$('#contextMenuMember > #contextMenuMemberStop > a').on('click', function(e) {
	e.preventDefault();
	console.log(this);
	window.open('/stopPopup.go?mb_id='+contextMenuMemberId,'popupMemberStop','width=800, height=600');
});