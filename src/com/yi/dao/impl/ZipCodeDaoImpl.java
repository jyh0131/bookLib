package com.yi.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.mysql.jdbc.jdbc2.optional.MysqlDataSource;
import com.yi.dao.ZipCodeDao;
import com.yi.jdbc.JDBCUtil;
import com.yi.model.ZipCode;

public class ZipCodeDaoImpl implements ZipCodeDao {
	private static final ZipCodeDaoImpl instance = new ZipCodeDaoImpl();

	private ZipCodeDaoImpl() {
	}

	public static ZipCodeDaoImpl getInstance() {
		return instance;
	}

	private ZipCode getZipCode(ResultSet rs) throws SQLException {
		int zipCode = rs.getInt("zip_code");
		String ctprvn = rs.getString("ctprvn");
		String signgu = rs.getString("signgu");
		String roadName = rs.getString("road_name");
		int buldNoOriginNo = rs.getInt("buld_no_origin_no");
		int buldNoViceNo = rs.getInt("buld_no_vice_no");
		return new ZipCode(zipCode, ctprvn, signgu, roadName, buldNoOriginNo, buldNoViceNo);
	}

	@Override
	public ZipCode selectZipCodeByNo(ZipCode zip) {
		// 이름은 no인데 where 모든것으로 찾는거다
		String sql = "select zip_code,ctprvn,signgu,road_name,buld_no_origin_no,buld_no_vice_no \r\n"
				+ "from zip_code\r\n"
				+ "where ctprvn =? and signgu=? and road_name =? and buld_no_origin_no = ? and buld_no_vice_no = ?";
		ZipCode zipcode = new ZipCode();
		try (Connection con = JDBCUtil.getConnection(); PreparedStatement pstmt = con.prepareStatement(sql)) {
			pstmt.setString(1, zip.getCtprvn());
			pstmt.setString(2, zip.getSigngu());
			pstmt.setString(3, zip.getRoadName());
			pstmt.setInt(4, zip.getBuldNoOriginNo());
			pstmt.setInt(5, zip.getBuldNoViceNo());
			try (ResultSet rs = pstmt.executeQuery()) {
				if (rs.next()) {
					zipcode = getZipCode(rs);
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return zipcode;
	}

//	@Override
//	public List<ZipCode> selectZipCodeByAll() {
//		return null;
//	}
//
//	@Override
//	public int insertZipCode(ZipCode zip) {
//		return 0;
//	}
//
//	@Override
//	public int updateZipCode(ZipCode zip) {
//		return 0;
//	}
//
//	@Override
//	public int deleteZipCode(ZipCode zip) {
//		return 0;
//	}

}
