<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="box-800 d-flex align-items-center justify-content-between">
	<h1 class="logo">
		<a href="/timeline/timeline_list_view">wonny.j</a>
	</h1>
	<div class="search-group form-group">
		<i class="search-icon">
			<svg aria-label="검색" class="_8-yf5 " color="#8e8e8e" fill="#8e8e8e"
				height="16" role="img" viewBox="0 0 24 24" width="16">
				<path d="M19 10.5A8.5 8.5 0 1110.5 2a8.5 8.5 0 018.5 8.5z"
					fill="none" stroke="currentColor" stroke-linecap="round"
					stroke-linejoin="round" stroke-width="2"></path>
				<line fill="none" stroke="currentColor" stroke-linecap="round"
					stroke-linejoin="round" stroke-width="2" x1="16.511" x2="22"
					y1="16.511" y2="22"></line></svg>
		</i>
		<input type="text" id="keyword" class="inline-form" placeholder="      검색">
	</div>
	
	<c:if test="${empty userName}">
	<div class="d-flex justify-content-end">
		<a href="/user/sign_in_view" id="loginLinkBtn" >로그인</a>
	</div>
	</c:if>
	<%-- session 정보가 있을 때 출력 --%>
	<c:if test="${not empty userName}">
	<div class="menu-icon d-flex justify-content-between">
		<div class="home">
			<a href="/timeline/timeline_list_view">
				<svg aria-label="홈" color="#262626" fill="#262626" height="24" role="img" viewBox="0 0 24 24" width="24">
					<path d="M22 23h-6.001a1 1 0 01-1-1v-5.455a2.997 2.997 0 10-5.993 0V22a1 1 0 01-1 1H2a1 1 0 01-1-1V11.543a1.002 1.002 0 01.31-.724l10-9.543a1.001 1.001 0 011.38 0l10 9.543a1.002 1.002 0 01.31.724V22a1 1 0 01-1 1z"></path>
				</svg>
			</a>	
		</div>
		<div class="direct">
			<a href="#">
				<svg aria-label="Direct" class="_8-yf5 " color="#262626" fill="#262626" height="24" role="img" viewBox="0 0 24 24" width="24"><line fill="none" stroke="currentColor" stroke-linejoin="round" stroke-width="2" x1="22" x2="9.218" y1="3" y2="10.083"></line><polygon fill="none" points="11.698 20.334 22 3.001 2 3.001 9.218 10.084 11.698 20.334" stroke="currentColor" stroke-linejoin="round" stroke-width="2"></polygon></svg>
			</a>
		</div>
		<div class="new-post">
			<a href="/post/create_post_view">
				<svg aria-label="새로운 게시물" class="_8-yf5 " color="#262626" fill="#262626" height="24" role="img" viewBox="0 0 24 24" width="24"><path d="M2 12v3.45c0 2.849.698 4.005 1.606 4.944.94.909 2.098 1.608 4.946 1.608h6.896c2.848 0 4.006-.7 4.946-1.608C21.302 19.455 22 18.3 22 15.45V8.552c0-2.849-.698-4.006-1.606-4.945C19.454 2.7 18.296 2 15.448 2H8.552c-2.848 0-4.006.699-4.946 1.607C2.698 4.547 2 5.703 2 8.552z" fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2"></path><line fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" x1="6.545" x2="17.455" y1="12.001" y2="12.001"></line><line fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" x1="12.003" x2="12.003" y1="6.545" y2="17.455"></line></svg>
			</a>
		</div>
		<div class="find-user">
			<a href="#">
				<svg aria-label="사람 찾기" class="_8-yf5 " color="#262626" fill="#262626" height="24" role="img" viewBox="0 0 24 24" width="24"><polygon fill="none" points="13.941 13.953 7.581 16.424 10.06 10.056 16.42 7.585 13.941 13.953" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2"></polygon><polygon fill-rule="evenodd" points="10.06 10.056 13.949 13.945 7.581 16.424 10.06 10.056"></polygon><circle cx="12.001" cy="12.005" fill="none" r="10.5" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2"></circle></svg>
			</a>
		</div>
		<div class="active-feed">
			<a href="#">
				<svg aria-label="활동 피드" class="_8-yf5 " color="#262626" fill="#262626" height="24" role="img" viewBox="0 0 24 24" width="24"><path d="M16.792 3.904A4.989 4.989 0 0121.5 9.122c0 3.072-2.652 4.959-5.197 7.222-2.512 2.243-3.865 3.469-4.303 3.752-.477-.309-2.143-1.823-4.303-3.752C5.141 14.072 2.5 12.167 2.5 9.122a4.989 4.989 0 014.708-5.218 4.21 4.21 0 013.675 1.941c.84 1.175.98 1.763 1.12 1.763s.278-.588 1.11-1.766a4.17 4.17 0 013.679-1.938m0-2a6.04 6.04 0 00-4.797 2.127 6.052 6.052 0 00-4.787-2.127A6.985 6.985 0 00.5 9.122c0 3.61 2.55 5.827 5.015 7.97.283.246.569.494.853.747l1.027.918a44.998 44.998 0 003.518 3.018 2 2 0 002.174 0 45.263 45.263 0 003.626-3.115l.922-.824c.293-.26.59-.519.885-.774 2.334-2.025 4.98-4.32 4.98-7.94a6.985 6.985 0 00-6.708-7.218z"></path></svg>
			</a>
		</div>
		<div class="user">
			<a href="#user-menu-area" id="menuBtn">
				<img src="" alt="${userLoginId}님의 프로필 사진">
			</a>
			<div id="user-menu-area" class="user-menu-area d-none">
				<ul class="user-menu">
					<li>
						<a href="/timeline/my_timeline_view"  class="d-flex align-items-center">
							<div class="icon-box">
								<svg aria-label="프로필" color="#262626" fill="#262626" height="16" role="img" viewBox="0 0 24 24" width="16"><circle cx="12.004" cy="12.004" fill="none" r="10.5" stroke="currentColor" stroke-linecap="round" stroke-miterlimit="10" stroke-width="2"></circle><path d="M18.793 20.014a6.08 6.08 0 00-1.778-2.447 3.991 3.991 0 00-2.386-.791H9.38a3.994 3.994 0 00-2.386.791 6.09 6.09 0 00-1.779 2.447" fill="none" stroke="currentColor" stroke-linecap="round" stroke-miterlimit="10" stroke-width="2"></path><circle cx="12.006" cy="9.718" fill="none" r="4.109" stroke="currentColor" stroke-linecap="round" stroke-miterlimit="10" stroke-width="2"></circle></svg>
							</div>
							<span class="ml-2">프로필</span>
						</a>
					</li>
					
					<li>
						<a href="" class="d-flex align-items-center">
							<div class="icon-box">
								<svg aria-label="설정" color="#262626" fill="#262626" height="16" role="img" viewBox="0 0 24 24" width="16"><circle cx="12" cy="12" fill="none" r="8.635" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2"></circle><path d="M14.232 3.656a1.269 1.269 0 01-.796-.66L12.93 2h-1.86l-.505.996a1.269 1.269 0 01-.796.66m-.001 16.688a1.269 1.269 0 01.796.66l.505.996h1.862l.505-.996a1.269 1.269 0 01.796-.66M3.656 9.768a1.269 1.269 0 01-.66.796L2 11.07v1.862l.996.505a1.269 1.269 0 01.66.796m16.688-.001a1.269 1.269 0 01.66-.796L22 12.93v-1.86l-.996-.505a1.269 1.269 0 01-.66-.796M7.678 4.522a1.269 1.269 0 01-1.03.096l-1.06-.348L4.27 5.587l.348 1.062a1.269 1.269 0 01-.096 1.03m11.8 11.799a1.269 1.269 0 011.03-.096l1.06.348 1.318-1.317-.348-1.062a1.269 1.269 0 01.096-1.03m-14.956.001a1.269 1.269 0 01.096 1.03l-.348 1.06 1.317 1.318 1.062-.348a1.269 1.269 0 011.03.096m11.799-11.8a1.269 1.269 0 01-.096-1.03l.348-1.06-1.317-1.318-1.062.348a1.269 1.269 0 01-1.03-.096" fill="none" stroke="currentColor" stroke-linejoin="round" stroke-width="2"></path></svg>	
							</div>
							<span class="ml-2">설정</span>
						</a>
					</li>
					<li>
						<a href="/user/sign_out" id="logoutBtn" class="d-flex">
							<span>로그아웃</span>
						</a>
					</li>
				</ul>
			</div>
		</div>
	</div>
	</c:if>
</div>

<script type="text/javascript" src="/js/gnb.js"></script>