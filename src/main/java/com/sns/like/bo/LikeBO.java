package com.sns.like.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sns.like.dao.LikeDAO;
import com.sns.like.model.Like;

@Service
public class LikeBO {

	@Autowired
	private LikeDAO likeDAO;
	
	public int addLike(int userId, int postId) {
		return likeDAO.insertLike(userId, postId);
	}
	
	public List<Like> getLikeListByPostId(int postId) {
		return likeDAO.selectLikeListByPostId(postId);
	}
	
	public int getLikeListCountByPostId(int postId) {
		return likeDAO.selectLikeListCountByPostIdOrUserId(postId, null);
	}
	
	public boolean isLikeByPostIdAndUserId(int postId, Integer userId) {
		if (userId == null) {
			return false;
		} 
		int count = likeDAO.selectLikeListCountByPostIdOrUserId(postId, userId);
		if (count > 0) {
			return true;
		} else {
			return false;
		}
	}
	
	public void deleteLikeByPostId(int postId) {
		likeDAO.deleteLikeByPostId(postId);
	}
}
