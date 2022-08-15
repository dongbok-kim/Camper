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
		$('.contextMenuList').hide();
	}
});