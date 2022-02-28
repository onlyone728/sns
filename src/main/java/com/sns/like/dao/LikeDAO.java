package com.sns.like.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.sns.like.model.Like;

@Repository
public interface LikeDAO {

	public int insertLike(
			@Param("userId") int userId,
			@Param("postId") int postId);
	
	public List<Like> selectLikeListByPostId(int postId);
}
