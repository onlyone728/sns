package com.sns.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import com.sns.interceptor.PermissionInterceptor;

@Configuration
public class WebMvcConfig implements WebMvcConfigurer {

	@Autowired
	private PermissionInterceptor interceptor;
	
	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		registry
		.addResourceHandler("/images/**")
		.addResourceLocations("file:/Users/janghana/Desktop/java/megait/6_spring-project/sns/workspace/images/");
	}
	
	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		registry.addInterceptor(interceptor)
		.addPathPatterns("/**")
		.excludePathPatterns("/css/**", "/js/**", "/images/**", "/error", "/user/sign_out");
	}
}
