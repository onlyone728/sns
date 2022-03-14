package com.sns.like;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.sns.like.bo.LikeBO;


@RestController
public class LikeRestController {
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
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
		Map<String, Object> result = new HashMap<>();
		
		if (userId == null) {
			result.put("result", "error");
			result.put("errorMessage", "로그인 후 사용 가능합니다.");
			logger.error("[좋아요] 로그인 세션이 없습니다.");
			return result;
		}
		
		likeBO.like(postId, userId);
		result.put("result", "success");
		return result;
	}
	
}
