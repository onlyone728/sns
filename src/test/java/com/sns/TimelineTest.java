package com.sns;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.transaction.annotation.Transactional;

import com.sns.like.bo.LikeBO;
import com.sns.timeline.bo.ContentBO;

@SpringBootTest
public class TimelineTest {
	
	@Autowired
	ContentBO contentBO;
	
	@Autowired
	LikeBO likeBO;
	
//	@Test
//	void test1() {
//		assertEquals(3 * 5, 15);
//		
//		int a = 10;
//		assertTrue(a < 100);
//	}
	
//	@Test
//	void test2() {
//		List<ContentView> contentList = contentBO.generateContentViewList(null, null);
//		assertNotNull(contentList);
//	}
	
	@Transactional
	@Test
	void test3() {
		likeBO.like(4, 2);
	}
}
