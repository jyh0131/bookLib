package com.yi.dao;

import java.util.List;

import com.yi.model.Recommendation;

public interface RecommendationDao {
	Recommendation selectRecommendationByLastNo();
	Recommendation selectRecommendationByBookCode(Recommendation recommend);
	List<Recommendation> selectRecommendationByAll();

	int insertRecommendation(Recommendation recommend);
	int updateRecommendation(Recommendation recommend);
	int deleteRecommendation(Recommendation recommend);

}
