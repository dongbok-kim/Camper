$('.contextMenu.contextMenuMember').on('click', function(e) {
	e.preventDefault();
	
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