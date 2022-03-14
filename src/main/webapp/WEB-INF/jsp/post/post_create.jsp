<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="box-800 pt-5">
	<c:if test="${not empty userId}">
	<div id="post-input-area">
		<textarea id="post-input-content" class="form-control" rows="10" placeholder="내용을 입력하세요."></textarea>
		<div id="edit-options" class="d-flex justify-content-between align-items-center">
			<div class="d-flex justify-content-center align-items-center">
				<input type="file" id="file" class="d-none" accept=".jpg, .jpeg, .gif, .png">
				<a href="#" id="fileBtn" class="mr-2">
					<svg aria-label="이미지나 동영상과 같은 미디어를 나타내는 아이콘" color="#262626" fill="#262626" height="50" role="img" viewBox="0 0 97.6 77.3" width="96"><path d="M16.3 24h.3c2.8-.2 4.9-2.6 4.8-5.4-.2-2.8-2.6-4.9-5.4-4.8s-4.9 2.6-4.8 5.4c.1 2.7 2.4 4.8 5.1 4.8zm-2.4-7.2c.5-.6 1.3-1 2.1-1h.2c1.7 0 3.1 1.4 3.1 3.1 0 1.7-1.4 3.1-3.1 3.1-1.7 0-3.1-1.4-3.1-3.1 0-.8.3-1.5.8-2.1z" fill="currentColor"></path><path d="M84.7 18.4L58 16.9l-.2-3c-.3-5.7-5.2-10.1-11-9.8L12.9 6c-5.7.3-10.1 5.3-9.8 11L5 51v.8c.7 5.2 5.1 9.1 10.3 9.1h.6l21.7-1.2v.6c-.3 5.7 4 10.7 9.8 11l34 2h.6c5.5 0 10.1-4.3 10.4-9.8l2-34c.4-5.8-4-10.7-9.7-11.1zM7.2 10.8C8.7 9.1 10.8 8.1 13 8l34-1.9c4.6-.3 8.6 3.3 8.9 7.9l.2 2.8-5.3-.3c-5.7-.3-10.7 4-11 9.8l-.6 9.5-9.5 10.7c-.2.3-.6.4-1 .5-.4 0-.7-.1-1-.4l-7.8-7c-1.4-1.3-3.5-1.1-4.8.3L7 49 5.2 17c-.2-2.3.6-4.5 2-6.2zm8.7 48c-4.3.2-8.1-2.8-8.8-7.1l9.4-10.5c.2-.3.6-.4 1-.5.4 0 .7.1 1 .4l7.8 7c.7.6 1.6.9 2.5.9.9 0 1.7-.5 2.3-1.1l7.8-8.8-1.1 18.6-21.9 1.1zm76.5-29.5l-2 34c-.3 4.6-4.3 8.2-8.9 7.9l-34-2c-4.6-.3-8.2-4.3-7.9-8.9l2-34c.3-4.4 3.9-7.9 8.4-7.9h.5l34 2c4.7.3 8.2 4.3 7.9 8.9z" fill="currentColor"></path><path d="M78.2 41.6L61.3 30.5c-2.1-1.4-4.9-.8-6.2 1.3-.4.7-.7 1.4-.7 2.2l-1.2 20.1c-.1 2.5 1.7 4.6 4.2 4.8h.3c.7 0 1.4-.2 2-.5l18-9c2.2-1.1 3.1-3.8 2-6-.4-.7-.9-1.3-1.5-1.8zm-1.4 6l-18 9c-.4.2-.8.3-1.3.3-.4 0-.9-.2-1.2-.4-.7-.5-1.2-1.3-1.1-2.2l1.2-20.1c.1-.9.6-1.7 1.4-2.1.8-.4 1.7-.3 2.5.1L77 43.3c1.2.8 1.5 2.3.7 3.4-.2.4-.5.7-.9.9z" fill="currentColor"></path></svg>
				</a>
				<div id="fileName"></div>
			</div>
			<div class="buttons d-flex justify-content-center">
				<a href="/timeline/timeline_list_view" id="listBtn" class="btn btn-secondary mr-2">목록</a>
				<button type="button" id="saveBtn" class="btn btn-success">저장</button>
			</div>
		</div>
	</div>
	</c:if>
</div>

<script>
$(document).ready(function() {
	$('#fileBtn').on('click', function(e) {
		e.preventDefault();	// a 기본 기능 중단 (위로 올라가는 현상 방지)
		$('#file').click();	// input file을 클릭한 것과 같은 효과
	});
	
	// 사용자가 파일 업로드를 했을 때, 유효성 확인 및 업로드 된 파일 이름 노출
	$('#file').on('change', function(e) {
		let fileName = e.target.files[0].name;
		// alert(fileName);
		
		fileName = fileName.toLowerCase();
		let extension = fileName.split('.');
		
		// 확장자 유효성 확인
		if (extension.length < 2 || 
				(extension[extension.length - 1] != 'gif'
						&& extension[extension.length - 1] != 'jpg'
						&& extension[extension.length - 1] != 'jpeg'
						&& extension[extension.length - 1] != 'png')) {	
			alert("이미지 파일만 업로드 할 수 있습니다.");
			$(this).val('');	// 잘못된 파일 비워주기
			$('#fileName').text('');	// 파일 이름도 비워줌
			return;
		}
		$('#fileName').text(fileName);
	});
	
	// post save
	$('#saveBtn').on('click', function() {
		let content = $('#post-input-content').val();
		let file = $('#file').val();
		
		// validation -> 파일은 업로드시 함.
		if (content == '') {
			alert("내용을 입력해주세요.");
			return;
		}
		
		// 파일이 업로드 된 경우 확장자 체크
		if (file != '') {
			// 파일 경로를 .으로 나누고 - spilt
			// 확장자가 있는 마지막 문자열을 가져온 후 - pop 
			// 모두 소문자로 변경 - toLowerCase
			let ext = file.split('.').pop().toLowerCase();
			if ($.inArray(ext, ['jpg', 'gif', 'png', 'jpeg']) == -1) {
				alert("gif, jpg, jpeg, png 파일만 업로드 할 수 있습니다.");
				$('#file').val('');	// 선택된 파일을 비운다.
				return;
			}
		}
		
		// 폼태그 만들기
		let formData = new FormData();
		formData.append('content', content);
		formData.append('file', $('#file')[0].files[0]);
		
		// AJAX 통신
		$.ajax({
			type: "POST"
			, url: "/post/create"
			, data: formData
			, enctype: "multipart/form-data"
			, processData: false
			, contentType: false
			, success: function(data) {
				if (data.result == "success") {
					alert("저장되었습니다.");
					location.href = "/timeline/timeline_list_view";
				} else {
					alert(result.errorMessage);
					location.href = "/user/sign_in_view";
				}
			}
			, error: function(e) {
				alert("저장에 실패했습니다. 관리자에게 문의해 주세요.");
				$('#file').val('');
				$('#fileName').text('');
			}
		});
	});
});
</script>