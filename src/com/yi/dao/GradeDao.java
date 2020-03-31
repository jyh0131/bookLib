package com.yi.dao;

import java.util.List;

import com.yi.model.Grade;

public interface GradeDao {
	Grade selectGradeByNo(Grade grade);

	List<Grade> selectGradeByAll();
	
	int insertGrade(Grade grade);

	int updateGrade(Grade grade);

	int deleteGrade(Grade grade);
}
