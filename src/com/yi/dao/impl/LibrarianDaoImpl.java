package com.yi.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.yi.dao.LibrarianDao;
import com.yi.jdbc.JDBCUtil;
import com.yi.model.Librarian;
import com.yi.model.Title;
import com.yi.model.ZipCode;
import com.yi.util.LogUtil;

public class LibrarianDaoImpl implements LibrarianDao {
	private static final LibrarianDaoImpl instance = new LibrarianDaoImpl();

	public LibrarianDaoImpl() {
	}

	public static LibrarianDaoImpl getInstance() {
		return instance;
	}

	@Override
	public Librarian selectLibrarianById(Librarian lib) {
		String sql = "select lb_id, lb_pass, lb_name, lb_birthday, lb_zip, lb_bass_ad, lb_detail_ad, lb_tel, lb_img, title, join_date, work_cdt from librarian where lb_id = ?";
		try (Connection con = JDBCUtil.getConnection();
			PreparedStatement pstmt = con.prepareStatement(sql);) {
			pstmt.setString(1, lib.getLbId());
			LogUtil.prnLog(pstmt);
			try (ResultSet rs = pstmt.executeQuery()) {
				if (rs.next()) {
					return getLibrarian(rs, true);
				}
			}
		} catch (SQLException e) {

			e.printStackTrace();
		}
		return null;
	}

	private Librarian getLibrarian(ResultSet rs, boolean isImg) throws SQLException {
		String lbId = rs.getString("lb_id");
		String lbPass = rs.getString("lb_pass");
		String lbName = rs.getString("lb_name");
		Date lbBirthDay = rs.getTimestamp("lb_birthday");
		ZipCode lbZip = new ZipCode(rs.getInt("lb_zip"));
		String lbBassAd = rs.getString("lb_bass_ad");
		String lbDetailAd = rs.getString("lb_detail_ad");
		String lbTel = rs.getString("lb_tel");
		Title title = new Title(rs.getInt("title"));
		Date joinDate = rs.getTimestamp("join_date");
		int workCdt = rs.getInt("work_cdt");
		Librarian lb = new Librarian(lbId, lbPass, lbName, lbBirthDay, lbZip, lbBassAd, lbDetailAd, lbTel, title, joinDate, workCdt);
		if(isImg) {
			byte[] lbImg = rs.getBytes("lb_img");
			lb.setLbImg(lbImg);
		}
		LogUtil.prnLog("getLibrarian => " + lb);
		return lb;
	}

	@Override
	public List<Librarian> selectLibrarianByAll() {
		String sql =  "select * from librarian";
		
		List<Librarian> list =null;
		try(Connection con = JDBCUtil.getConnection();
				PreparedStatement pstmt = con.prepareStatement(sql);
				ResultSet rs = pstmt.executeQuery()){
			LogUtil.prnLog(pstmt);
			if(rs.next()) {
				list = new ArrayList<>();
				do {
					list.add(getLibrarianJoin(rs));
				}while(rs.next());
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}

	private Librarian getLibrarianJoin(ResultSet rs) throws SQLException {
		String lbId = rs.getString("lb_id");
		String lbPass = rs.getString("lb_pass");
		String lbName = rs.getString("lb_name");
		Date lbBirthDay = rs.getTimestamp("lb_birthday");
		ZipCode lbZip = new ZipCode(rs.getInt("lb_zip"));
		String lbBassAd = rs.getString("lb_bass_ad");
		String lbDetailAd = rs.getString("lb_detail_ad");
		String lbTel = rs.getString("lb_tel");
		byte[] lbImg = rs.getBytes("lb_img");
		Title title = new Title(rs.getInt("title"));
		Date joinDate = rs.getTimestamp("join_date");
		int workCdt = rs.getInt("work_cdt");
		Librarian lib =  new Librarian(lbId, lbPass, lbName, lbBirthDay, lbZip, lbBassAd, lbDetailAd, lbTel, lbImg, title, joinDate, workCdt);
		lib.setLibImgPath(rs.getString("lb_img_path"));
		
		return lib;
	}

	@Override
	public int insertLibrarian(Librarian lib) {
	//	System.out.println("titleno"+lib.getTitle().getTitleNo());
		//System.out.println("titlename" + lib.getTitle().getTitleName());
		//String sql = "insert into librarian(lb_id, lb_pass, lb_name, lb_birthday, lb_zip, lb_bass_ad, lb_detail_ad, lb_tel, lb_img, title ,join_date ,work_cdt) values\r\n" + 
		//		"(?, ?, ?,?,?,?,?,?,?,?,?,?);";
		String sql = "insert into librarian(lb_id, lb_pass, lb_name, title ,join_date ,work_cdt) values\r\n" + 
				"(?, ?, ?, ?, ?, ?);";
		try(Connection con = JDBCUtil.getConnection();
				PreparedStatement pstmt = con.prepareStatement(sql)){
			pstmt.setString(1, lib.getLbId());
			pstmt.setString(2, lib.getLbPass());
			pstmt.setString(3, lib.getLbName());
		//	pstmt.setTimestamp(4, new Timestamp(lib.getLbBirthDay().getTime()));
		//	pstmt.setInt(5, lib.getLbZip().getZipCode());
		//	pstmt.setString(6, lib.getLbBassAd());
		//	pstmt.setString(7, lib.getLbDetailAd());
		//	pstmt.setString(8, lib.getLbTel());
		//	pstmt.setBytes(9, lib.getLbImg());
			pstmt.setInt(4, lib.getTitle().getTitleNo());
			pstmt.setTimestamp(5, new Timestamp(lib.getJoinDate().getTime()));
			pstmt.setInt(6, lib.getWorkCdt());
			//pstmt.setString(7, lib.getLibImgPath());
			LogUtil.prnLog(pstmt);
			
			return pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return 0;
	}

	@Override
	public int updateLibrarian(Librarian lib) {
		StringBuilder sql = new StringBuilder("update librarian set ");
		if(lib.getLbPass()!=null) sql.append("lb_pass=?, ");
		if(lib.getLbName()!=null) sql.append("lb_name=?, ");
		if(lib.getLbBirthDay()!=null) sql.append("lb_birthday=?, ");
		if(lib.getLbZip()!=null) sql.append("lb_zip=?, ");
		if(lib.getLbBassAd()!=null) sql.append("lb_bass_ad=?, ");
		if(lib.getLbDetailAd()!=null) sql.append("lb_detail_ad=?, ");
		if(lib.getLbTel()!=null) sql.append("lb_tel=?, ");
		if(lib.getLbImg()!=null) sql.append("lb_img=?, ");
		if(lib.getTitle().getTitleNo() !=-1) sql.append("title=?, ");
		if(lib.getJoinDate()!=null) sql.append("join_date=?, ");
		if(lib.getWorkCdt()!=-1) sql.append("work_cdt=?, ");
		if(lib.getLibImgPath() !=null) sql.append("lb_img_path=?,");
		sql.replace(sql.lastIndexOf(","), sql.length(), " ");
		sql.append("where lb_id=?");
		
		try(Connection con = JDBCUtil.getConnection();
				PreparedStatement pstmt = con.prepareStatement(sql.toString())){
			int argCnt = 1;
			if(lib.getLbPass()!=null) pstmt.setString(argCnt++, lib.getLbPass());
			if(lib.getLbName()!=null) pstmt.setString(argCnt++, lib.getLbName());
			if(lib.getLbBirthDay()!=null) pstmt.setTimestamp(argCnt++, new Timestamp(lib.getLbBirthDay().getTime()));
			if(lib.getLbZip()!=null) pstmt.setInt(argCnt++, lib.getLbZip().getZipCode());
			if(lib.getLbBassAd()!=null) pstmt.setString(argCnt++, lib.getLbBassAd());
			if(lib.getLbDetailAd()!=null) pstmt.setString(argCnt++, lib.getLbDetailAd());
			if(lib.getLbTel()!=null) pstmt.setString(argCnt++,lib.getLbTel());
			if(lib.getLbImg()!=null)pstmt.setBytes(argCnt++, lib.getLbImg());
			if(lib.getTitle().getTitleNo() !=-1)pstmt.setInt(argCnt++, lib.getTitle().getTitleNo());
			if(lib.getJoinDate()!=null) pstmt.setTimestamp(argCnt++, new Timestamp(lib.getJoinDate().getTime()));
			if(lib.getWorkCdt()!=-1)pstmt.setInt(argCnt++, lib.getWorkCdt());
			if(lib.getLibImgPath() !=null)pstmt.setString(argCnt++, lib.getLibImgPath());
			pstmt.setString(argCnt++, lib.getLbId());
			LogUtil.prnLog(pstmt);
			return pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return 0;
	}

	@Override
	public int deleteLibrarian(Librarian lib) {
		String sql = "delete from librarian where lb_id =?";
		try(Connection con = JDBCUtil.getConnection();
				PreparedStatement pstmt = con.prepareStatement(sql)){
			pstmt.setString(1, lib.getLbId());
			LogUtil.prnLog(pstmt);
			return pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return 0;
	}

	@Override
	public Librarian loginLibrarian(Librarian lib) {
		String sql = "select lb_id, lb_pass, lb_name, lb_birthday, lb_zip, lb_bass_ad, lb_detail_ad, "
				+ "lb_tel, title, join_date, work_cdt "
				+ "from librarian "
				+ "where lb_id = ? and lb_pass = ?";
		
		try(Connection con = JDBCUtil.getConnection();
				PreparedStatement pstmt = con.prepareStatement(sql)){
			pstmt.setString(1, lib.getLbId());
			pstmt.setString(2, lib.getLbPass());
			LogUtil.prnLog(pstmt);
			try(ResultSet rs = pstmt.executeQuery()){
				if(rs.next()) {
					return getLibrarian(rs, false);
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public Librarian findLibrarianId(Librarian lib) {
		String sql = "select lb_id, lb_pass, lb_name, lb_birthday, lb_zip, lb_bass_ad, lb_detail_ad, lb_tel, lb_img, "
					+ "title, join_date, work_cdt "
					+ "	from librarian " 
					+ "	where lb_name = ? and lb_birthday = ? ";
		
		try (Connection con = JDBCUtil.getConnection();
				PreparedStatement pstmt = con.prepareStatement(sql)){
			pstmt.setString(1, lib.getLbName());
			pstmt.setTimestamp(2, new Timestamp(lib.getLbBirthDay().getTime()));
			try(ResultSet rs = pstmt.executeQuery()){
				if(rs.next()) {
					return getLibrarian(rs, false);
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public Librarian findLibrarianPw(Librarian lib) {
		String sql = "select lb_id, lb_pass, lb_name, lb_birthday, lb_zip, lb_bass_ad, lb_detail_ad, lb_tel, lb_img,"
				+ " title, join_date, work_cdt " 
				+ "	from librarian " 
				+ "	where lb_id = ? and lb_name = ? and lb_birthday = ?";
		try(Connection con = JDBCUtil.getConnection();
				PreparedStatement pstmt = con.prepareStatement(sql)){
			pstmt.setString(1, lib.getLbId());
			pstmt.setString(2, lib.getLbName());
			pstmt.setTimestamp(3, new Timestamp(lib.getLbBirthDay().getTime()));
			try(ResultSet rs = pstmt.executeQuery()){
				if(rs.next()) {
					return getLibrarian(rs, false);
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public List<Librarian> searchLibrarianByID(Librarian librarian) {
		List<Librarian> list = new ArrayList<>();
		String sql = "select lb_id, lb_name, lb_birthday, lb_zip, lb_bass_ad, lb_detail_ad, lb_tel, lb_img, title, join_date, work_cdt,lb_img_path  \r\n" + 
				"from librarian\r\n" + 
				"where lb_id like ? ";
		try (Connection con = JDBCUtil.getConnection();
				PreparedStatement pstmt = con.prepareStatement(sql);){
			pstmt.setString(1, "%" + librarian.getLbId() + "%" );
				try(ResultSet rs = pstmt.executeQuery()){
					if (rs.next()) {
						list = new ArrayList<>();
						do {
							list.add(getLibrarianByAll(rs));
						} while (rs.next());
					}
				}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<Librarian> searchLibrarianByName(Librarian librarian) {
		List<Librarian> list = new ArrayList<>();
		String sql = "select lb_id, lb_name, lb_birthday, lb_zip, lb_bass_ad, lb_detail_ad, lb_tel, lb_img, title, join_date, work_cdt,lb_img_path  \r\n" + 
				"from librarian\r\n" + 
				"where lb_name like ? ";
		try (Connection con = JDBCUtil.getConnection();
				PreparedStatement pstmt = con.prepareStatement(sql);){
			pstmt.setString(1, "%" + librarian.getLbName() + "%" );
				try(ResultSet rs = pstmt.executeQuery()){
					if (rs.next()) {
						list = new ArrayList<>();
						do {
							list.add(getLibrarianByAll(rs));
						} while (rs.next());
					}
				}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}

	private Librarian getLibrarianByAll(ResultSet rs) throws SQLException {
		String lbId = rs.getString("lb_id");
		String lbName = rs.getString("lb_name");
		Date lbBirthDay = rs.getDate("lb_birthday");
		ZipCode lbZip = new ZipCode(rs.getInt("lb_zip"));
		String lbBassAd = rs.getString("lb_bass_ad");
		String lbDetailAd = rs.getString("lb_detail_ad");
		String lbTel = rs.getString("lb_tel");
		byte[] lbImg = rs.getBytes("lb_img");
		Title title = new Title(rs.getInt("title"));
		Date joinDate = rs.getDate("join_date");
		int workCdt = rs.getInt("work_cdt");
		String lbImgPath = rs.getString("lb_img_path");
		
		return new Librarian(lbId, lbName, lbBirthDay, lbZip, lbBassAd, lbDetailAd, lbTel, lbImg, title, joinDate, workCdt, lbImgPath);
	}
	
	
	private Librarian getLibrarianByWork(ResultSet rs) throws SQLException {
		String lbId = rs.getString("lb_id");
		int workCdt = rs.getInt("work_cdt");
		return new Librarian(lbId, workCdt);
	}

	@Override
	public List<Librarian> selectByWork(Librarian lib) {
		List<Librarian> list = new ArrayList<>();
		String sql = "select work_cdt from librarian where lb_id=?";
		try (Connection con = JDBCUtil.getConnection();
				PreparedStatement pstmt = con.prepareStatement(sql);){
			pstmt.setString(1, lib.getLbId());
				try(ResultSet rs = pstmt.executeQuery()){
					if (rs.next()) {
						list = new ArrayList<>();
						do {
							list.add(getLibrarianByWork(rs));
						} while (rs.next());
					}
				}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}


}
