package com.sns.like.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.sns.like.model.Like;

@Repository
public interface LikeDAO {

	public int insertLike(
			@Param("postId") int postId,
			@Param("userId") int userId);
	
	public List<Like> selectLikeListByPostId(int postId);
	
	public int selectLikeListCountByPostIdOrUserId(
			@Param("postId") int postId,
			@Param("userId") Integer userId);
	
	public void deleteLikeByPostIdAndUserId(
			@Param("postId") int postId,
			@Param("userId") int userId);
	
	public void deleteLikeByPostId(int postId);
}
