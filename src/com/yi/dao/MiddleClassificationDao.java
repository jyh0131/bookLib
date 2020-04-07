package com.yi.dao;

import java.util.List;

import com.yi.model.LargeClassification;
import com.yi.model.MiddleClassification;

public interface MiddleClassificationDao {
	MiddleClassification selectMiddleClassificationByNo(MiddleClassification mlsfc);
	
	List<MiddleClassification> selectMiddleClassificationByAll();
	List<MiddleClassification> selectMiddleClassificationGroupLc(LargeClassification lc);

	int insertMiddleClassification(MiddleClassification mlsfc);

	int updateMiddleClassification(MiddleClassification mlsfc);

	int deleteMiddleClassification(MiddleClassification mlsfc);
	
	int selectLastCode(LargeClassification lc);
}
