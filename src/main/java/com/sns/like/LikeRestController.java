package com.sns.like;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.sns.like.bo.LikeBO;

@RestController
public class LikeRestController {
	
	@Autowired
	private LikeBO likeBO;
	
	// /like/{postId}
	@RequestMapping("/like/{postId}")
	public Map<String, Object> like(
			@PathVariable int postId,
			HttpServletRequest request,
			Model model) {
		// session에서 userId 가져오기
		HttpSession session = request.getSession();
		Integer userId = (Integer) session.getAttribute("userId");
		
		// return 값 만들기
		boolean status = true;
		Map<String, Object> result = new HashMap<>();
		result.put("result", "success");
		result.put("status", status);
		
		if (userId == null) {
			// 로그인 되어있지 않음
			result.put("result", "error");
			result.put("errorMessage", "로그인 후 사용 가능합니다.");
			return result;
		}
		
		// insert BO
		int count = likeBO.addLike(userId, postId);
		if (count < 1) {
			result.put("result", "fail");
			result.put("errorMessage", "관리자에게 문의하세요.");
			result.put("status", status);
		}
		
		// return json
		return result;
	}
	
	
//	@RequestMapping("/like")
//	public Map<String, Object> addLike(
//			@RequestParam("postId") int postId,
//			HttpServletRequest request,
//			Model model) {
//		
//		// session에서 userId 가져오기
//		HttpSession session = request.getSession();
//		Integer userId = (Integer) session.getAttribute("userId");
//		String userLoginId = (String) session.getAttribute("userLoginId");
//		
//		// return 값 만들기
//		Map<String, Object> result = new HashMap<>();
//		result.put("result", "success");
//		
//		if (userId == null) {
//			// 로그인 되어있지 않음
//			result.put("result", "error");
//			result.put("errorMessage", "로그인 후 사용 가능합니다.");
//			return result;
//		}
//		
//		// insert BO
//		int count = likeBO.addLike(userId, userLoginId, postId);
//		if (count < 1) {
//			result.put("result", "fail");
//		}
//		
//		// return json
//		return result;
//	}
}
