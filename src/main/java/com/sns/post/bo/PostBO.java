package com.sns.post.bo;

import java.io.IOException;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.sns.comment.bo.CommentBO;
import com.sns.common.FileManagerService;
import com.sns.like.bo.LikeBO;
import com.sns.post.dao.PostDAO;
import com.sns.post.model.Post;

@Service
public class PostBO {

	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	private PostDAO postDAO;
	
	@Autowired
	private CommentBO commentBO;
	
	@Autowired
	private LikeBO likeBO;
	
	@Autowired
	private FileManagerService fms;
	
	public List<Post> getPostList() {
		return postDAO.selectPostList();
	}
	
	public List<Post> getPostListByUserId(int userId) {
		return postDAO.selectPostListByUserId(userId);
	}
	
	public Post getPostById(int id) {
		return postDAO.selectPostById(id);
	}
	
	// userId userLoginId content file
	public void addPost(int userId, String userLoginId, String content, MultipartFile file) {
		String imagePath = null;
		
		if (file != null) {
			// TODO: 파일매니저 서비스 	input:MultipartFile		output:이미지의 주소
			imagePath = fms.saveFile(userLoginId, file);
		}
		
		// insert DAO
		postDAO.insertPost(userId, content, imagePath);
	}
	
	public void deletePostByPostIdANdUserId(int postId, int userId) {
		// postId로 select post
		Post post = getPostById(postId);
		if (post == null) {
			logger.error("[delete post] 삭제할 포스트가 존재하지 않습니다. postId : {}", postId);
		}
		
		// imagePath가 있으면 디렉토리 삭제
		if (post.getImagePath() != null) {
			try {
				fms.deleteFile(post.getImagePath());
			} catch (IOException e) {
				logger.error("[delete post] 이미지 삭제 실패 postId : {}, imagePath : {}", post.getId(), post.getImagePath());
			}
		}
		
		// 글 삭제
		postDAO.deletePostByPostIdANdUserId(postId, userId);
		
		// 댓글 삭제 by postId
		commentBO.deleteCommentByPostId(postId);
		
		// 좋아요 삭제 by postId
		likeBO.deleteLikeByPostId(postId);
	}
}
