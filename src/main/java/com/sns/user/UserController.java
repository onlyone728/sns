package com.sns.user;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/user")
public class UserController {
	
	/**
	 * 로그인 화면
	 * @param model
	 * @return
	 */
	@RequestMapping("/sign_up_view")
	public String signUpView(Model model) {
		
		model.addAttribute("viewPath", "/user/sign-up");
		
		return "template/user-layout";
	}
	
	/**
	 * 회원가입 화면
	 * @param model
	 * @return
	 */
	@RequestMapping("/sign_in_view")
	public String signInView(Model model) {
		model.addAttribute("viewPath", "/user/sign-in");
		
		return "template/user-layout";
	}
	
	@RequestMapping("/sign_out")
	public String signOut(HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.removeAttribute("userId");
		session.removeAttribute("userLoginId");
		session.removeAttribute("userName");
		
		return "redirect:/user/sign_in_view";
	}
}
