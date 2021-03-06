$(document).ready(function() {
	// 페이징
	


	// 댓글입력 게시 버튼 활성화
	$('.comment').on("propertychange change keyup paste input", function() {
		let newValue = $(this).val();
		if (newValue.length > 0) {
			$(this).next('.commentBtn').removeClass('disabledBtn');
		} else {
			$(this).next('.commentBtn').addClass('disabledBtn');
		}
	});

	// 포스트 옵션 모달 메뉴
	/*$('.postMenuBtn').on('click', function(e) {
		e.preventDefault();
		$('#postMenu').modal();
		let contentUserId = $(this).data('user-id');
		let userId = sessionStorage.getItem('userId');

		console.log(contentUserId);
		console.log(userId);
		
		if (contentUserId === userId) {
			$('.authorized').css('display', 'block');
			$('.nonAuthorized').css('display', 'none');
		} else {
			$('.authorized').css('display', 'none');
			$('.nonAuthorized').css('display', 'block');
		}
	});*/

	// 댓글 쓰기 - 게시 버튼 클릭
	$('.commentBtn').on('click', function(e) {
		e.preventDefault();
		let postId = $(this).data('post-id'); // data-post-id

		let commentContent = $('#commentText' + postId).val();

		$.ajax({
			type: "POST"
			, url: "/comment/create"
			, data: { "postId": postId, "content": commentContent }
			, success: function(data) {
				if (data.result == "success") {
					location.reload();
				} else {
					alert(data.errorMessage);
				}
			}
			, error: function() {
				alert("등록에 실패하였습니다. 관리자에게 문의해주세요.");
			}
		});
	});

	// 좋아요 추가 및 삭제
	/*$('.post-like-btn').on('click', function(e) {
		e.preventDefault();
		let postId = $(this).data('post-id');

		$.ajax({
			type: "GET"
			, url: "/like/" + postId
			, data: { "postId": postId }
			, success: function(data) {
				if (data.result == "success") {
					location.reload();
				} else {
					alert(data.errorMessage);
				}
			}
			, error: function(e) {
				alert("실패하였습니다. 관리자에게 문의하세요.");
			}
		});
	});*/

	
	// 좋아요/해제 - 하트 버튼 클릭
	$('.post-like-btn').on('click', function(e) {
		e.preventDefault(); // a 태그 동작 중단
		
		let postId = $(this).data('post-id');
		//alert(postId);
		
		$.ajax({
			url: "/like/" + postId
			,success: function(data) {
				if (data.result == "success") {
					location.reload();
				} else {
					alert(result.errorMessage);
				}
			}
			,error: function(e) {
				alert("좋아요가 실패했습니다. 관리자에게 문의해주세요.");
			}
		});
	});
	

	// 카드메뉴에서 삭제 버튼 클릭시 삭제될 글 번호를 넣어준다.
	$('.moreBtn').on('click', function(e) {
		e.preventDefault();
		let postId = $(this).data('post-id');
		//console.log(postId);
		$('#deleteModal').data('post-id', postId);
	});

	// 모달창 안에 있는 삭제하기 버튼 클릭
	$('#deleteModal .del-post').on('click', function(e) {
		e.preventDefault();
		let postId = $('.postMenuBtn').data('post-id');
		alert(postId);

		// 삭제 AJAX
		$.ajax({
			type: "DELETE"
			, url: "/post/delete"
			, data: {"postId": postId}
			, success: function(data) {
				if (data.result == "success") {
					alert("삭제되었습니다.");
					location.reload();
				} else {
					alert(data.errorMessage);
					location.reload();
				}
			}
			, error: function(e) {
				alert("삭제에 실패하였습니다. 관리자에게 문의하세요.");
				location.reload();
			}
		});
	});

});