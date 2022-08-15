var msgNoticeIdx;

$(document).on('contextmenu', '#msgList > li > span', function(e) {
	e.preventDefault();
	
	msgNoticeIdx = $(this).data('idx');
	
	$('.contextMenuList').hide();
	
	$('#contextMenuChatNotice').css({
		'display':'block',
		'left':e.pageX,
		'top':e.pageY
	});
});

$('#notice').on('contextmenu dragstart selectstart', function(e) {
	e.preventDefault();
});