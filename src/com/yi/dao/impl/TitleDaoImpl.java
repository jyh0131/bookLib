package com.yi.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.yi.dao.TitleDao;
import com.yi.jdbc.JDBCUtil;
import com.yi.model.Title;
import com.yi.util.LogUtil;

public class TitleDaoImpl implements TitleDao {
	private static final TitleDaoImpl instance = new TitleDaoImpl();

	public static TitleDaoImpl getInstance() {
		return instance;
	}

	private TitleDaoImpl() {
	}
	

	@Override
	public List<Title> selectTitleByAll() {
		String sql = "select title_no,title_name from title";
		try (Connection con = JDBCUtil.getConnection();
				PreparedStatement pstmt = con.prepareStatement(sql);
				ResultSet rs = pstmt.executeQuery()) {
			List<Title> list = new ArrayList<>();
			LogUtil.prnLog(pstmt);
			while (rs.next()) {
				list.add(getTitle(rs));
			}
			return list;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}

	private Title getTitle(ResultSet rs) throws SQLException {
		int titleNo = rs.getInt("title_no");
		String titleName = rs.getString("title_name");
		return new Title(titleNo,titleName);
	}


}
