/**
 * 
 */

$(function(){
	$('h1.site-heading.text-center.text-white.d-none.d-lg-block').click(function(){
		location.href = 'main.do';
	});
	 $('h1.site-heading.text-center.text-white.d-none.d-lg-block > span').mouseover(function(event){
		$(this).css('cursor','pointer');
	}) 
});