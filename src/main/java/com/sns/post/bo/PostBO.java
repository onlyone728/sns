package com.sns.post.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.sns.common.FileManagerService;
import com.sns.post.dao.PostDAO;
import com.sns.post.model.Post;

@Service
public class PostBO {

	@Autowired
	private PostDAO postDAO;
	
	@Autowired
	private FileManagerService fms;
	
	public List<Post> getPostList() {
		return postDAO.selectPostList();
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
}
