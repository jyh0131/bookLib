package com.yi.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.yi.dao.GradeDao;
import com.yi.jdbc.JDBCUtil;
import com.yi.model.Grade;
import com.yi.util.LogUtil;

public class GradeDaoImpl implements GradeDao {
	private static final GradeDaoImpl instance = new GradeDaoImpl();

	public static GradeDaoImpl getInstance() {
		return instance;
	}

	private GradeDaoImpl() {
	}

	@Override
	public Grade selectGradeByNo(Grade grade) {
		String sql = "select grade_no, grad_name, book_le_cnt from grade where grade_no=?";
		try (Connection con = JDBCUtil.getConnection(); PreparedStatement pstmt = con.prepareStatement(sql);) {
			LogUtil.prnLog(pstmt);
			pstmt.setInt(1, grade.getGradeNo());
			try (ResultSet rs = pstmt.executeQuery()) {
				if (rs.next()) {
					return getGrade(rs);
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public List<Grade> selectGradeByAll() {
		String sql = "select grad_name from grade";
		try (Connection con = JDBCUtil.getConnection();
				PreparedStatement pstmt = con.prepareStatement(sql);
				ResultSet rs = pstmt.executeQuery()) {
			List<Grade> list = new ArrayList<>();
			LogUtil.prnLog(pstmt);
			while (rs.next()) {
				list.add(getGrade(rs));
			}
			return list;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public int insertGrade(Grade grade) {
		String sql = "insert into grade values(?, ?, ?)";
		try (Connection con = JDBCUtil.getConnection(); PreparedStatement pstmt = con.prepareStatement(sql)) {
			pstmt.setInt(1, grade.getGradeNo());
			pstmt.setString(2, grade.getGradeName());
			pstmt.setInt(3, grade.getBookLeCnt());
			LogUtil.prnLog(pstmt);
			return pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return 0;
	}

	@Override
	public int updateGrade(Grade grade) {
		String sql = "update grade set grad_name=? book_le_cnt=? where grade_no=?";
		try (Connection con = JDBCUtil.getConnection(); PreparedStatement pstmt = con.prepareStatement(sql)) {
			pstmt.setString(1, grade.getGradeName());
			pstmt.setInt(2, grade.getBookLeCnt());
			pstmt.setInt(3, grade.getGradeNo());
			LogUtil.prnLog(pstmt);
			return pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return 0;
	}

	@Override
	public int deleteGrade(Grade grade) {
		String sql = "delete from grade where grade_no=?";
		try (Connection con = JDBCUtil.getConnection(); PreparedStatement pstmt = con.prepareStatement(sql)) {
			pstmt.setInt(1, grade.getGradeNo());
			LogUtil.prnLog(pstmt);
			return pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return 0;
	}

	private Grade getGrade(ResultSet rs) throws SQLException {
		//int gradeNo = rs.getInt("grade_no");
		String gradeName = rs.getString("grad_name");
		//int bookLeCnt = rs.getInt("book_le_cnt");
		return new Grade(gradeName);
	}
}
