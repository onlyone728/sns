<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div id="wrap" class="d-flex justify-content-center">
	<div class="sign-up-box">
		<h1 class="logo text-center py-3">wonny.j</h1>
		<form id="loginForm" method="post" action="/user/sign_in">
			<div class="form-group mb-3">
				<label class="input-label" for="loginId">아이디</label>
				<input type="text" id="loginId" name="loginId" class="form-control font-size">
			</div>
			<div class="form-group mb-3">
				<label class="input-label" for="password">비밀번호</label>
				<input type="password" id="password" name="password" class="form-control font-size" onFocus="this.value='';return true;">
			</div>	
			<button type="submit" id="login-btn" class="btn btn-block">로그인</button>
			<hr>
			<a href="/user/sign_up_view" class="btn btn-block bg-gray">회원가입</a>
		</form>
	</div>
</div>

<script type="text/javascript" src="/js/signIn.js"></script>