/**
 * 
 */
 $(document).ready(function() {
	$('#keyword').focus(function() {
		//alert("search");
		$('.search-icon').addClass('d-none');
		$('#keyword').attr('placeholder', '검색');
	});
	$('#keyword').focusout(function() {
		$('.search-icon').removeClass('d-none');
		$('#keyword').attr('placeholder', '      검색');
	});
});