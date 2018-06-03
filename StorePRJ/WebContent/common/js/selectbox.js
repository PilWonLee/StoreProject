$('#drop1').click(function(e) {
	e.preventDefault();
	e.stopPropagation();
	$(this).toggleClass('expanded');
	console.log($('#' + $(e.target).attr('for')));
	$('#' + $(e.target).attr('for')).prop('checked', true);
});
$('#drop2').click(function(e) {
	e.preventDefault();
	e.stopPropagation();
	$(this).toggleClass('expanded');
	console.log($('#' + $(e.target).attr('for')));
	$('#' + $(e.target).attr('for')).prop('checked', true);
});
$('#drop3').click(function(e) {
	e.preventDefault();
	e.stopPropagation();
	$(this).toggleClass('expanded');
	console.log($('#' + $(e.target).attr('for')).prop('checked'));
	$('#' + $(e.target).attr('for')).prop('checked', true);
});
$(document).click(function() {
	$('.dropdown-el').removeClass('expanded');
});