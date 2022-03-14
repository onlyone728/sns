package com.sns.timeline.bo;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestParam;

import com.sns.comment.bo.CommentBO;
import com.sns.comment.model.CommentView;
import com.sns.like.bo.LikeBO;
import com.sns.post.bo.PostBO;
import com.sns.post.model.Post;
import com.sns.timeline.model.ContentView;
import com.sns.user.bo.UserBO;
import com.sns.user.model.User;

@Service
public class ContentBO {

	@Autowired
	private PostBO postBO;
	
	@Autowired
	private CommentBO commentBO;
	
	@Autowired
	private LikeBO likeBO;
	
	@Autowired
	private UserBO userBO;
	
	// 로그인되지 않아도 타임라인은 볼 수 있으므로 userId는 Integer 
	public List<ContentView> generateContentViewList(
			@RequestParam(value="userId", required=false) Integer userId,
			@RequestParam("uri") String uri) {
		// contentView객체를 각각 저장할 리스트
		List<ContentView> contentViewList = new ArrayList<>();	
		List<Post> postList = new ArrayList<>();
		
		// 글 List 가져온다. => 반복문 돌림
		if (userId != null && uri.startsWith("/timeline/my")) {
			postList = postBO.getPostListByUserId(userId);
		} else {
			postList = postBO.getPostList();
		}
		
		// contentView에 내용 저장
		for (Post post : postList) {
			ContentView contentView = new ContentView();
			contentView.setPost(post);
			
			int postId = post.getId();
			
			// 글쓴이 정보
			User user = userBO.getUserById(post.getUserId());
			contentView.setUser(user);
			
			// 코멘트를 contentView에 저장 -> post의 postId가 맞으면 post에 넣어준다.
			//List<Comment> commentList = commentBO.getCommentListByPostId(postId);
			List<CommentView> commentList = commentBO.generateCommentViewListByPostId(postId);
			contentView.setCommentList(commentList);
			
			// 좋아요 개수 세팅
			int likeCount = likeBO.getLikeListCountByPostId(postId);
			contentView.setLikeCount(likeCount);
			
			// 로그인 된 사용자의 좋아요 여부 세팅
			boolean islike = likeBO.existLike(postId, userId);
			contentView.setFilledLike(islike);
			
			contentViewList.add(contentView);
		}
		
		return contentViewList;
	}
	
}
