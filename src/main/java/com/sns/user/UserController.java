package com.sns.user;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/user")
public class UserController {

	@RequestMapping("/sign_up_view")
	public String signUpView(Model model) {
		
		model.addAttribute("viewName", "/user/sign-up");
		
		return "template/user-layout";
	}
}
