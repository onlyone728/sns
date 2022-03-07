package com.sns.comment.bo;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sns.comment.dao.CommentDAO;
import com.sns.comment.model.Comment;
import com.sns.comment.model.CommentView;
import com.sns.user.bo.UserBO;
import com.sns.user.model.User;

@Service
public class CommentBO {

	@Autowired
	private CommentDAO commentDAO;
	
	@Autowired
	private UserBO userBO;
	
	public int addComment(int userId, String userLoginId,  int postId, String content) {
		return commentDAO.insertComment(userId, postId, content);
	}
	
	public List<Comment> getCommentListByPostId(int postId) {
		return commentDAO.selectCommentListByPostId(postId);
	}
	
	public List<CommentView> generateCommentViewListByPostId(int postId) {
		List<CommentView> resultList = new ArrayList<>();
 		List<Comment> commentList = getCommentListByPostId(postId);
		
		for(Comment comment : commentList) {
			CommentView commentView = new CommentView();
			
			// 댓글
			commentView.setComment(comment);
			
			// 댓글 작성자 정보
			User user = userBO.getUserById(comment.getUserId());
			commentView.setUser(user);
			
			resultList.add(commentView);
		}
		
		return resultList;
	}
	
	public void deleteCommentByPostId(int postId) {
		commentDAO.deleteCommentByPostId(postId);
	}
}
