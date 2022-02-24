<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="box-800 timeline">
	<c:forEach var="post" items="${postList}">
	<div class="post-card">
		<div class="post-info d-flex justify-content-between align-items-center">
			<%-- 작성자 정보 --%>
			<div class="writer-info d-flex align-items-center">
				<div class="writer-img mr-2">
					<img src="https://cdn.pixabay.com/photo/2022/01/18/15/40/vietnam-6947337_1280.jpg" alt="프로필사진" width="32">
				</div>
				<div class="writer-Id">${post.userId}</div>
			</div>
			<div class="card-option pt-2 pr-2">
				<a href="modal:open" class="postMenuBtn" data-post-id="${post.id}">
					<svg aria-label="옵션 더 보기" color="#262626" fill="#262626" height="24" role="img" viewBox="0 0 24 24" width="24"><circle cx="12" cy="12" r="1.5"></circle><circle cx="6" cy="12" r="1.5"></circle><circle cx="18" cy="12" r="1.5"></circle></svg>
				</a>
			</div>
			<div class="modal">
			<ul id="postMenu">
				<li class="text-danger font-weight-bold"><a href="#">신고</a></li>
				<li class="text-danger font-weight-bold"><a href="#">팔로우 취소</a></li>
				<li><a href="#">게시물로 이동</a></li>
				<li><a href="#">공유대상</a></li>
				<li><a href="#">링크 복사</a></li>
				<li><a href="#">퍼가기</a></li>
				<li><a href="#" data-dismiss="modal">취소</a></li>
			</ul>
		</div>
		</div>
		
		<div class="post-img">
			<div class="img-center">
				<img src="${post.imagePath}" alt="포스트 이미지" height="598">
			</div>
		</div>
		
		<div class="post-content-area">
			<div class="content-box d-flex mb-2">
				<div class="post-writer-id font-weight-bold">${post.userId}</div>
				<div class="post-content ml-2">${post.content}</div>
			</div>
		</div>
		
		<%-- 포스트 옵션 영역 --%>
		<div class="post-option d-flex justify-content-between">
			<div class="d-flex">
				<div id="post-like-btn" class="mr-3">
					<a href="#">
						<svg aria-label="활동 피드" class="_8-yf5 " color="#262626" fill="#262626" height="24" role="img" viewBox="0 0 24 24" width="24"><path d="M16.792 3.904A4.989 4.989 0 0121.5 9.122c0 3.072-2.652 4.959-5.197 7.222-2.512 2.243-3.865 3.469-4.303 3.752-.477-.309-2.143-1.823-4.303-3.752C5.141 14.072 2.5 12.167 2.5 9.122a4.989 4.989 0 014.708-5.218 4.21 4.21 0 013.675 1.941c.84 1.175.98 1.763 1.12 1.763s.278-.588 1.11-1.766a4.17 4.17 0 013.679-1.938m0-2a6.04 6.04 0 00-4.797 2.127 6.052 6.052 0 00-4.787-2.127A6.985 6.985 0 00.5 9.122c0 3.61 2.55 5.827 5.015 7.97.283.246.569.494.853.747l1.027.918a44.998 44.998 0 003.518 3.018 2 2 0 002.174 0 45.263 45.263 0 003.626-3.115l.922-.824c.293-.26.59-.519.885-.774 2.334-2.025 4.98-4.32 4.98-7.94a6.985 6.985 0 00-6.708-7.218z"></path></svg>
					</a>
				</div>
				<div id="post-detail-btn" class="mr-3">
					<a href="#">
						<svg aria-label="댓글 달기" class="_8-yf5 " color="#262626" fill="#262626" height="24" role="img" viewBox="0 0 24 24" width="24"><path d="M20.656 17.008a9.993 9.993 0 10-3.59 3.615L22 22z" fill="none" stroke="currentColor" stroke-linejoin="round" stroke-width="2"></path></svg>
					</a>
				</div>
				<div id="post-msg-btn" class="mr-3">
					<a href="#">
						<svg aria-label="Direct" class="_8-yf5 " color="#262626" fill="#262626" height="24" role="img" viewBox="0 0 24 24" width="24"><line fill="none" stroke="currentColor" stroke-linejoin="round" stroke-width="2" x1="22" x2="9.218" y1="3" y2="10.083"></line><polygon fill="none" points="11.698 20.334 22 3.001 2 3.001 9.218 10.084 11.698 20.334" stroke="currentColor" stroke-linejoin="round" stroke-width="2"></polygon></svg>
					</a>
				</div>
			</div>
			
			<div id="save-btn">
				<a href="#">
					<svg aria-label="저장" class="_8-yf5 " color="#262626" fill="#262626" height="24" role="img" viewBox="0 0 24 24" width="24"><polygon fill="none" points="20 21 12 13.44 4 21 4 3 20 3 20 21" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2"></polygon></svg>
				</a>
			</div>
		</div>
		
		<%-- 좋아요 영영 --%>
		<div class="like-count ml-3"><b>좋아요 100개</b></div>
		<%-- 댓글 영역 --%>
		<div class="comment-area">
			<div class="comment-box d-flex mb-2">
				<div class="comment-writer-id font-weight-bold">댓글쓰니</div>
				<div class="writed-comment ml-2">댓글 내용</div>
			</div>
			<div class="comment-box d-flex mb-2">
				<div class="comment-writer-id font-weight-bold">댓글쓰니22</div>
				<div class="writed-comment ml-2">댓글 내용</div>
			</div>
		</div>
		
		<%-- 댓글 작성 --%>
		<div class="comment-input-area d-flex justify-content-between align-content-center pt-3">
			<div>
				<a href="#" class="emoji-btn">
					<svg aria-label="이모티콘" color="#262626" fill="#262626" height="24" role="img" viewBox="0 0 24 24" width="24"><path d="M15.83 10.997a1.167 1.167 0 101.167 1.167 1.167 1.167 0 00-1.167-1.167zm-6.5 1.167a1.167 1.167 0 10-1.166 1.167 1.167 1.167 0 001.166-1.167zm5.163 3.24a3.406 3.406 0 01-4.982.007 1 1 0 10-1.557 1.256 5.397 5.397 0 008.09 0 1 1 0 00-1.55-1.263zM12 .503a11.5 11.5 0 1011.5 11.5A11.513 11.513 0 0012 .503zm0 21a9.5 9.5 0 119.5-9.5 9.51 9.51 0 01-9.5 9.5z"></path></svg>
				</a>
			</div>
			<input type="text" id="comment" placeholder="댓글 달기...">
			<div class="post-btn">
				<a href="#">게시</a>
			</div>
		</div>
		
	</div>
	</c:forEach>
	
	

</div>

<script type="text/javascript" src="/js/timeline.js"></script>
