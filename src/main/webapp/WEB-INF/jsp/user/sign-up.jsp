<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div id="wrap" class="d-flex justify-content-center">
	<div class="sign-up-box">
		<h1 class="logo text-center py-3">Instagram</h1>
		<div class="form-group mb-3">
			<label class="input-label" for="loginId">아이디</label>
			<input type="text" id="loginId" class="form-control font-size">
			<span id="is_duplicated_id" class="confirm-msg text-danger d-none">중복된 아이디입니다.</span>
			<span id="is_available_id" class="confirm-msg text-success d-none">사용가능한 아이디입니다.</span>
			<span id="none_id" class="confirm-msg text-danger d-none">아이디를 입력해주세요.</span>
		</div>
		<div class="form-group mb-3">
			<label class="input-label" for="password">비밀번호</label>
			<input type="password" id="password" class="form-control font-size" onFocus="this.value='';return true;">
		</div>	
		<div class="form-group mb-3">
			<label class="input-label" for="confirm_pw">비밀번호 확인</label>
			<input type="password" id="confirm_pw" class="form-control font-size" onFocus="this.value='';return true;">
			<span id="pw-check" class="confirm-msg text-danger d-none">비밀번호가 일치하지 않습니다.</span>
		</div>
		<div class="form-group mb-3">
			<label class="input-label" for="name">이름</label>
			<input type="text" id="name" class="form-control font-size">
		</div>
		<div class="form-group mb-3">
			<label class="input-label" for="email">이메일 주소</label>
			<input type="text" id="email" class="form-control font-size">
		</div>
		<button type="button" id="join-btn" class="btn btn-block">회원가입</button>
	</div>
</div>

<script type="text/javascript" src="/js/signUp.js"></script>