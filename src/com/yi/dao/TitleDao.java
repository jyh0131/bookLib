package com.yi.dao;

import java.util.List;

import com.yi.model.Title;

public interface TitleDao {
	List<Title> selectTitleByAll(); //권한 콤보박스용
}
