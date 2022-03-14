package com.sns.interceptor;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;

@Component
public class PermissionInterceptor implements HandlerInterceptor {
	
	private Logger logger = LoggerFactory.getLogger(PermissionInterceptor.class);
	
	@Override
	public boolean preHandle(HttpServletRequest request, 
			HttpServletResponse response, Object handler) throws IOException {
		
		HttpSession session = request.getSession();
		Integer userId = (Integer) session.getAttribute("userId");
		String uri = request.getRequestURI();
		
		if (userId != null && uri.startsWith("/user")) {
			response.sendRedirect("/timeline/timeline_list_view");
			return false;
		} else if (userId == null && (uri.startsWith("/post") || uri.startsWith("/timeline/my"))) {
			response.sendRedirect("/user/sign_in_view");
			return false;
		}
		
		logger.warn("######## preHandle 호출, uri : {}", uri);
		return true;
	}
}
