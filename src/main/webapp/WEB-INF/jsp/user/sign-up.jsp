<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div id="wrap" class="d-flex justify-content-center">
	<div class="sign-up-box">
		<h1 class="text-center py-3">Instagram</h1>
		<div class="form-group mb-3">
			<span class="input-label">아이디</span>
			<input type="text" id="loginId" class="form-control font-size">
			<span id="is_duplicated_id" class="confirm-msg text-danger d-none">중복된 아이디입니다.</span>
			<span id="is_available_id" class="confirm-msg text-success d-none">사용가능한 아이디입니다.</span>
		</div>
		<div class="form-group mb-3">
			<span class="input-label">비밀번호</span>
			<input type="password" id="password" class="form-control font-size" onFocus="this.value='';return true;">
		</div>	
		<div class="form-group mb-3">
			<span class="input-label">비밀번호 확인</span>
			<input type="password" id="confirm_pw" class="form-control font-size" onFocus="this.value='';return true;">
			<span id="pw-check" class="confirm-msg text-danger d-none">비밀번호가 일치하지 않습니다.</span>
		</div>
		<div class="form-group mb-3">
			<span class="input-label">이름</span>
			<input type="text" id="name" class="form-control font-size">
		</div>
		<div class="form-group mb-3">
			<span class="input-label">이메일 주소</span>
			<input type="text" id="email" class="form-control font-size">
		</div>
		<button type="button" id="join-btn" class="btn btn-block">회원가입</button>
	</div>
</div>

<script>
$(document).ready(function() {
	// input font 사이즈 축소
	$('.font-size').on('input', function(){
		let selectedInput = $(this).prev('.input-label');
		$(selectedInput).css('padding', '4px 13px');
		$(selectedInput).css('font-size', '5px');
		$(selectedInput).css('color', '#000');
		$(this).css('padding-top', '18px');
	});
	
	$('#loginId').focusout(function() {
		let loginId = $('#loginId').val().trim();
		
		$.ajax({
			type: "GET"
			, url: "/user/is_duplicated_id"
			, data: {"loginId": loginId}
			, success: function(data) {
				if (data.result == true) {
					// 중복일 때
					$('#is_duplicated_id').removeClass('d-none');
					$('#is_available_id').addClass('d-none');
				} else {
					$('#is_duplicated_id').addClass('d-none');
					$('#is_available_id').removeClass('d-none');
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
		document.getElementById('password').value = null;
		document.getElementById('confirm_pw').value = null;
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
				alert(loginId + "님 반갑습니다.");
				location.reload();
			}
			, error: function(e) {
				alert("관리자에게 문의하세요.");
			}
		});
	});
});
</script>