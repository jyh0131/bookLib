package com.yi.dao;

import java.util.List;

import com.yi.model.LargeClassification;

public interface LargeClassificationDao {
	LargeClassification selectLargeClassificationByNo(LargeClassification lclas);

	List<LargeClassification> selectLargeClassificationByAll();

	int insertLargeClassification(LargeClassification lclas);

	int updateLargeClassification(LargeClassification lclas);

	int deleteLargeClassification(LargeClassification lclas);
	
	int selectLaseCode();
	
	int selectLargeClassificationByNoAndMl(int lcNo);
}
