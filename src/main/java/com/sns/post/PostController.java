package com.sns.post;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/post")
public class PostController {
	
	@RequestMapping("/create_post_view")
	public String createPostView(Model model) {
		
		model.addAttribute("viewPath", "post/post_create");
		
		return "template/layout";
	}
}
