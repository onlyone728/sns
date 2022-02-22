/**
 * 
 */
 $(document).ready(function() {
	// input font 사이즈 축소
	$('.font-size').on('propertychange change keyup paste input', function(){
		let newValue = $(this).val();
		let selectedInput = $(this).prev('.input-label');
		if (newValue.length > 1) {
			$(selectedInput).css('padding', '4px 13px');
			$(selectedInput).css('font-size', '5px');
			$(selectedInput).css('color', '#000');
			$(this).css('padding-top', '18px');
		} else {
			$(selectedInput).css('padding', '8px 13px');
			$(selectedInput).css('font-size', '13px');
			$(selectedInput).css('color', '#787878');
			$(this).css('padding-top', '5px');
		}
	});
	
	// 로그인
	$('#loginForm').on('submit', function(e) {
		e.preventDefault();
		
		let loginId = $('#loginId').val().trim();
		let password = $('#password').val();
		
		// validate
		if (loginId == '') {
			alert("아이디를 입력해주세요.");
			return false;
		}
		if (password == '') {
			alert("비밀번호를 입력해주세요.");
			return false;
		}
		
		// ajax 호출
		let url = $(this).attr('action');
		let params = $(this).serialize();
		
		$.post(url, params)
		.done(function(data) {
			if (data.result == 'success') {
				location.href = "/timeline/timeline_list_view";	// 로그인이 성공하면 글 목록으로 이동
			} else {
				alert(data.errorMessage);
			}
		});
	});
});