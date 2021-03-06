package com.sns.post;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.sns.post.bo.PostBO;

@RestController
@RequestMapping("/post")
public class PostRestController {

	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	private PostBO postBO;
	
	// 글쓰기
	@PostMapping("/create")
	public Map<String, Object> postCreat(
			@RequestParam("content") String content,
			@RequestParam(value="file", required=false) MultipartFile file,
			HttpServletRequest request) {
		
		Map<String, Object> result = new HashMap<>();
		result.put("result", "success");
		
		// session 가져오기
		HttpSession session = request.getSession();
		int userId = (int) session.getAttribute("userId");
		String userLoginId = (String) session.getAttribute("userLoginId");
		
		// userId userLoginId content file -> BO insert 요청 
		postBO.addPost(userId, userLoginId, content, file);
		
		return result;
	}
	
	@DeleteMapping("/delete")
	public Map<String, Object> deletePost(
			@RequestParam("postId") int postId,
			HttpServletRequest request) {
		
		Map<String, Object> result = new HashMap<>();
		
		HttpSession session = request.getSession();
		Integer userId = (Integer) session.getAttribute("userId");
		if (userId == null) {
			result.put("result", "error");
			result.put("errorMessage", "로그인을 다시 해주세요.");
			logger.error("[delete post] 로그인 세션이 없습니다. userId : {}, postId : {}", userId, postId);
			return result;
		}
		
		postBO.deletePostByPostIdANdUserId(postId, userId);
		result.put("result", "success");
		
		return result;
	}
}
