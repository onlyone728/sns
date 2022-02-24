package com.sns.timeline;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sns.post.bo.PostBO;
import com.sns.post.model.Post;
import com.sns.user.bo.UserBO;
import com.sns.user.model.User;

@Controller
@RequestMapping("/timeline")
public class TimelineController {

	@Autowired
	private PostBO postBO;
	
	@Autowired
	private UserBO userBO;
	
	@RequestMapping("/timeline_list_view")
	public String timelineListView(Model model) {
		
		// post 내용
		List<Post> postList = postBO.getPostList();
		List<User> userList = userBO.getUserList();
		
		model.addAttribute("postList", postList);
		model.addAttribute("userList", userList);
		model.addAttribute("viewPath", "timeline/timeline");
		return "template/layout";
	}
}
