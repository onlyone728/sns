package com.sns.timeline;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sns.timeline.bo.ContentBO;
import com.sns.timeline.model.ContentView;

@Controller
@RequestMapping("/timeline")
public class TimelineController {
	
	@Autowired
	private ContentBO contentBO;
	
	/**
	 * 타임라인 화면
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping("/timeline_list_view")
	public String timelineListView(
			HttpServletRequest request,
			Model model) {
		
		HttpSession session = request.getSession();
		Integer userId = (Integer) session.getAttribute("userId");
		String uri = request.getRequestURI();
		
		// 하나의 카드 => ContentView 객체 (view용 객체)
		List<ContentView> contentList = new ArrayList<>();
		contentList = contentBO.generateContentViewList(userId, uri);
		
		// post 내용
		// List<Post> postList = postBO.getPostList();
		
//		model.addAttribute("postList", postList);
		model.addAttribute("contentList", contentList);
		model.addAttribute("viewPath", "timeline/timeline");
		return "template/layout";
	}
	
	@RequestMapping("/my_timeline_view")
	public String myTimelineView(
			Model model,
			HttpServletRequest request) {
		// userId 가져오기
		HttpSession session = request.getSession();
		int userId = (int) session.getAttribute("userId");
		String uri = request.getRequestURI();
		
		// DB 가져오기
		List<ContentView> contentViewList = contentBO.generateContentViewList(userId, uri);
		model.addAttribute("contentList", contentViewList);
		model.addAttribute("viewPath", "timeline/my-timeline");
		
		return "template/layout";
	}
}
