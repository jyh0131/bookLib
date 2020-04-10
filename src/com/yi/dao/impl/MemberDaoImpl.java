package com.yi.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.yi.dao.MemberDao;
import com.yi.jdbc.JDBCUtil;
import com.yi.model.Grade;
import com.yi.model.Member;
import com.yi.model.ZipCode;
import com.yi.util.LogUtil;

public class MemberDaoImpl implements MemberDao {
	private static final MemberDaoImpl instance = new MemberDaoImpl();

	public MemberDaoImpl() {
	}

	public static MemberDao getInstance() {
		return instance;
	}


	@Override
	public Member selectMemberByNo(Member member) {
		String sql = "select mber_id, mber_pass, mber_name, mber_brthdy, mber_zip, mber_bass_ad, mber_detail_ad, mber_tel, mber_img, mber_img_path, total_le_cnt, lend_book_cnt, grade, grad_name, book_le_cnt, lend_psb_cdt, join_dt, wdr_cdt,od_cnt from member m left join grade g on m.grade = g.grade_no where mber_id = ?";
		try (Connection con = JDBCUtil.getConnection(); PreparedStatement pstmt = con.prepareStatement(sql);) {
			pstmt.setString(1, member.getMberId());
			try (ResultSet rs = pstmt.executeQuery()){
				if (rs.next()) {
					return getMemberRentCnt(rs, true);
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
	

	@Override
	public List<Member> selectMemberByAll() {
		String sql = "select * from member";
		List<Member> list = null;
		try (Connection con = JDBCUtil.getConnection();
				PreparedStatement pstmt = con.prepareStatement(sql);
				ResultSet rs = pstmt.executeQuery()) {
			LogUtil.prnLog(pstmt);
			if (rs.next()) {
				list = new ArrayList<>();
				do {
					list.add(getMemberByAll(rs));
				} while (rs.next());
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}

	private Member getMemberByAll(ResultSet rs) throws SQLException {
		String mberId = rs.getString("mber_id");
		String mberName = rs.getString("mber_name");
		Date mberBrthdy = rs.getTimestamp("mber_brthdy");
		ZipCode mberZip = new ZipCode(rs.getInt("mber_zip"));
		String mberBassAd = rs.getString("mber_bass_ad");
		String mberDetailAd = rs.getString("mber_detail_ad");
		String mberTel = rs.getString("mber_tel");
		int totalLeCnt = rs.getInt("total_le_cnt");
		int lendBookCnt = rs.getInt("lend_book_cnt");
		Grade grade = new Grade(rs.getInt("grade"));
		byte[] mberImg = rs.getBytes("mber_img");
		//String memberImgPath = rs.getString("mber_img_path");
		Date joinDt = rs.getTimestamp("join_dt");
		int wdrCdt = rs.getInt("wdr_cdt");
		int lendPsbCdt = rs.getInt("lend_psb_cdt");
		int odCnt = rs.getInt("od_cnt");
	
		Member mber = new Member(mberId, mberName, mberBrthdy, mberZip, mberBassAd, mberDetailAd, mberTel, mberImg, totalLeCnt, lendBookCnt, grade, lendPsbCdt, joinDt, wdrCdt, odCnt);
		
		mber.setMemberImgPath(rs.getString("mber_img_path"));
		
		
		return mber;
	}

	@Override
	public int insertMember(Member member) {
		String sql = "insert into member(mber_id, mber_pass,mber_name, mber_brthdy,mber_zip,mber_bass_ad,mber_detail_ad,mber_tel,mber_img, total_le_cnt, lend_book_cnt, grade, lend_psb_cdt, od_cnt, join_dt, wdr_cdt, mber_img_path) values(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
		try (Connection con = JDBCUtil.getConnection(); PreparedStatement pstmt = con.prepareStatement(sql)) {
			pstmt.setString(1, member.getMberId());
			pstmt.setString(2, member.getMberPass());
			pstmt.setString(3, member.getMberName());
			pstmt.setTimestamp(4, new Timestamp(member.getMberBrthdy().getTime()));
			pstmt.setInt(5, member.getMberZip().getZipCode());
			pstmt.setString(6, member.getMberBassAd());
			pstmt.setString(7, member.getMberDetailAd());
			pstmt.setString(8, member.getMberTel());
			pstmt.setBytes(9, member.getMberImg());
			pstmt.setInt(10, member.getTotalLeCnt());
			pstmt.setInt(11, member.getLendBookCnt());
			pstmt.setInt(12, member.getGrade().getGradeNo());
			pstmt.setInt(13, member.getLendPsbCdt());
			pstmt.setInt(14, member.getOdCnt());
			pstmt.setTimestamp(15, new Timestamp(member.getJoinDt().getTime()));
			pstmt.setInt(16, member.getWdrCdt());
			pstmt.setString(17, member.getMemberImgPath());
			return pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return 0;
	}

	@Override
	public int updateMember(Member member) {
		StringBuffer sql = new StringBuffer("update member set "); // 띄워쓰기 주의하자!
		if (member.getMberPass() != null)
			sql.append("mber_pass=?, ");
		if (member.getMberName() != null)
			sql.append("mber_name=?, ");
		if (member.getMberBrthdy() != null)
			sql.append("mber_brthdy=?, ");
		if (member.getMberZip() != null)
			sql.append("mber_zip=?, ");
		if (member.getMberBassAd() != null)
			sql.append("mber_bass_ad=?, ");
		if (member.getMberDetailAd() != null)
			sql.append("mber_detail_ad=?, ");
		if (member.getMberTel() != null)
			sql.append("mber_tel=?, ");
		if (member.getMberImg() != null)
			sql.append("mber_img=?, ");
		if (member.getTotalLeCnt() != -1)
			sql.append("total_le_cnt=?, ");
		if (member.getLendBookCnt() != -1)
			sql.append("lend_book_cnt=?, ");
/*		if (member.getGrade().getGradeNo() != -1)
			sql.append("grade=?, ");
		if (member.getLendPsbCdt() != -1)
			sql.append("lend_psb_cdt=?, ");
		if (member.getJoinDt() != null)
			sql.append("join_dt=?, ");
		if (member.getWdrCdt() != -1)
			sql.append("wdr_cdt=?, ");
		if (member.getOdCnt() != -1)
			sql.append("od_cnt=?, ");*/
		if(member.getMemberImgPath() !=null)
			sql.append("mber_img_path=?, ");
		sql.replace(sql.lastIndexOf(","), sql.length(), " ");
		sql.append("where mber_id=?");
		
		try (Connection con = JDBCUtil.getConnection();
				PreparedStatement pstmt = con.prepareStatement(sql.toString())) {
			int argCnt = 1;

			if (member.getMberPass() != null)
				pstmt.setString(argCnt++, member.getMberPass());
			if (member.getMberName() != null)
				pstmt.setString(argCnt++, member.getMberName());
			if (member.getMberBrthdy() != null)
				pstmt.setTimestamp(argCnt++, new Timestamp(member.getMberBrthdy().getTime()));
			if (member.getMberZip() != null)
				pstmt.setInt(argCnt++, member.getMberZip().getZipCode());
			if (member.getMberBassAd() != null)
				pstmt.setString(argCnt++, member.getMberBassAd());
			if (member.getMberDetailAd() != null)
				pstmt.setString(argCnt++, member.getMberDetailAd());
			if (member.getMberTel() != null)
				pstmt.setString(argCnt++, member.getMberTel());
			if (member.getMberImg() != null)
				pstmt.setBytes(argCnt++, member.getMberImg());
			if (member.getTotalLeCnt() != -1)
				pstmt.setInt(argCnt++, member.getTotalLeCnt());
			if (member.getLendBookCnt() != -1)
				pstmt.setInt(argCnt++, member.getLendBookCnt());
			/*if (member.getGrade().getGradeNo() != -1)
				pstmt.setInt(argCnt++, member.getGrade().getGradeNo());
			if (member.getLendPsbCdt() != -1)
				pstmt.setInt(argCnt++, member.getLendPsbCdt());
			if (member.getJoinDt() != null)
				pstmt.setTimestamp(argCnt++, new Timestamp(member.getJoinDt().getTime()));
			if (member.getWdrCdt() !=-1)
				pstmt.setInt(argCnt++, member.getWdrCdt());
			if (member.getOdCnt() !=-1)
				pstmt.setInt(argCnt++, member.getOdCnt());*/
			if(member.getMemberImgPath() !=null) 
				pstmt.setString(argCnt++, member.getMemberImgPath());
			pstmt.setString(argCnt++, member.getMberId());
			return pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return 0;
	}
	
	
	@Override
	public int updateCountMember(Member member) {
		StringBuffer sql = new StringBuffer("update member set "); // 띄워쓰기 주의하자!
		if (member.getMberPass() != null)
			sql.append("mber_pass=?, ");
		if (member.getMberName() != null)
			sql.append("mber_name=?, ");
		if (member.getMberBrthdy() != null)
			sql.append("mber_brthdy=?, ");
		if (member.getMberZip() != null)
			sql.append("mber_zip=?, ");
		if (member.getMberBassAd() != null)
			sql.append("mber_bass_ad=?, ");
		if (member.getMberDetailAd() != null)
			sql.append("mber_detail_ad=?, ");
		if (member.getMberTel() != null)
			sql.append("mber_tel=?, ");
		if (member.getMberImg() != null)
			sql.append("mber_img=?, ");
		if (member.getTotalLeCnt() != -1)
			sql.append("total_le_cnt=?, ");
		if (member.getLendBookCnt() != -1)
			sql.append("lend_book_cnt=?, ");
		if (member.getGrade().getGradeNo() != -1)
			sql.append("grade=?, ");
		if (member.getLendPsbCdt() != -1)
			sql.append("lend_psb_cdt=?, ");
		if (member.getJoinDt() != null)
			sql.append("join_dt=?, ");
		if (member.getWdrCdt() != -1)
			sql.append("wdr_cdt=?, ");
		if (member.getOdCnt() != -1)
			sql.append("od_cnt=?, ");
		if(member.getMemberImgPath() !=null)
			sql.append("mber_img_path=?,");
		sql.replace(sql.lastIndexOf(","), sql.length(), " ");
		sql.append("where mber_id=?");
		
		try (Connection con = JDBCUtil.getConnection();
				PreparedStatement pstmt = con.prepareStatement(sql.toString())) {
			int argCnt = 1;

			if (member.getMberPass() != null)
				pstmt.setString(argCnt++, member.getMberPass());
			if (member.getMberName() != null)
				pstmt.setString(argCnt++, member.getMberName());
			if (member.getMberBrthdy() != null)
				pstmt.setTimestamp(argCnt++, new Timestamp(member.getMberBrthdy().getTime()));
			if (member.getMberZip() != null)
				pstmt.setInt(argCnt++, member.getMberZip().getZipCode());
			if (member.getMberBassAd() != null)
				pstmt.setString(argCnt++, member.getMberBassAd());
			if (member.getMberDetailAd() != null)
				pstmt.setString(argCnt++, member.getMberDetailAd());
			if (member.getMberTel() != null)
				pstmt.setString(argCnt++, member.getMberTel());
			if (member.getMberImg() != null)
				pstmt.setBytes(argCnt++, member.getMberImg());
			if (member.getTotalLeCnt() != -1)
				pstmt.setInt(argCnt++, member.getTotalLeCnt());
			if (member.getLendBookCnt() != -1)
				pstmt.setInt(argCnt++, member.getLendBookCnt());
			if (member.getGrade().getGradeNo() != -1)
				pstmt.setInt(argCnt++, member.getGrade().getGradeNo());
			if (member.getLendPsbCdt() != -1)
				pstmt.setInt(argCnt++, member.getLendPsbCdt());
			if (member.getJoinDt() != null)
				pstmt.setTimestamp(argCnt++, new Timestamp(member.getJoinDt().getTime()));
			if (member.getWdrCdt() !=-1)
				pstmt.setInt(argCnt++, member.getWdrCdt());
			if (member.getOdCnt() !=-1)
				pstmt.setInt(argCnt++, member.getOdCnt());
			if(member.getMemberImgPath() !=null) 
				pstmt.setString(argCnt++, member.getMemberImgPath());
			pstmt.setString(argCnt++, member.getMberId());
			return pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return 0;
	}
	
	
//	public int updateCountMember(Member member) {
//		StringBuffer sql = new StringBuffer("update member set "); // 띄워쓰기 주의하자!
//		if (member.getMberPass() != null)
//			sql.append("mber_pass=?, ");
//		if (member.getMberName() != null)
//			sql.append("mber_name=?, ");
//		if (member.getMberBrthdy() != null)
//			sql.append("mber_brthdy=?, ");
//		if (member.getMberZip() != null)
//			sql.append("mber_zip=?, ");
//		if (member.getMberBassAd() != null)
//			sql.append("mber_bass_ad=?, ");
//		if (member.getMberDetailAd() != null)
//			sql.append("mber_detail_ad=?, ");
//		if (member.getMberTel() != null)
//			sql.append("mber_tel=?, ");
//		if (member.getMberImg() != null)
//			sql.append("mber_img=?, ");
//		if (member.getGrade().getGradeNo() != -1)
//			sql.append("grade=?, ");
//		sql.replace(sql.lastIndexOf(","), sql.length(), " ");
//		sql.append("where mber_id=?");
//
//		try (Connection con = JDBCUtil.getConnection();
//				PreparedStatement pstmt = con.prepareStatement(sql.toString())) {
//			int argCnt = 1;
//
//			if (member.getMberPass() != null)
//				pstmt.setString(argCnt++, member.getMberPass());
//			if (member.getMberName() != null)
//				pstmt.setString(argCnt++, member.getMberName());
//			if (member.getMberBrthdy() != null)
//				pstmt.setTimestamp(argCnt++, new Timestamp(member.getMberBrthdy().getTime()));
//			if (member.getMberZip() != null)
//				pstmt.setInt(argCnt++, member.getMberZip().getZipCode());
//			if (member.getMberBassAd() != null)
//				pstmt.setString(argCnt++, member.getMberBassAd());
//			if (member.getMberDetailAd() != null)
//				pstmt.setString(argCnt++, member.getMberDetailAd());
//			if (member.getMberTel() != null)
//				pstmt.setString(argCnt++, member.getMberTel());
//			if (member.getMberImg() != null)
//				pstmt.setBytes(argCnt++, member.getMberImg());
//			if (member.getGrade().getGradeNo() != -1)
//				pstmt.setInt(argCnt++, member.getGrade().getGradeNo());
//			pstmt.setString(argCnt++, member.getMberId());
//			LogUtil.prnLog(pstmt);
//			return pstmt.executeUpdate();
//		} catch (SQLException e) {
//			e.printStackTrace();
//		}
//
//		return 0;
//	}

	@Override
	public int deleteMember(Member member) {
		String sql = "delete from member where mber_id=?";
		try (Connection con = JDBCUtil.getConnection(); PreparedStatement pstmt = con.prepareStatement(sql)) {
			pstmt.setString(1, member.getMberId());
			LogUtil.prnLog(pstmt);
			return pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return 0;
	}

	@Override
	public Member loginMember(Member member) {
		String sql = "select mber_id , mber_pass, mber_name, mber_brthdy , mber_zip , mber_bass_ad , mber_detail_ad , mber_tel , total_le_cnt , "
				+ "	   lend_book_cnt , grade , lend_psb_cdt , join_dt , wdr_cdt  " + "	from member "
				+ "	where mber_id = ? and mber_pass = ?";

		try (Connection con = JDBCUtil.getConnection(); PreparedStatement pstmt = con.prepareStatement(sql)) {
			pstmt.setString(1, member.getMberId());
			pstmt.setString(2, member.getMberPass());
			LogUtil.prnLog(pstmt);
			try (ResultSet rs = pstmt.executeQuery()) {
				if (rs.next()) {
					return getMember(rs, false);
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}

	private Member getMember2(ResultSet rs, boolean isImg) throws SQLException {
		String mberId = rs.getString("mber_id");
		String mberPass = rs.getString("mber_pass");
		String mberName = rs.getString("mber_name");
		Date mberBrthdy = rs.getTimestamp("mber_brthdy");
		ZipCode mberZip = new ZipCode(rs.getInt("mber_zip"));
		String mberBassAd = rs.getString("mber_bass_ad");
		String mberDetailAd = rs.getString("mber_detail_ad");
		String mberTel = rs.getString("mber_tel");
		int totalLeCnt = rs.getInt("total_le_cnt");
		int lendBookCnt = rs.getInt("lend_book_cnt");
		Grade grade = new Grade(rs.getInt("grade"), rs.getString("grad_name"), rs.getInt("book_le_cnt"));
		int lendPsbCdt = rs.getInt("lend_psb_cdt");
		Date joinDt = rs.getTimestamp("join_dt");
		int wdrCdt = rs.getInt("wdr_cdt");
		Member mber = new Member(mberId, mberPass, mberName, mberBrthdy, mberZip, mberBassAd, mberDetailAd, mberTel,
				totalLeCnt, lendBookCnt, grade, lendPsbCdt, joinDt, wdrCdt);
		if (isImg) {
			byte[] mberImg = rs.getBytes("mber_img");
			mber.setMberImg(mberImg);
		}
		LogUtil.prnLog("getMember => " + mber);
		return mber;
	}
	
	private Member getMember(ResultSet rs, boolean isImg) throws SQLException {
		String mberId = rs.getString("mber_id");
		String mberPass = rs.getString("mber_pass");
		String mberName = rs.getString("mber_name");
		Date mberBrthdy = rs.getTimestamp("mber_brthdy");
		ZipCode mberZip = new ZipCode(rs.getInt("mber_zip"));
		String mberBassAd = rs.getString("mber_bass_ad");
		String mberDetailAd = rs.getString("mber_detail_ad");
		String mberTel = rs.getString("mber_tel");
		int totalLeCnt = rs.getInt("total_le_cnt");
		int lendBookCnt = rs.getInt("lend_book_cnt");
		Grade grade = new Grade(rs.getInt("grade"));
		int lendPsbCdt = rs.getInt("lend_psb_cdt");
		Date joinDt = rs.getTimestamp("join_dt");
		int wdrCdt = rs.getInt("wdr_cdt");
		Member mber = new Member(mberId, mberPass, mberName, mberBrthdy, mberZip, mberBassAd, mberDetailAd, mberTel,
				totalLeCnt, lendBookCnt, grade, lendPsbCdt, joinDt, wdrCdt);
		if (isImg) {
			byte[] mberImg = rs.getBytes("mber_img");
			mber.setMberImg(mberImg);
		}
		return mber;
	}
	
	private Member getMemberRentCnt(ResultSet rs, boolean isImg) throws SQLException {
		String mberId = rs.getString("mber_id");
		String mberPass = rs.getString("mber_pass");
		String mberName = rs.getString("mber_name");
		Date mberBrthdy = rs.getTimestamp("mber_brthdy");
		ZipCode mberZip = new ZipCode(rs.getInt("mber_zip"));
		String mberBassAd = rs.getString("mber_bass_ad");
		String mberDetailAd = rs.getString("mber_detail_ad");
		String mberTel = rs.getString("mber_tel");
		int totalLeCnt = rs.getInt("total_le_cnt");
		int lendBookCnt = rs.getInt("lend_book_cnt");
		Grade grade = new Grade(rs.getInt("grade"), rs.getString("grad_name"), rs.getInt("book_le_cnt"));
		int lendPsbCdt = rs.getInt("lend_psb_cdt");
		Date joinDt = rs.getTimestamp("join_dt");
		int wdrCdt = rs.getInt("wdr_cdt");
		int odCnt = rs.getInt("od_cnt");
		String memberImgPath = rs.getString("mber_img_path");
		Member mber = new Member(mberId, mberPass, mberName, mberBrthdy, mberZip, mberBassAd, mberDetailAd, mberTel,
				totalLeCnt, lendBookCnt, grade, lendPsbCdt, joinDt, wdrCdt);
		mber.setMemberImgPath(memberImgPath);
		if (isImg) {
			byte[] mberImg = rs.getBytes("mber_img");
			mber.setMberImg(mberImg);
		}
		mber.setOdCnt(odCnt);
		return mber;
	}

	@Override
	public Member findMemberId(Member member) {
		String sql = "select mber_id , mber_pass, mber_name, mber_brthdy , mber_zip , mber_bass_ad , mber_detail_ad , mber_tel , total_le_cnt , "
				+ " lend_book_cnt , grade , lend_psb_cdt , join_dt , wdr_cdt " + "	from member "
				+ "	where mber_name = ? and mber_brthdy = ?";
		try (Connection con = JDBCUtil.getConnection(); PreparedStatement pstmt = con.prepareStatement(sql)) {
			pstmt.setString(1, member.getMberName());
			pstmt.setTimestamp(2, new Timestamp(member.getMberBrthdy().getTime()));
			;
			LogUtil.prnLog(pstmt);
			try (ResultSet rs = pstmt.executeQuery()) {
				if (rs.next()) {
					return getMember(rs, false);
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public Member findMemberPw(Member member) {
		String sql = "select mber_id , mber_pass, mber_name, mber_brthdy , mber_zip , mber_bass_ad , mber_detail_ad , mber_tel , total_le_cnt , "
				+ " lend_book_cnt , grade , lend_psb_cdt , join_dt , wdr_cdt " + "	from member "
				+ "	where mber_id = ? and mber_name = ? and mber_brthdy = ?";
		try (Connection con = JDBCUtil.getConnection(); PreparedStatement pstmt = con.prepareStatement(sql)) {
			pstmt.setString(1, member.getMberId());
			pstmt.setString(2, member.getMberName());
			pstmt.setTimestamp(3, new Timestamp(member.getMberBrthdy().getTime()));
			LogUtil.prnLog(pstmt);
			try (ResultSet rs = pstmt.executeQuery()) {
				if (rs.next()) {
					return getMember(rs, false);
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public int[] selectMemberCounts() {
		int [] members = new int[3];
		String sql = "select (select count(mber_id) from member) as 'totalmember',\r\n" + 
				"	   (select count(mber_id) from member where total_le_cnt < 50) as 'normalmember',\r\n" + 
				"	   (select count(mber_id) from member where total_le_cnt >= 50) as 'vipmember'";
		try(Connection con = JDBCUtil.getConnection();
				PreparedStatement pstmt = con.prepareStatement(sql);
				ResultSet rs = pstmt.executeQuery()) {
			while(rs.next()) {
				members[0] = rs.getInt("totalmember");
				members[1] = rs.getInt("normalmember");
				members[2] = rs.getInt("vipmember");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return members;
	}

	@Override
	public Member selectMemberByNo2(Member member) {
		String sql = "select mber_id, mber_pass, mber_name, mber_brthdy, mber_zip, mber_bass_ad, mber_detail_ad, mber_tel, mber_img, total_le_cnt, lend_book_cnt, grade, grad_name, book_le_cnt, lend_psb_cdt, join_dt, wdr_cdt from member m left join grade g on m.grade = g.grade_no where mber_id = ?";
		try (Connection con = JDBCUtil.getConnection(); PreparedStatement pstmt = con.prepareStatement(sql);) {
			pstmt.setString(1, member.getMberId());
			try (ResultSet rs = pstmt.executeQuery()) {
				if (rs.next()) {
					return getMember2(rs, true);
				}
			}
		} catch (SQLException e) {

			e.printStackTrace();
		}
		return null;
	}
	@Override
	public Member selectMemberByNo3(Member member) {
		String sql = "select mber_id, mber_pass, mber_name, mber_brthdy, mber_zip, mber_bass_ad, mber_detail_ad, mber_tel, mber_img, total_le_cnt, lend_book_cnt, grade, grad_name, book_le_cnt, lend_psb_cdt, join_dt, wdr_cdt from member m left join grade g on m.grade = g.grade_no where mber_id = ?";
		try (Connection con = JDBCUtil.getConnection(); PreparedStatement pstmt = con.prepareStatement(sql);) {
			pstmt.setString(1, member.getMberId());
			try (ResultSet rs = pstmt.executeQuery()) {
				if (rs.next()) {
					return getMember2(rs, true);
				}
			}
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		return null;
	}
	@Override
	public List<Member> searchMemberByID(Member member) {
		List<Member> list = new ArrayList<>();
		String sql = "select mber_id, mber_name, mber_brthdy, mber_zip, mber_bass_ad, mber_detail_ad, mber_tel, mber_img, total_le_cnt, lend_book_cnt, grade, join_dt , wdr_cdt, lend_psb_cdt, od_cnt, mber_img_path\r\n" + 
				"from member\r\n" + 
				"where mber_id like ? ";
		try (Connection con = JDBCUtil.getConnection();
				PreparedStatement pstmt = con.prepareStatement(sql);){
			pstmt.setString(1, "%" + member.getMberId() + "%" );
				try(ResultSet rs = pstmt.executeQuery()){
					if (rs.next()) {
						list = new ArrayList<>();
						do {
							list.add(getMemberByAll(rs));
						} while (rs.next());
					}
				}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}

		

	@Override
	public List<Member> searchMemberByName(Member member) {
		String sql = "select mber_id, mber_name, mber_brthdy, mber_zip, mber_bass_ad, mber_detail_ad, mber_tel, total_le_cnt, lend_book_cnt, grade, join_dt , wdr_cdt, lend_psb_cdt, od_cnt, mber_img_path\r\n" + 
				"from member\r\n" + 
				"where mber_name like ? ";
		List<Member> list = null;
		try (Connection con = JDBCUtil.getConnection();
				PreparedStatement pstmt = con.prepareStatement(sql);){
			pstmt.setString(1, "%" + member.getMberName() + "%" );
				try(ResultSet rs = pstmt.executeQuery()){
					if (rs.next()) {
						list = new ArrayList<>();
						do {
							list.add(getMemberByAll(rs));
						} while (rs.next());
					}
				}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<Member> searchMemberByBirtyday(Member member) {
		String sql = "select mber_id, mber_name, mber_brthdy, mber_zip, mber_bass_ad, mber_detail_ad, mber_tel, mber_img, total_le_cnt, lend_book_cnt, grade, join_dt , wdr_cdt, lend_psb_cdt, od_cnt, mber_img_path from member where date(mber_brthdy) = ?";
	
		List<Member> list = null;
		try (Connection con = JDBCUtil.getConnection();
				PreparedStatement pstmt = con.prepareStatement(sql);){
			pstmt.setString(1, new String(new SimpleDateFormat("yyyy-MM-dd").format(member.getMberBrthdy())));
				try(ResultSet rs = pstmt.executeQuery()){
					if (rs.next()) {
						list = new ArrayList<>();
						do {
							list.add(getMemberByAll(rs));
						} while (rs.next());
					}
				}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;

	}

	@Override
	public Member selectLendingMemberByNo(Member member) {
		return null;
	}

	@Override
	public List<Member> selectMemberByCodeName(Member member) {
		List<Member> list = new ArrayList<>();
		String sql = "select mber_id, mber_name, mber_brthdy, mber_zip, mber_bass_ad, mber_detail_ad, mber_tel, mber_img, total_le_cnt, lend_book_cnt, grade, join_dt , wdr_cdt, lend_psb_cdt, od_cnt, g.book_le_cnt, g.grad_name\r\n" + 
				"from member m left join grade g on m.grade = g.grade_no \r\n" + 
				"where mber_id like ?";
		try (Connection con = JDBCUtil.getConnection();
				PreparedStatement pstmt = con.prepareStatement(sql);){
			pstmt.setString(1, "%" + member.getMberId() + "%" );
				try(ResultSet rs = pstmt.executeQuery()){
					while (rs.next()){
						list.add(getMemberByAll2(rs));
					} 
				}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	private Member getMemberByAll2(ResultSet rs) throws SQLException {
		String mberId = rs.getString("mber_id");
		String mberName = rs.getString("mber_name");
		Date mberBrthdy = rs.getTimestamp("mber_brthdy");
		ZipCode mberZip = new ZipCode(rs.getInt("mber_zip"));
		String mberBassAd = rs.getString("mber_bass_ad");
		String mberDetailAd = rs.getString("mber_detail_ad");
		String mberTel = rs.getString("mber_tel");
		int totalLeCnt = rs.getInt("total_le_cnt");
		int lendBookCnt = rs.getInt("lend_book_cnt");
		Grade grade = new Grade(rs.getInt("grade"), rs.getString("g.grad_name"), rs.getInt("g.book_le_cnt"));
		byte[] mberImg = rs.getBytes("mber_img");
		Date joinDt = rs.getTimestamp("join_dt");
		int wdrCdt = rs.getInt("wdr_cdt");
		int lendPsbCdt = rs.getInt("lend_psb_cdt");
		int odCnt = rs.getInt("od_cnt");
	
		Member mber = new Member(mberId, mberName, mberBrthdy, mberZip, mberBassAd, mberDetailAd, mberTel, mberImg, totalLeCnt, lendBookCnt, grade, lendPsbCdt, joinDt, wdrCdt, odCnt);
		LogUtil.prnLog("getMember => " + mber);
		return mber;
	}

	@Override
	public List<Member> selectMemberByCodeName2(Member member) {
		List<Member> list = new ArrayList<>();
		String sql = "select mber_id, mber_name, mber_brthdy, mber_zip, mber_bass_ad, mber_detail_ad, mber_tel, mber_img, total_le_cnt, lend_book_cnt, grade, join_dt , wdr_cdt, lend_psb_cdt, od_cnt, g.book_le_cnt, g.grad_name\r\n" + 
				"from member m left join grade g on m.grade = g.grade_no \r\n" + 
				"where mber_name like ?";
		try (Connection con = JDBCUtil.getConnection();
				PreparedStatement pstmt = con.prepareStatement(sql);){
			pstmt.setString(1, "%" + member.getMberName() + "%" );
				try(ResultSet rs = pstmt.executeQuery()){
					while (rs.next()){
						list.add(getMemberByAll2(rs));
					} 
				}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public int updateOdCnt(Member member) {
		String sql = "{call return_book_od_cnt(?)}";
		try (Connection con = JDBCUtil.getConnection(); PreparedStatement pstmt = con.prepareCall(sql);) {
			pstmt.setString(1, member.getMberId());
			LogUtil.prnLog(pstmt);
			return pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return 0;
	}

	@Override
	public int selectByOdCnt(Member member) {
		String sql = "insert into member(mber_id, mber_pass,mber_name, mber_brthdy,mber_zip,mber_bass_ad,mber_detail_ad,mber_tel,mber_img, total_le_cnt, lend_book_cnt, grade, lend_psb_cdt, od_cnt, join_dt, wdr_cdt) values(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
		try (Connection con = JDBCUtil.getConnection(); PreparedStatement pstmt = con.prepareStatement(sql)) {
			pstmt.setString(1, member.getMberId());
			pstmt.setString(2, member.getMberPass());
			pstmt.setString(3, member.getMberName());
			pstmt.setTimestamp(4, new Timestamp(member.getMberBrthdy().getTime()));
			pstmt.setInt(5, member.getMberZip().getZipCode());
			pstmt.setString(6, member.getMberBassAd());
			pstmt.setString(7, member.getMberDetailAd());
			pstmt.setString(8, member.getMberTel());
			pstmt.setBytes(9, member.getMberImg());
			pstmt.setInt(10, member.getTotalLeCnt());
			pstmt.setInt(11, member.getLendBookCnt());
			pstmt.setInt(12, member.getGrade().getGradeNo());
			pstmt.setInt(13, member.getLendPsbCdt());
			pstmt.setInt(14, member.getOdCnt());
			pstmt.setTimestamp(15, new Timestamp(member.getJoinDt().getTime()));
			pstmt.setInt(16, member.getWdrCdt());
			return pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return 0;
	}

	@Override
	public Member JSPSelectUpdateMember(Member member) {
		String sql = "select mber_id, mber_pass, mber_name, mber_brthdy, mber_zip, mber_bass_ad, mber_detail_ad, mber_tel, mber_img_path\r\n" + 
				"from member\r\n" + 
				"where mber_id = ? ";
		try (Connection con = JDBCUtil.getConnection(); PreparedStatement pstmt = con.prepareStatement(sql);) {
			pstmt.setString(1, member.getMberId());
			try (ResultSet rs = pstmt.executeQuery()){
				if (rs.next()) {
					return getJSP(rs);
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}

	private Member getJSP(ResultSet rs) throws SQLException {
		String mberId = rs.getString("mber_id");
		String mberPass = rs.getString("mber_pass");
		String mberName = rs.getString("mber_name");
		Date mberBrthdy = rs.getTimestamp("mber_brthdy");
		ZipCode mberZip = new ZipCode(rs.getInt("mber_zip"));
		String mberBassAd = rs.getString("mber_bass_ad");
		String mberDetailAd = rs.getString("mber_detail_ad");
		String mberTel = rs.getString("mber_tel");
		String memberImgPath = rs.getString("mber_img_path");
		Member mber = new Member(mberId, mberPass, mberName, mberBrthdy, mberZip, mberBassAd, mberDetailAd, mberTel);
		mber.setMemberImgPath(memberImgPath);
		return mber;
	}


	public List<Integer> selectMemberCountDate(Date date) {
		List<Integer> list = new ArrayList<>();
		String sql = "select count(*) as 'category_regist_cnt' from member m left join grade g on m.grade = g.grade_no \r\n" + 
				"where m.join_dt between ? and DATE_sub(?, interval -1 year) group by g.grad_name";
		try(Connection con = JDBCUtil.getConnection();
				PreparedStatement pstmt = con.prepareStatement(sql);) {
			pstmt.setTimestamp(1, new Timestamp(date.getTime()));
			pstmt.setTimestamp(2, new Timestamp(date.getTime()));
			System.out.println(pstmt);
			ResultSet rs = pstmt.executeQuery();
			
			while(rs.next()) {
				list.add(getCateCounts2(rs));
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	
	private int getCateCounts2(ResultSet rs) throws SQLException {
		int cate1 = rs.getInt("category_regist_cnt");
		return cate1;
	}
//github.com/jyh0131/bookLib.git

//	public Member selectLendingMemberByNo(Member member) {
////		String sql = "select m.mber_id , m.mber_name , g.grad_name , m.lend_psb_cdt , (g.book_le_cnt - count(l.rturn_date)) as 'lend_book_cnt'\r\n"
////				+ "	from member m left join lending l on m.mber_id = l.mber_id left join grade g on m.grade = g.grade_no \r\n"
////				+ "	where m.mber_id = ? and l.rturn_date = '0000-00-00 00:00:00'";
//		String sql = "select mber_id, mber_pass, mber_name, mber_brthdy, mber_zip,mber_bass_ad,mber_detail_ad,mber_tel,mber_img,total_le_cnt,lend_book_cnt,grade ,lend_psb_cdt ,join_dt ,wdr_cdt ,od_cnt \r\n" + 
//				"	from member\r\n" + 
//				"	where mber_id = ?";
//		try (Connection con = MysqlDataSource.getConnection(); PreparedStatement pstmt = con.prepareStatement(sql);) {
//			pstmt.setString(1, member.getMberId());
//			LogUtil.prnLog(pstmt);
//			try (ResultSet rs = pstmt.executeQuery()) {
//				if (rs.next()) {
//					return getMember(rs, isImg);
//				}
//			}
//		} catch (SQLException e) {
//
//			e.printStackTrace();
//		}
//		return null;
//	}

//	private Member getMember(ResultSet rs) throws SQLException {
//		String mberId = rs.getString("mber_id");
//		String mberName = rs.getString("mber_name");
//		int lendPsbCdt = rs.getInt("lend_psb_cdt");
//		int lendBookCnt = rs.getInt("lend_book_cnt");
////		Grade grade = new Grade();
////		grade.setGradeName(rs.getString("grad_name"));
//		Grade grade = new Grade(rs.getInt("grade"));
//		Member mber = new Member(mberId, mberName, lendBookCnt, grade, lendPsbCdt);
//		LogUtil.prnLog("getMember => " + mber);
//		return mber;
//	}
}
