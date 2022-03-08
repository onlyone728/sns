/**
 * 
 */
 $(document).ready(function() {
	// input font 사이즈 축소
	$('.font-size').on('propertychange change keyup paste input', function(){
		let newValue = $(this).val();
		let selectedInput = $(this).prev('.input-label');
		if (newValue.length > 0) {
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
	
	
	$('#loginId').focusout(function() {
		let loginId = $('#loginId').val().trim();
		
		if (loginId == '') {
			$('#none_id').removeClass('d-none');
			return;
		}
		
		$.ajax({
			type: "GET"
			, url: "/user/is_duplicated_id"
			, data: {"loginId": loginId}
			, success: function(data) {
				if (data.result == true) {
					// 중복일 때
					$('#is_duplicated_id').removeClass('d-none');
					$('#is_available_id').addClass('d-none');
					$('#none_id').addClass('d-none');
				} else if (data.result == false){
					$('#is_duplicated_id').addClass('d-none');
					$('#none_id').addClass('d-none');
					$('#is_available_id').removeClass('d-none');
				} else {
					$('#is_duplicated_id').addClass('d-none');
					$('#is_available_id').addClass('d-none');
					$('#none_id').removeClass('d-none');
				}
			}
			, error: function(e) {
				alert("관리자에게 문의하세요.");
			}
		});
		
	});
	
	// 비밀번호 클릭시 초기화
	$('#password').focus(function() {
		$('#pw-check').addClass('d-none');
		$('#password').val('');
		$('#confirm_pw').val('');
	});
	
	// 비밀번호 확인
	$('#confirm_pw').focusout(function() {
		let password = $('#password').val().trim();
		let confirmPw = $('#confirm_pw').val().trim();
		
		if (password != confirmPw) {
			$('#pw-check').removeClass('d-none');
		}
	});
	
	// join
	$('#join-btn').on('click', function() {
		let loginId = $('#loginId').val().trim();
		let password = $('#password').val().trim();
		let confirm_pw  = $('#confirm_pw').val().trim();
		let name = $('#name').val().trim();
		let email = $('#email').val().trim();
		
		if (loginId == '') {
			alert("아이디를 입력해주세요.");
			$('#loninId').focus();
			return;
		}
		if ($('#is_available_id').hasClass('d-none')) {
			alert("아이디를 다시 입력해주세요.");
			$('#loninId').focus();
			return;
		}
		if (password == '') {
			alert("비밀번호를 입력해주세요.");
			$('#password').
			$('#password').focus();
			$('#pw-check').addClass('d-none');
			document.getElementById('password').value = null;
			document.getElementById('confirm_pw').value = null;
			return;
		}
		if (confirm_pw == '') {
			alert("비밀번호를 확인해주세요.");
			$('#password').focus();
			$('#pw-check').addClass('d-none');
			document.getElementById('password').value = null;
			document.getElementById('confirm_pw').value = null;
			return;
		}
		if (!$('#pw-check').hasClass('d-none')) {
			alert("비밀번호를 확인해주세요.");
			$('#password').focus();
			$('#pw-check').addClass('d-none');
			document.getElementById('password').value = null;
			document.getElementById('confirm_pw').value = null;
			return;
		}
		if (name == '') {
			alert("이름을 입력해주세요.");
		}
		if (email == '') {
			alert("이메일 주소를 입력해주세요.");
		}
		
		const arr = email.split('@');
		if (arr.length < 2) {
			alert("이메일 주소를 형식이 잘못되었습니다.");
		}
		
		$.ajax({
			type: "POST"
			, url: "/user/sign_up"
			, data: {"loginId": loginId, "password": password, "name": name, "email": email}
			, success: function(data) {
				alert(loginId + "님 반갑습니다.\n로그인 후 이용해주세요.");
				location.href = "/user/sign_in_view";
			}
			, error: function(e) {
				alert("관리자에게 문의하세요.");
			}
		});
	});
});