package com.sns.post;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sns.post.bo.PostBO;
import com.sns.post.model.Post;

@Controller
public class PostRestController {

	@Autowired
	private PostBO postBO;
	
	@ResponseBody
	@RequestMapping("posts")
	public List<Post> posts() {
		List<Post> postList = postBO.getPostList();
		return postList;
	}
	
	@RequestMapping("/jsp_test")
	public String test() {
		return "test/test";
	}
}
