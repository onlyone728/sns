<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<div class="box-800 timeline">
	<c:forEach var="content" items="${contentList}" varStatus="status">
		<div class="post-card">
			<div
				class="post-info d-flex justify-content-between align-items-center">
				<%-- 작성자 정보 --%>
				<div class="writer-info d-flex align-items-center">
					<div class="writer-img mr-2">
						<img src="https://cdn.pixabay.com/photo/2022/01/18/15/40/vietnam-6947337_1280.jpg"
							alt="프로필사진" width="32">
					</div>
					<div class="writer-Id">${content.user.loginId}</div>
				</div>
				<c:if test="${userName eq content.user.name}">
				<div class="card-option pt-2 pr-2">
					<a href="#" class="postMenuBtn" data-toggle="modal" data-target="#deleteModal" class="moreBtn" data-post-id="${content.post.id}"> 
						<svg aria-label="옵션 더 보기" color="#262626" fill="#262626" height="24" role="img" viewBox="0 0 24 24" width="24">
							<circle cx="12" cy="12" r="1.5"></circle><circle cx="6" cy="12" r="1.5"></circle><circle cx="18" cy="12" r="1.5"></circle></svg>
					</a>
				</div>
				</c:if>


			</div>

			<div class="post-img">
				<c:if test="${not empty content.post.imagePath}">
					<div class="img-center">
						<a href="#" id="detailBtn" data-toggle="modal"
							data-target="#detailView" data-post-id="${content.post.id}"
							data-user-id="${content.post.userId}"> <img
							src="${content.post.imagePath}" alt="포스트 이미지" height="598">
						</a>
					</div>
				</c:if>
				<div class="h-100 d-flex align-items-center justify-content-center">No Image</div>
			</div>

			<div class="post-content-area">
				<div class="content-box d-flex mb-2">
					<div class="post-writer-id font-weight-bold">${content.user.loginId}</div>
					<div class="post-content ml-2">${content.post.content}</div>
				</div>
			</div>

			<%-- 포스트 옵션 영역 --%>
			<div class="post-option d-flex justify-content-between">
				<div class="d-flex">
					<div class="mr-3">
						<c:choose>
							<c:when test="${content.filledLike == false}">
								<a href="/like/${content.post.id}" class="post-like-btn" data-post-id="${content.post.id}"> 
									<svg aria-label="활동 피드" color="#262626" fill="#262626" height="24" role="img" viewBox="0 0 24 24" width="24">
										<path d="M16.792 3.904A4.989 4.989 0 0121.5 9.122c0 3.072-2.652 4.959-5.197 7.222-2.512 2.243-3.865 3.469-4.303 3.752-.477-.309-2.143-1.823-4.303-3.752C5.141 14.072 2.5 12.167 2.5 9.122a4.989 4.989 0 014.708-5.218 4.21 4.21 0 013.675 1.941c.84 1.175.98 1.763 1.12 1.763s.278-.588 1.11-1.766a4.17 4.17 0 013.679-1.938m0-2a6.04 6.04 0 00-4.797 2.127 6.052 6.052 0 00-4.787-2.127A6.985 6.985 0 00.5 9.122c0 3.61 2.55 5.827 5.015 7.97.283.246.569.494.853.747l1.027.918a44.998 44.998 0 003.518 3.018 2 2 0 002.174 0 45.263 45.263 0 003.626-3.115l.922-.824c.293-.26.59-.519.885-.774 2.334-2.025 4.98-4.32 4.98-7.94a6.985 6.985 0 00-6.708-7.218z"></path></svg>
								</a>
							</c:when>
							<c:when test="${content.filledLike == true}">
								<a href="#" class="post-like-btn" data-post-id="${content.post.id}">
									<svg aria-label="좋아요 취소" class="_8-yf5 " color="#ed4956" fill="#ed4956" height="24" role="img" viewBox="0 0 48 48" width="24">
										<path d="M34.6 3.1c-4.5 0-7.9 1.8-10.6 5.6-2.7-3.7-6.1-5.5-10.6-5.5C6 3.1 0 9.6 0 17.6c0 7.3 5.4 12 10.6 16.5.6.5 1.3 1.1 1.9 1.7l2.3 2c4.4 3.9 6.6 5.9 7.6 6.5.5.3 1.1.5 1.6.5s1.1-.2 1.6-.5c1-.6 2.8-2.2 7.8-6.8l2-1.8c.7-.6 1.3-1.2 2-1.7C42.7 29.6 48 25 48 17.6c0-8-6-14.5-13.4-14.5z"></path></svg>
								</a>
							</c:when>
						</c:choose>
					</div>
					<div id="post-detail-btn" class="mr-3">
						<a href="#"> 
							<svg aria-label="댓글 달기" color="#262626" fill="#262626" height="24" role="img" viewBox="0 0 24 24" width="24">
								<path d="M20.656 17.008a9.993 9.993 0 10-3.59 3.615L22 22z" fill="none" stroke="currentColor" stroke-linejoin="round" stroke-width="2"></path></svg>
						</a>
					</div>
					<div id="post-msg-btn" class="mr-3">
						<a href="#"> 
							<svg aria-label="Direct" color="#262626" fill="#262626" height="24" role="img" viewBox="0 0 24 24" width="24">
								<line fill="none" stroke="currentColor" stroke-linejoin="round" stroke-width="2" x1="22" x2="9.218" y1="3" y2="10.083"></line>
								<polygon fill="none" points="11.698 20.334 22 3.001 2 3.001 9.218 10.084 11.698 20.334" stroke="currentColor" stroke-linejoin="round" stroke-width="2"></polygon></svg>
						</a>
					</div>
				</div>

				<div id="save-btn">
					<a href="#"> 
						<svg aria-label="저장" color="#262626" fill="#262626" height="24" role="img" viewBox="0 0 24 24" width="24">
							<polygon fill="none" points="20 21 12 13.44 4 21 4 3 20 3 20 21" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2"></polygon></svg>
					</a>
				</div>
			</div>

			<%-- 좋아요 영영 --%>
			<%-- <div class="like-count ml-3 mb-2"><b>좋아요 ${fn:length(content.likeList)}개</b></div> --%>
			<div class="like-count ml-3 mb-2">
				<b>좋아요 ${content.likeCount}개</b>
			</div>

			<%-- 댓글 영역 --%>
			<c:if test="${not empty content.commentList}">
				<div class="comment-area">
					<c:forEach var="commentView" items="${content.commentList}">
						<div class="comment-box d-flex mb-2">
							<div class="comment-writer-id font-weight-bold">${commentView.user.loginId}</div>
							<div class="writed-comment ml-2">${commentView.comment.content}</div>
						</div>
					</c:forEach>
				</div>
			</c:if>

			<%-- 댓글 작성 : 로그인된 사용자만 --%>
			<c:if test="${not empty userId}">
				<div
					class="comment-input-area d-flex justify-content-between align-content-center pt-3">
					<div>
						<a href="#" class="emoji-btn"> 
							<svg aria-label="이모티콘" color="#262626" fill="#262626" height="24" role="img" viewBox="0 0 24 24" width="24">
								<path d="M15.83 10.997a1.167 1.167 0 101.167 1.167 1.167 1.167 0 00-1.167-1.167zm-6.5 1.167a1.167 1.167 0 10-1.166 1.167 1.167 1.167 0 001.166-1.167zm5.163 3.24a3.406 3.406 0 01-4.982.007 1 1 0 10-1.557 1.256 5.397 5.397 0 008.09 0 1 1 0 00-1.55-1.263zM12 .503a11.5 11.5 0 1011.5 11.5A11.513 11.513 0 0012 .503zm0 21a9.5 9.5 0 119.5-9.5 9.51 9.51 0 01-9.5 9.5z"></path></svg>
						</a>
					</div>
					<input type="text" id="commentText${content.post.id}" class="comment" placeholder="댓글 달기..."> 
						<a href="/comment/create" class="commentBtn disabledBtn" data-post-id="${content.post.id}">게시</a>
				</div>
			</c:if>

		</div>
	</c:forEach>
</div>

<%-- postMenu Modal --%>
<div class="modal" id="postMenu">
	<ul>
		<%-- 글쓴 사용자와 로그인 사용자가 일치할때만 삭제 가능 --%>
		<li class="authorized text-danger font-weight-bold">
			<a href="#" data-toggle="modal" data-target="#deleteModal" class="moreBtn" data-post-id="${content.post.id}">삭제</a></li>
		<li class="nonAuthorized text-danger font-weight-bold">
			<a href="#">신고</a>
		</li>
		<li class="nonAuthorized text-danger font-weight-bold">
			<a href="#">팔로우 취소</a>
		</li>
		<li class="nonAuthorized"><a href="#">퍼가기</a></li>
		<li><a href="#">게시물로 이동</a></li>
		<li><a href="#">공유대상</a></li>
		<li><a href="#">링크 복사</a></li>
		<li><a href="#" data-dismiss="modal">취소</a></li>
	</ul>
</div>

<%-- Delete Modal --%>
<div class="modal" id="deleteModal">
	<div class="modal-dialog modal-sm modal-dialog-centered" role="document">
		<div class="modal-content">
			<%-- modal 창 안에 내용 넣기 --%>
			<div>
				<div class="my-3 text-center">
					<a href="#" class="del-post d-block text-danger">삭제하기</a>
				</div>
				<div class="border-top py-3 text-center">
					<%-- data-dismiss : 모달 창 닫힘 --%>
					<a href="#" class="cancel d-block" data-dismiss="modal">취소</a>
				</div>
			</div>
		</div>
	</div>
</div>

<div class="modal fade" id="detailView">
	<div class="modal-dialog modal-dialog-centered" role="document">
		<div class="modal-content">
			<%-- modal 창 안에 내용 넣기 --%>
			<div class="d-flex">
				<div id="detailImageBox">
					<img alt="" src="">
				</div>
				<div id="detailContent">
					<%-- 작성자 정보 --%>
					<div></div>
					<%-- 글 내용 --%>
					<div></div>
					<%-- 댓글 --%>
					<div></div>
				</div>
			</div>
		</div>
	</div>
</div>

<script type="text/javascript" src="/js/timeline.js"></script>
<script type="text/javascript" src="/js/infiniteScroll.js"></script>
