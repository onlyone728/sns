/**
 * 
 */
 $(document).ready(function() {
	// 댓글입력 게시 버튼 색 변경
	$('#comment').on("propertychange change keyup paste input", function() {
        let newValue = $(this).val();
		if (newValue.length > 1) {
			$('.post-btn').css('color', '#0095F6');
		} else {
			$('.post-btn').css('color', '#cae5fd');
		}
        
     });
 
});