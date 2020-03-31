package com.yi.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.yi.dao.PublishingCompanyDao;
import com.yi.jdbc.JDBCUtil;
import com.yi.model.PublishingCompany;
import com.yi.util.LogUtil;

public class PublishingCompanyDaoImpl implements PublishingCompanyDao {
	private static final PublishingCompanyDaoImpl instance = new PublishingCompanyDaoImpl();
	
	public static PublishingCompanyDao getInstance() {
		return instance;
	}
	
	private PublishingCompanyDaoImpl() {}

	@Override
	public PublishingCompany selectPublishingCompanyByNo(PublishingCompany pc) {
		String sql = "select pls_no , pls_name from publishing_company where pls_no = ?";
		
		try (Connection con = JDBCUtil.getConnection();
				PreparedStatement pstmt = con.prepareStatement(sql)){
			pstmt.setInt(1, pc.getPlsNo());
			LogUtil.prnLog(pstmt);
			try (ResultSet rs = pstmt.executeQuery()){
				if(rs.next()) {
					return getPls(rs);
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}

	private PublishingCompany getPls(ResultSet rs) throws SQLException {
		int plsNo = rs.getInt("pls_no");
		String plsName = rs.getString("pls_name");
		return new PublishingCompany(plsNo, plsName);
	}

	@Override
	public List<PublishingCompany> selectPublishingCompanyByAll() {
		String sql = "select pls_no , pls_name from publishing_company";
		List<PublishingCompany> list = null;
		try (Connection con = JDBCUtil.getConnection();
				PreparedStatement pstmt = con.prepareStatement(sql);
				ResultSet rs = pstmt.executeQuery()){
			LogUtil.prnLog(pstmt);
			if(rs.next()) {
				list = new ArrayList<>();
				do {
					list.add(getPls(rs));
				} while (rs.next());
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}
	
	@Override
	public List<PublishingCompany> selectPublishingCompanyByNameAll(String pcName) {
		String sql = "select pls_no, pls_name from publishing_company where pls_name like ?";
		List<PublishingCompany> list = null;
		try (Connection con = JDBCUtil.getConnection();
				PreparedStatement pstmt = con.prepareStatement(sql)){
			pstmt.setString(1, pcName +"%");
			LogUtil.prnLog(pstmt);
			try(ResultSet rs = pstmt.executeQuery()) {				
				if(rs.next()) {
					list = new ArrayList<>();
					do {
						list.add(getPls(rs));
					} while (rs.next());
				}
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public int insertPublishingCompany(PublishingCompany pc) {
		String sql = "insert into publishing_company values(?, ?)";
		try (Connection con = JDBCUtil.getConnection();
				PreparedStatement pstmt = con.prepareStatement(sql)){
			pstmt.setInt(1, pc.getPlsNo());
			pstmt.setString(2, pc.getPlsName());
			LogUtil.prnLog(pstmt);
			return pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return 0;
	}

	@Override
	public int updatePublishingCompany(PublishingCompany pc) {
		String sql = "update publishing_company set pls_name = ? where pls_no = ?";
		try (Connection con = JDBCUtil.getConnection();
				PreparedStatement pstmt = con.prepareStatement(sql)){
			pstmt.setString(1, pc.getPlsName());
			pstmt.setInt(2, pc.getPlsNo());
			LogUtil.prnLog(pstmt);
			return pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return 0;
	}

	@Override
	public int deletePublishingCompany(PublishingCompany pc) {
		String sql = "delete from publishing_company where pls_no = ?";
		try(Connection con = JDBCUtil.getConnection();
				PreparedStatement pstmt = con.prepareStatement(sql)){
			pstmt.setInt(1, pc.getPlsNo());
			LogUtil.prnLog(pstmt);
			return pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return 0;
	}

	@Override
	public int selectLastCode() {
		String sql = "select max(pls_no) from publishing_company";
		try(Connection con = JDBCUtil.getConnection();
				PreparedStatement pstmt = con.prepareStatement(sql);
				ResultSet rs = pstmt.executeQuery()) {
			LogUtil.prnLog(pstmt);
			if(rs.next()) {
				return rs.getInt("max(pls_no)");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} 
		return 0;
	}

}
