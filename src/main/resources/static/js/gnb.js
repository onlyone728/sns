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
	
	// 버튼 클릭시 메뉴 오픈
	$(document).on('click', '#menuBtn', function (e){
		e.preventDefault();
		let target = $(this).attr('href');
		$(target).removeClass('d-none');
	});
	// 외부영역 클릭 시 팝업 닫기
	$(document).mouseup(function(e){
		let LayerPopup = $('#user-menu-area');
		if(LayerPopup.has(e.target).length === 0){
			LayerPopup.addClass('d-none');
		};
	});	
});