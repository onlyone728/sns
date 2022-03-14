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
	
	public void like(int userId, int postId) {
		boolean existLike = existLike(postId, userId);
		if (existLike) {
			likeDAO.deleteLikeByPostIdAndUserId(postId, userId);
		} else {
			likeDAO.insertLike(postId, userId);
		}
	}
	
	public List<Like> getLikeListByPostId(int postId) {
		return likeDAO.selectLikeListByPostId(postId);
	}
	
	public int getLikeListCountByPostId(int postId) {
		return likeDAO.selectLikeListCountByPostIdOrUserId(postId, null);
	}
	
	public boolean existLike(int postId, Integer userId) {
		if (userId == null) {
			return false;
		} 
		int count = likeDAO.selectLikeListCountByPostIdOrUserId(postId, userId);
		return count > 0 ? true : false;
	}
	
	public void deleteLikeByPostId(int postId) {
		likeDAO.deleteLikeByPostId(postId);
	}
}
