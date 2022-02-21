package com.sns.user;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.sns.user.bo.UserBO;
import com.sns.user.model.User;

@RestController
@RequestMapping("/user")
public class UserRestController {

	@Autowired
	private UserBO userBO;
	
	// 아이디 중복 확인
	@RequestMapping("/is_duplicated_id")
	public Map<String, Boolean> isDuplicatedId(
			@RequestParam("loginId") String loginId) {
		// DB select
		User user = userBO.getUserById(loginId);
		
		// return boolean
		Map<String, Boolean> result = new HashMap<>();
		result.put("result", false);
		
		if (user != null) {
			result.put("result", true);
		}
		
		return result;
	}
	
	// 회원가입
	@PostMapping("/sign_up")
	public Map<String, String> signUp(
			@RequestParam("loginId") String loginId,
			@RequestParam("password") String password,
			@RequestParam("name") String name,
			@RequestParam("email") String email) {
		
		// DB insert
		int count = userBO.addUser(loginId, password, name, email);
		
		// return map
		Map<String, String> result = new HashMap<>();
		result.put("result", "success");
		if (count < 1) {
			result.put("result", "fail");
		}
		
		return result;
	}
}
