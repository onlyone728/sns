<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>    
    
<div class="box-800">
	<header class="d-flex myPageHeader">
		<div class="col-3 m-auto">
			<div class="profileImg">
				<img src="" alt="프로필 이미지">
			</div>
		</div>
		<div class="col-9">
			<div class="fs-30">${userLoginId}</div>
			<div class="d-flex my-3">
				<div>게시물 <b>${fn:length(contentList)}</b></div>
				<div class="mx-3">팔로워 <b>0</b></div>
				<div>팔로우 <b>0</b></div>
			</div>
			<div>
				<div><b>${userName}</b></div>
				<div>설명</div>
			</div>
		</div>
	</header>
	<section id="myContentArea">
		<c:forEach var="content" items="${contentList}">
			<div class="thumbnail">
				<div class="thumbnailImg">
					<a href="#"> 
						<div class="img-center">
							<img src="${content.post.imagePath}" alt=""	height="250">
						</div>
						<c:if test="${empty content.post.imagePath}">
							<div class="h-100 d-flex justify-content-center align-items-center">No Image</div>
						</c:if>
					</a>
				</div>
			</div>
		</c:forEach>	
	</section>
</div>