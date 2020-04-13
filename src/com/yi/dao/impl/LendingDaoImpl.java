package com.yi.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.yi.dao.LendingDao;
import com.yi.jdbc.JDBCUtil;
import com.yi.model.Book;
import com.yi.model.LargeClassification;
import com.yi.model.Lending;
import com.yi.model.Member;
import com.yi.model.MiddleClassification;
import com.yi.model.PublishingCompany;
import com.yi.util.LogUtil;

public class LendingDaoImpl implements LendingDao {
	private static final LendingDaoImpl instance = new LendingDaoImpl();

	public static LendingDaoImpl getInstance() {
		return instance;
	}

	private LendingDaoImpl() {
	};

	@Override
	public Lending selectLendingByNo(int no) {
		String sql = "select lend_rturn_no , mber_id , book_cd , lend_date , rturn_due_date , rturn_psm_cdt , rturn_date , overdue_cdt "
				+ "	from lending " + "	where lend_rturn_no = ? ";
		try (Connection con = JDBCUtil.getConnection(); PreparedStatement pstmt = con.prepareStatement(sql)) {
			pstmt.setInt(1, no);
			LogUtil.prnLog(pstmt);
			try (ResultSet rs = pstmt.executeQuery()) {
				if (rs.next()) {
					return getLending(rs);
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}

	private Lending getLending(ResultSet rs) throws SQLException {
		int lendRturnNo = rs.getInt("lend_rturn_no");
		Member mberId = new Member(rs.getString("mber_id"));
		Book bookCd = new Book(rs.getString("book_cd"));
		Date lendDate = rs.getTimestamp("lend_date");
		Date rturnDueDate = rs.getTimestamp("rturn_due_date");
		int rturnPsmCdt = rs.getInt("rturn_psm_cdt");
		Date rturnDate = rs.getTimestamp("rturn_date");
		int overdueCdt = rs.getInt("overdue_cdt");
		Lending lending = new Lending(lendRturnNo, mberId, bookCd, lendDate, rturnDueDate, rturnPsmCdt, rturnDate,
				overdueCdt);
		LogUtil.prnLog(lending);
		return lending;
	}

	@Override
	public List<Lending> selectLendingByAll() {
		String sql = "select lend_rturn_no , mber_id , book_cd , lend_date , rturn_due_date , rturn_psm_cdt , rturn_date , overdue_cdt "
				+ "	from lending ";
		List<Lending> list = null;
		try (Connection con = JDBCUtil.getConnection();
				PreparedStatement pstmt = con.prepareStatement(sql);
				ResultSet rs = pstmt.executeQuery()) {
			LogUtil.prnLog(pstmt);
			if (rs.next()) {
				list = new ArrayList<>();
				do {
					list.add(getLending(rs));
				} while (rs.next());
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public int insertLending(Lending lending) {
		String sql = "insert into lending(lend_rturn_no , mber_id , book_cd , lend_date , rturn_due_date , rturn_psm_cdt , rturn_date , overdue_cdt) values"
				+ "(?, ?, ?, ?, ?, ?, ?, ?, ?)";
		try (Connection con = JDBCUtil.getConnection(); PreparedStatement pstmt = con.prepareStatement(sql)) {
			pstmt.setInt(1, lending.getLendRturnNo());
			pstmt.setString(2, lending.getMberId().getMberId());
			pstmt.setString(3, lending.getBookCd().getBookCode());
			pstmt.setTimestamp(4, new Timestamp(lending.getLendDate().getTime()));
			pstmt.setTimestamp(5, new Timestamp(lending.getRturnDueDate().getTime()));
			pstmt.setInt(6, lending.getRturnPsmCdt());
			pstmt.setTimestamp(7, new Timestamp(lending.getRturnDate().getTime()));
			pstmt.setInt(8, lending.getOverdueCdt());
			LogUtil.prnLog(pstmt);
			return pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return 0;
	}

	@Override
	public int updateLending(Lending lending) {
		StringBuilder sql = new StringBuilder("update lending set ");

		if (lending.getLendRturnNo() != 0) {
			sql.append("lend_rturn_no = ?, ");
		}
		if (lending.getMberId() != null) {
			sql.append("mber_id = ?, ");
		}
		if (lending.getBookCd() != null) {
			sql.append("book_cd = ?, ");
		}
		if (lending.getLendDate() != null) {
			sql.append("lend_date = ?, ");
		}
		if (lending.getRturnDueDate() != null) {
			sql.append("rturn_due_date = ?, ");
		}
		if (lending.getRturnPsmCdt() != 0) {
			sql.append("rturn_psm_cdt = ?, ");
		}
		if (lending.getRturnDate() != null) {
			sql.append("rturn_date = ?, ");
		}
		if (lending.getOverdueCdt() != 0) {
			sql.append("overdue_cdt = ?, ");
		}
		sql.replace(sql.lastIndexOf(","), sql.length(), " ");
		sql.append("where lend_rturn_no = ?");

		try (Connection con = JDBCUtil.getConnection();
				PreparedStatement pstmt = con.prepareStatement(sql.toString())) {
			int argCnt = 1;

			if (lending.getMberId() != null)
				pstmt.setString(argCnt++, lending.getMberId().getMberId());
			if (lending.getBookCd() != null)
				pstmt.setString(argCnt++, lending.getBookCd().getBookCode());
			if (lending.getLendDate() != null)
				pstmt.setTimestamp(argCnt++, new Timestamp(lending.getLendDate().getTime()));
			if (lending.getRturnDueDate() != null)
				pstmt.setTimestamp(argCnt++, new Timestamp(lending.getRturnDueDate().getTime()));
			if (lending.getRturnPsmCdt() != 0)
				pstmt.setInt(argCnt++, lending.getRturnPsmCdt());
			if (lending.getRturnDate() != null)
				pstmt.setTimestamp(argCnt++, new Timestamp(lending.getRturnDate().getTime()));
			if (lending.getOverdueCdt() != 0)
				pstmt.setInt(argCnt++, lending.getOverdueCdt());

			pstmt.setInt(argCnt++, lending.getLendRturnNo());
			LogUtil.prnLog(pstmt);
			return pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return 0;
	}

	@Override
	public int deleteLending(Lending lending) {
		String sql = "delete from lending where lend_rturn_no = ?";
		try (Connection con = JDBCUtil.getConnection(); PreparedStatement pstmt = con.prepareStatement(sql)) {
			pstmt.setInt(1, lending.getLendRturnNo());
			LogUtil.prnLog(pstmt);
			return pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return 0;
	}

	@Override
	public List<Lending> selectLendingByMberIdAndLendBookTotalAll(Lending lending) {
		String sql = "select l.lend_rturn_no, l.mber_id , b.book_code, b.book_name , b.authr_name , b.trnslr_name, b.lc_no , lc.lclas_name , b.ml_no , ml.mlsfc_name , \r\n"
				+ "	   b.pls, pls.pls_name , b.pblicte_year , lend_date , rturn_due_date, rturn_psm_cdt, rturn_date, overdue_cdt \r\n"
				+ "	from lending l left join book b on l.book_cd = b.book_code \r\n"
				+ "				   left join large_classification lc on lc.lclas_no = b.lc_no \r\n"
				+ "				   left join middle_classification ml on ml.mlsfc_no = b.ml_no and lc.lclas_no = ml.lclas_no \r\n"
				+ "				   left join publishing_company pls on pls.pls_no = b.pls \r\n" 
				+ "	where mber_id = ? " 
				+ " order by lend_date desc";

		List<Lending> list = null;

		try (Connection con = JDBCUtil.getConnection(); PreparedStatement pstmt = con.prepareStatement(sql)) {
			pstmt.setString(1, lending.getMberId().getMberId());
			LogUtil.prnLog(pstmt);
			try (ResultSet rs = pstmt.executeQuery()) {
				if (rs.next()) {
					list = new ArrayList<Lending>();
					do {
						list.add(getUseJoinLendgin(rs));
					} while (rs.next());
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return list;
	}

	@Override
	public List<Lending> selectLendingByMberIdAndLendBookAll(Lending lending) {
		String sql = "select l.lend_rturn_no, l.mber_id , b.book_code, b.book_name , b.authr_name , b.trnslr_name, b.lc_no , lc.lclas_name , b.ml_no , ml.mlsfc_name , \r\n"
				+ "	   b.pls, pls.pls_name , b.pblicte_year , lend_date , rturn_due_date, rturn_psm_cdt, rturn_date, overdue_cdt \r\n"
				+ "	from lending l left join book b on l.book_cd = b.book_code \r\n"
				+ "				   left join large_classification lc on lc.lclas_no = b.lc_no \r\n"
				+ "				   left join middle_classification ml on ml.mlsfc_no = b.ml_no and lc.lclas_no = ml.lclas_no \r\n"
				+ "				   left join publishing_company pls on pls.pls_no = b.pls \r\n"
				+ "	where mber_id = ? and rturn_date is null "
				+ " order by lend_date desc";

		List<Lending> list = null;

		try (Connection con = JDBCUtil.getConnection(); PreparedStatement pstmt = con.prepareStatement(sql)) {
			pstmt.setString(1, lending.getMberId().getMberId());
			LogUtil.prnLog(pstmt);
			try (ResultSet rs = pstmt.executeQuery()) {
				if (rs.next()) {
					list = new ArrayList<Lending>();
					do {
						list.add(getUseJoinLendgin(rs));
					} while (rs.next());
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return list;
	}

	@Override
	public List<Lending> selectLendingByMberIdAll(Member member) {
		String sql = "select lend_rturn_no, mber_id ,book_cd , lend_date ,rturn_due_date , rturn_psm_cdt , rturn_date , overdue_cdt \r\n"
				+ "	from lending\r\n" + "	where mber_id = ? and rturn_date is null;";

		List<Lending> list = null;

		try (Connection con = JDBCUtil.getConnection(); PreparedStatement pstmt = con.prepareStatement(sql)) {
			pstmt.setString(1, member.getMberId());
			LogUtil.prnLog(pstmt);
			try (ResultSet rs = pstmt.executeQuery()) {
				if (rs.next()) {
					list = new ArrayList<Lending>();
					do {
						list.add(getUseJoinLendgin2(rs));
					} while (rs.next());
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return list;
	}

	private Lending getUseJoinLendgin(ResultSet rs) throws SQLException {
		int lendRturnNo = rs.getInt("l.lend_rturn_no");
		Member mberId = new Member(rs.getString("l.mber_id"));
		Book bookCd = new Book(rs.getString("b.book_code"));
		bookCd.setBookName(rs.getString("b.book_name"));
		bookCd.setAuthrName(rs.getString("b.authr_name"));
		bookCd.setTrnslrName(rs.getString("b.trnslr_name"));
		bookCd.setLcNo(new LargeClassification(rs.getInt("b.lc_no"), rs.getString("lc.lclas_name")));
		bookCd.setMlNo(new MiddleClassification(new LargeClassification(rs.getInt("b.lc_no")), rs.getInt("b.ml_no"),
				rs.getString("ml.mlsfc_name")));
		bookCd.setPls(new PublishingCompany(rs.getInt("b.pls"), rs.getString("pls.pls_name")));
		bookCd.setPblicteYear(rs.getTimestamp("b.pblicte_year"));
		Date lendDate = rs.getTimestamp("lend_date");
		Date rturnDueDate = rs.getTimestamp("rturn_due_date");
		int rturnPsmCdt = rs.getInt("rturn_psm_cdt");
		Date rturnDate = rs.getTimestamp("rturn_date");;
		int overdueCdt = rs.getInt("overdue_cdt");

		return new Lending(lendRturnNo, mberId, bookCd, lendDate, rturnDueDate, rturnPsmCdt, rturnDate, overdueCdt);
	}

	private Lending getUseJoinLendgin2(ResultSet rs) throws SQLException {
		Member mberId = new Member(rs.getString("mber_id"));
		Book bookCd = new Book(rs.getString("book_cd"));
		Date lendDate = rs.getTimestamp("lend_date");
		Date rturnDueDate = rs.getTimestamp("rturn_due_date");
		int rturnPsmCdt = rs.getInt("rturn_psm_cdt");
		Date rturnDate = rs.getTimestamp("rturn_date");
		int overdueCdt = rs.getInt("overdue_cdt");

		return new Lending(mberId, bookCd, lendDate, rturnDueDate, rturnPsmCdt, rturnDate, overdueCdt);
	}

	@Override
	public int getLendBookCnt(Lending lending) {
		String sql = "select count(*) from lending where mber_id = ? and rturn_date is null";
		try (Connection con = JDBCUtil.getConnection(); PreparedStatement pstmt = con.prepareStatement(sql)) {
			pstmt.setString(1, lending.getMberId().getMberId());
			LogUtil.prnLog(pstmt);
			try (ResultSet rs = pstmt.executeQuery()) {
				if (rs.next()) {
					return rs.getInt("count(*)");
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return 0;
	}

	@Override
	public int getLendBookTotalCnt(Lending lending) {
		String sql = "select count(*) from lending where mber_id = ? ";
		try (Connection con = JDBCUtil.getConnection(); PreparedStatement pstmt = con.prepareStatement(sql)) {
			pstmt.setString(1, lending.getMberId().getMberId());
			LogUtil.prnLog(pstmt);
			try (ResultSet rs = pstmt.executeQuery()) {
				if (rs.next()) {
					return rs.getInt("count(*)");
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return 0;
	}

	@Override
	public List<Lending> selectLendingByAllTest() {
		String sql = "select b.book_code,b.book_name,b.authr_name,b.pblicte_year,p.pls_name,l.lend_date,l.rturn_date from lending l left join book b on l.book_cd = b.book_code left join publishing_company p on b.pls = p.pls_no";
		List<Lending> list = null;
		try (Connection con = JDBCUtil.getConnection();
				PreparedStatement pstmt = con.prepareStatement(sql);
				ResultSet rs = pstmt.executeQuery()) {
			LogUtil.prnLog(pstmt);
			if (rs.next()) {
				list = new ArrayList<>();
				do {
					list.add(getLendingByAllTest(rs));
				} while (rs.next());
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<Lending> selectLendingByMberId(Member member) {
		String sql = "select book_code, book_name, authr_name, trnslr_name, pls, pls_name, pblicte_year, book_price,b.lend_psb_cdt , b.total_le_cnt, book_img, lc_no, ml_no, lend_date, rturn_date, rturn_due_date, od_cnt \r\n"
				+ "	from lending l left join book b on l.book_cd = b.book_code left join publishing_company p on b.pls = p.pls_no left join member m on l.mber_id = m.mber_id \r\n"
				+ "	where l.mber_id = ? and rturn_date is null";
		List<Lending> list = null;

		try (Connection con = JDBCUtil.getConnection(); PreparedStatement pstmt = con.prepareStatement(sql)) {
			pstmt.setString(1, member.getMberId());
			LogUtil.prnLog(pstmt);
			try (ResultSet rs = pstmt.executeQuery()) {
				if (rs.next()) {
					list = new ArrayList<Lending>();
					do {
						list.add(getLendingByAllTest2(rs));
					} while (rs.next());
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<Lending> selectLendingByMberIdChecking() {
		return null;
	}

	private Lending getLendingByAllTest(ResultSet rs) throws SQLException {
		Lending lending = new Lending();
		Book book = new Book(rs.getString("b.book_code"));
		book.setBookName(rs.getString("b.book_name"));
		book.setAuthrName(rs.getString("b.authr_name"));
		book.setPblicteYear(rs.getTimestamp("b.pblicte_year"));
		PublishingCompany pCompany = new PublishingCompany(rs.getString("p.pls_name"));
		book.setPls(pCompany);
		lending.setBookCd(book);
		lending.setLendDate(rs.getTimestamp("l.lend_date"));
		lending.setRturnDate(rs.getTimestamp("l.rturn_date"));
		return lending;
	}

	private Lending getLendingByAllTest2(ResultSet rs) throws SQLException {
		Lending lending = new Lending();
		StringBuilder sb = new StringBuilder();

		Book book = new Book(rs.getString("book_code"));
		book.setBookName(rs.getString("book_name"));
		if (rs.getString("trnslr_name") == null) {
			sb.append(rs.getString("authr_name"));
		} else {
			sb.append(rs.getString("authr_name"));
			sb.append("/");
			sb.append(rs.getString("trnslr_name"));
		}
		book.setAuthrName(sb.toString());
		book.setPblicteYear(rs.getTimestamp("pblicte_year"));
		PublishingCompany pCompany = new PublishingCompany(rs.getString("pls_name"));
		book.setPls(pCompany);
		lending.setBookCd(book);
		lending.setLendDate(rs.getTimestamp("lend_date"));
		lending.setRturnDueDate(rs.getTimestamp("rturn_due_date"));
		return lending;
	}

	@Override
	public List<Lending> selectLendingByMberIdAll(Lending lending) {
		String sql = "select lend_rturn_no, mber_id ,book_cd , lend_date ,rturn_due_date , rturn_psm_cdt , rturn_date , overdue_cdt \r\n"
				+ "	from lending\r\n" + "	where mber_id = ? and rturn_date is null;";

		List<Lending> list = null;

		try (Connection con = JDBCUtil.getConnection(); PreparedStatement pstmt = con.prepareStatement(sql)) {
			pstmt.setString(1, lending.getMberId().getMberId());
			LogUtil.prnLog(pstmt);
			try (ResultSet rs = pstmt.executeQuery()) {
				if (rs.next()) {
					list = new ArrayList<Lending>();
					do {
						list.add(getUseJoinLendgin(rs));
					} while (rs.next());
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return list;
	}

//	@Override
//	public List<Lending> showMemberRentalList(Member mem) {
//		// TODO Auto-generated method stub
//		return null;
//	}
//
//	@Override
//	public List<Lending> showMemberReturnList(Member mem) {
//		// TODO Auto-generated method stub
//		return null;
//	}
//
//	@Override
//	public List<Lending> selectLendingByOverDueCdt() {
//		// TODO Auto-generated method stub
//		return null;
//	}

	@Override
	public int selectAvgRendDate() {
		String sql = "select avg(date(rturn_date)-date(lend_date)) as 'avgLendDate' from lending";
		try (Connection con = JDBCUtil.getConnection();
				PreparedStatement pstmt = con.prepareStatement(sql);
				ResultSet rs = pstmt.executeQuery()) {
			while (rs.next()) {
				return rs.getInt("avgLendDate");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return 0;
	}

	@Override
	public int updateLendingByCodeAndMberId(Lending lending) {
		String sql = "update lending  set rturn_psm_cdt = ?, rturn_due_date = ? where book_cd = ? and mber_id = ? and rturn_date is null";

		try (Connection con = JDBCUtil.getConnection(); PreparedStatement pstmt = con.prepareStatement(sql)) {
			pstmt.setInt(1, lending.getRturnPsmCdt());
			pstmt.setTimestamp(2, new Timestamp(lending.getRturnDueDate().getTime()));
			pstmt.setString(3, lending.getBookCd().getBookCode());
			pstmt.setString(4, lending.getMberId().getMberId());
			LogUtil.prnLog(pstmt);
			return pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return 0;
	}

	@Override
	public Book showLendingByBookCode(Book book) {
		String sql = "select book_code ,book_name ,authr_name ,trnslr_name , pls, pblicte_year ,book_price ,lend_psb_cdt ,total_le_cnt ,book_img , lc_no , ml_no , regist_date , dsuse_cdt \r\n"
				+ "	from book\r\n" + "	where book_code = ?";
		try (Connection con = JDBCUtil.getConnection(); PreparedStatement pstmt = con.prepareStatement(sql)) {
			pstmt.setString(1, book.getBookCode());
			LogUtil.prnLog(pstmt);
			try (ResultSet rs = pstmt.executeQuery()) {
				if (rs.next()) {
					return getBook(rs);
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}

	private Book getBook(ResultSet rs) throws SQLException {
		String bookCode = rs.getString("book_code");
		String bookName = rs.getString("book_name");
		String authrName = String.format("%s", rs.getString("authr_name"), rs.getString("trnslr_name"));
		PublishingCompany pls = new PublishingCompany(rs.getInt("pls"));
		pls.getPlsName();
		Date pblicteYear = rs.getTimestamp("pblicte_year");// rs.getDate()로 작성시 시간표시가 00:00:00으로 세팅됨.
		Book book = new Book(bookCode, bookName, authrName, pls, pblicteYear);
		LogUtil.prnLog(book);
		return book;
	}

	public List<Lending> showLendingListByOverdue() {
		List<Lending> list = new ArrayList<>();
		String sql = "select b.book_code,b.book_name,m.mber_id,m.mber_name,l.lend_date,l.rturn_due_date , count(m.mber_id) \r\n"
				+ "	from lending l left join book b on l.book_cd = b.book_code left join member m on l.mber_id = m.mber_id \r\n"
				+ "	where date(now()) >= date(rturn_due_date) and l.rturn_date is null\r\n" + "	group by m.mber_id ;";
		try (Connection con = JDBCUtil.getConnection();
				PreparedStatement pstmt = con.prepareStatement(sql);
				ResultSet rs = pstmt.executeQuery(sql)) {
			while (rs.next()) {
				LogUtil.prnLog(getLendingByOverdue(rs));
				list.add(getLendingByOverdue(rs));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}

	private Lending getLendingByOverdue(ResultSet rs) throws SQLException {
		Member mberId = new Member(rs.getString("mber_id"));
		mberId.setMberName(rs.getString("mber_name"));
		Book bookCd = new Book(rs.getString("book_code"));
		bookCd.setBookName(rs.getString("book_name"));
		Date lendDate = rs.getTimestamp("lend_date");
		Date rturnDueDate = rs.getTimestamp("rturn_due_date");
		int overdueBookCnt = rs.getInt("count(m.mber_id)");
		return new Lending(mberId, bookCd, lendDate, rturnDueDate, overdueBookCnt);
	}

	@Override
	public List<Lending> selectLendingBastList(int cnt) {
		String sql = "select l1.book_cd , b.book_name, b.book_img_path , b.authr_name , b.trnslr_name , b.lc_no , lc.lclas_name , b.ml_no , ml.mlsfc_name , \r\n" + 
				"		b.pls , p.pls_name ,l2.totlaCnt, b2.book_cnt , b.pblicte_year \r\n" + 
				"	from lending l1 left join book b on l1.book_cd = b.book_code \r\n" + 
				"					left join large_classification lc on b.lc_no = lc.lclas_no \r\n" + 
				"					left join middle_classification ml on b.ml_no = ml.mlsfc_no and lc.lclas_no = ml.lclas_no\r\n" + 
				"					left join publishing_company p on b.pls = p.pls_no ,\r\n" + 
				"					(select book_cd , count(*) as totlaCnt from lending group by book_cd) l2,\r\n" + 
				"					(select book_name, authr_name , pls, pblicte_year , book_price , count(*) as book_cnt from book group by book_name, authr_name , pls, pblicte_year , book_price) b2\r\n" + 
				"	where l1.book_cd = l2.book_cd and b.book_name = b2.book_name and b.authr_name = b2.authr_name and b.pls = b2.pls and b.pblicte_year = b2.pblicte_year and \r\n" + 
				"			b.book_price = b2.book_price\r\n" + 
				"	group by l1.book_cd\r\n" + 
				"	order by l2.totlaCnt desc limit ?";
		List<Lending> list = null;
		try (Connection con = JDBCUtil.getConnection();
				PreparedStatement pstmt = con.prepareStatement(sql);) {
			pstmt.setInt(1, cnt);
			LogUtil.prnLog(pstmt);
			try(ResultSet rs = pstmt.executeQuery()){
				if (rs.next()) {
					list = new ArrayList<>();
					do {
						list.add(getBastList(rs));
					} while (rs.next());
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}

	private Lending getBastList(ResultSet rs) throws SQLException {
		Book bookCd = new Book();
		bookCd.setBookCode(rs.getString("l1.book_cd"));
		bookCd.setBookName(rs.getString("b.book_name"));
		bookCd.setBookImgPath(rs.getString("b.book_img_path"));
		bookCd.setAuthrName(rs.getString("b.authr_name"));
		bookCd.setTrnslrName(rs.getString("b.trnslr_name"));
		bookCd.setLcNo(new LargeClassification(rs.getInt("b.lc_no"), rs.getString("lc.lclas_name")));
		bookCd.setMlNo(new MiddleClassification(new LargeClassification(rs.getInt("b.lc_no")), rs.getInt("b.ml_no"),
				rs.getString("ml.mlsfc_name")));
		bookCd.setPls(new PublishingCompany(rs.getInt("b.pls"), rs.getString("p.pls_name")));
		bookCd.setBookCnt(rs.getInt("b2.book_cnt"));
		bookCd.setPblicteYear(rs.getTimestamp("b.pblicte_year"));
		return new Lending(bookCd);
	}

	@Override
	public int insertLendingUpdateBookMember(Member member, Book book) {
		String sql = "{call rent_book(?, ?)}";
		try (Connection con = JDBCUtil.getConnection(); PreparedStatement pstmt = con.prepareCall(sql);) {
			pstmt.setString(1, member.getMberId());
			pstmt.setString(2, book.getBookCode());
			LogUtil.prnLog(pstmt);
			return pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return 0;
	}

	@Override
	public int updateLendingBookMember(Member member, Book book) {
		String sql = "{call return_book(?, ?)}";
//		String sql = "{call update_lending_return_date_overdue_cdt(?, ?)}";
		try (Connection con = JDBCUtil.getConnection(); PreparedStatement pstmt = con.prepareCall(sql);) {
			pstmt.setString(1, member.getMberId());
			pstmt.setString(2, book.getBookCode());
			LogUtil.prnLog(pstmt);
			return pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return 0;
	}

	@Override
	public int updateMemberOdcnt(Member m) throws SQLException {
		String sql = "update member set od_cnt = ? where mber_id = ?";
		try (Connection con = JDBCUtil.getConnection(); PreparedStatement pstmt = con.prepareStatement(sql)) {
			pstmt.setInt(1, m.getOdCnt());
			pstmt.setString(2, m.getMberId());
			return pstmt.executeUpdate();
		}
	}

	public int selectLendingByMemberReturnNullCount(Member member) {
		List<Lending> list = new ArrayList<>();
		String sql = "select * from lending where mber_id = ? and rturn_date is null";
		try (Connection con = JDBCUtil.getConnection(); PreparedStatement pstmt = con.prepareStatement(sql)) {
			pstmt.setString(1, member.getMberId());
			try (ResultSet rs = pstmt.executeQuery()) {
				while (rs.next()) {
					list.add(getLending(rs));
				}
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list.size();
	}

	@Override
	public int updateLendingBookMember(Member member) {
		String sql = "{call update_lending_lend_psb_cdt_lend_book_cnt_book_lend_psb_cdt(?)}";
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
	public int showAtoBLendingCnt(Date date) {		
		String sql = "select count(*) as 'LendCntXBooks' from lending where lend_date between date(?) and DATE(DATE_sub(?, interval -1 month))";
		try (Connection con = JDBCUtil.getConnection(); PreparedStatement pstmt = con.prepareStatement(sql);)
				{
			System.out.println(pstmt.toString());
			pstmt.setTimestamp(1, new Timestamp(date.getTime()));
			pstmt.setTimestamp(2, new Timestamp(date.getTime()));
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				return rs.getInt("LendCntXBooks");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return 0;
	}

	@Override
	public int showOverdueBooCntMonth(Date date) {
		String sql = "select count(*) as 'LendCntXBooks' from lending where overdue_cdt = 1 and rturn_date between ? and DATE_sub(?, interval -1 month)";
		try (Connection con = JDBCUtil.getConnection(); PreparedStatement pstmt = con.prepareStatement(sql);) {
			pstmt.setTimestamp(1, new Timestamp(date.getTime()));
			pstmt.setTimestamp(2, new Timestamp(date.getTime()));
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				return rs.getInt("LendCntXBooks");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return 0;
	}

	@Override
	public int showOverdueBooCntYear(Date date) {
		String sql = "select count(*) as 'LendCntXBooks' from lending where overdue_cdt = 1 and lend_date between ? and DATE_sub(?, interval -1 year)";
		try (Connection con = JDBCUtil.getConnection(); PreparedStatement pstmt = con.prepareStatement(sql);) {
			pstmt.setTimestamp(1, new Timestamp(date.getTime()));
			pstmt.setTimestamp(2, new Timestamp(date.getTime()));
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				return rs.getInt("LendCntXBooks");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return 0;
	}

	@Override
	public Date selectRturnDueDateByBookCode(String code) {
		String sql = "select rturn_due_date from lending where book_cd = ? and rturn_date is null";
		try (Connection con = JDBCUtil.getConnection();
				PreparedStatement pstmt = con.prepareStatement(sql)){
			pstmt.setString(1, code);
			try(ResultSet rs = pstmt.executeQuery()){
				if(rs.next()) {
					return rs.getTimestamp("rturn_due_date");
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}


}
