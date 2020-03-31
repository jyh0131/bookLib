package com.yi.dao;

import java.util.List;

import com.yi.model.RequestBook;

public interface RequestBookDao {
	List<RequestBook> selectRequestBookByAll();
	List<RequestBook> selectRequestBookByOptionAll(RequestBook rb, String year, String month);
	List<RequestBook> selectRequestBookByYearOption(RequestBook rb, String year);
	List<RequestBook> selectRequestBookByIdAll(RequestBook rb);
	List<RequestBook> selectRequestBookByIdAndYearOption(RequestBook rb, String year);

	int insertRequestBook(RequestBook rb);
	int updateRequestBook(RequestBook rb);
	int deleteRequestBook(RequestBook rb);
}
