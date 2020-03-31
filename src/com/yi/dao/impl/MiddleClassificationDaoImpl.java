package com.yi.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.yi.dao.MiddleClassificationDao;
import com.yi.jdbc.JDBCUtil;
import com.yi.model.LargeClassification;
import com.yi.model.MiddleClassification;
import com.yi.util.LogUtil;

public class MiddleClassificationDaoImpl implements MiddleClassificationDao {
	private static final MiddleClassificationDaoImpl instance = new MiddleClassificationDaoImpl();
	
	public static MiddleClassificationDaoImpl getInstance() {
		return instance;
	}
	
	private MiddleClassificationDaoImpl() {}

	@Override
	public MiddleClassification selectMiddleClassificationByNo(MiddleClassification mlsfc) {
		String sql = "select lclas_no , mlsfc_no , mlsfc_name from middle_classification "
					+ "where lclas_no = ? and mlsfc_no = ?";
		try (Connection con = JDBCUtil.getConnection();
				PreparedStatement pstmt = con.prepareStatement(sql)) {
			pstmt.setInt(1, mlsfc.getLclasNo().getLclasNo());
			pstmt.setInt(2, mlsfc.getMlsfcNo());
			LogUtil.prnLog(pstmt);
			try (ResultSet rs = pstmt.executeQuery()){
				if(rs.next()) {
					return getMlsfc(rs);
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	private MiddleClassification getMlsfc(ResultSet rs) throws SQLException {
		LargeClassification lclasNo = new LargeClassification(rs.getInt("lclas_no"));
		int mlsfcNo = rs.getInt("mlsfc_no");
		String mlsfcName = rs.getString("mlsfc_name");
		
		return new MiddleClassification(lclasNo, mlsfcNo, mlsfcName);
	}

	@Override
	public List<MiddleClassification> selectMiddleClassificationByAll() {
		String sql = "select lc.lclas_no , lc.lclas_name , ml.mlsfc_no , ml.mlsfc_name "
				+ "from middle_classification ml left join large_classification lc on ml.lclas_no = lc.lclas_no ;";
		List<MiddleClassification> list = null;
		try (Connection con = JDBCUtil.getConnection();
				PreparedStatement pstmt = con.prepareStatement(sql);
				ResultSet rs = pstmt.executeQuery()){
			LogUtil.prnLog(pstmt);
			if(rs.next()) {
				list = new ArrayList<>();
				do {
					list.add(getLcMljoin(rs));
				} while(rs.next());
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	
	private MiddleClassification getLcMljoin(ResultSet rs) throws SQLException {
		LargeClassification lclasNo = new LargeClassification(rs.getInt("lc.lclas_no"));
		lclasNo.setLclasName(rs.getString("lc.lclas_name"));
		int mlsfcNo = rs.getInt("ml.mlsfc_no");
		String mlsfcName = rs.getString("ml.mlsfc_name");
		return new MiddleClassification(lclasNo, mlsfcNo, mlsfcName);
	}

	@Override
	public List<MiddleClassification> selectMiddleClassificationGroupLc(LargeClassification lc) {
		String sql = "select lclas_no , mlsfc_no , mlsfc_name from middle_classification where lclas_no = ?";
		List<MiddleClassification> list = null;
		try(Connection con = JDBCUtil.getConnection();
				PreparedStatement pstmt = con.prepareStatement(sql)) {
			pstmt.setInt(1, lc.getLclasNo());
			try (ResultSet rs = pstmt.executeQuery()) {
				if(rs.next()) {
					list = new ArrayList<>();
					do {
						list.add(getMlsfc(rs));
					} while(rs.next());
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public int insertMiddleClassification(MiddleClassification mlsfc) {
		String sql = "insert into middle_classification values(?, ?, ?)";
		try (Connection con = JDBCUtil.getConnection();
				PreparedStatement pstmt = con.prepareStatement(sql)) {
			pstmt.setInt(1, mlsfc.getLclasNo().getLclasNo());
			pstmt.setInt(2, mlsfc.getMlsfcNo());
			pstmt.setString(3, mlsfc.getMlsfcName());
			LogUtil.prnLog(pstmt);
			return pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return 0;
	}

	@Override
	public int updateMiddleClassification(MiddleClassification mlsfc) {
		String sql = "update middle_classification set mlsfc_name = ? where lclas_no = ? and mlsfc_no = ?";
		try (Connection con = JDBCUtil.getConnection();
				PreparedStatement pstmt = con.prepareStatement(sql)) {
			pstmt.setString(1, mlsfc.getMlsfcName());
			pstmt.setInt(2, mlsfc.getLclasNo().getLclasNo());
			pstmt.setInt(3, mlsfc.getMlsfcNo());
			LogUtil.prnLog(pstmt);
			return pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return 0;
	}

	@Override
	public int deleteMiddleClassification(MiddleClassification mlsfc) {
		String sql = "delete from middle_classification where mlsfc_no = ? and mlsfc_name = ?";
		try (Connection con = JDBCUtil.getConnection();
				PreparedStatement pstmt = con.prepareStatement(sql)) {
			pstmt.setInt(1, mlsfc.getMlsfcNo());
			pstmt.setString(2, mlsfc.getMlsfcName());
			LogUtil.prnLog(pstmt);
			return pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return 0;
	}

	@Override
	public int selectLastCode(LargeClassification lc) {
		String sql = "select max(mlsfc_no) from middle_classification where lclas_no = ?";
		try (Connection con = JDBCUtil.getConnection();
				PreparedStatement pstmt = con.prepareStatement(sql)){
			pstmt.setInt(1, lc.getLclasNo());
			LogUtil.prnLog(pstmt);
			try (ResultSet rs = pstmt.executeQuery()){
				if(rs.next()) {
					return rs.getInt("max(mlsfc_no)");
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return 0;
	}

}
