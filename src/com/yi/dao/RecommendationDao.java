package com.yi.dao;

import com.yi.model.Recommendation;

public interface RecommendationDao {
	Recommendation selectRecommendationByLastNo();
	Recommendation selectRecommendationByBookCode(Recommendation recommend);

	int insertRecommendation(Recommendation recommend);
	int updateRecommendation(Recommendation recommend);
	int deleteRecommendation(Recommendation recommend);

}
