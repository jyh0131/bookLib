package com.yi.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.yi.dao.BookDao;
import com.yi.jdbc.JDBCUtil;
import com.yi.model.Book;
import com.yi.model.LargeClassification;
import com.yi.model.MiddleClassification;
import com.yi.model.PublishingCompany;
import com.yi.util.LogUtil;

public class BookDaoImpl implements BookDao {
	private static final BookDaoImpl instance = new BookDaoImpl();

	public static BookDaoImpl getInstance() {
		return instance;
	}

	private BookDaoImpl() {
	}

//	private Book getBook(ResultSet rs) throws SQLException {
//		String bookCode = rs.getString("b1.book_code");
//		String bookName = rs.getString("b1.book_name");
//		String authrName = rs.getString("b1.authr_name");
//		String trnslrName = rs.getString("b1.trnslr_name");
//		PublishingCompany pls = new PublishingCompany(rs.getInt("b1.pls"), rs.getString("p.pls_name"));
//		Date pblicteYear = rs.getTimestamp("b1.pblicte_year");
//		int bookPrice = rs.getInt("b1.book_price");
//		int bookCnt = rs.getInt("b2.book_cnt");
//		int lendPsbCdt = rs.getInt("b1.lend_psb_cdt");
//		int totalLeCnt = rs.getInt("b1.total_le_cnt");
//		byte[] bookImg = rs.getBytes("b1.book_img");
//		LargeClassification lcNo = new LargeClassification(rs.getInt("b1.lc_no"), rs.getString("l.lclas_name"));
//		MiddleClassification mlNo = new MiddleClassification(rs.getInt("b1.ml_no"), rs.getString("m.mlsfc_name"));
//		Date registDate = rs.getTimestamp("b1.regist_date");
//		int dsuseCdt = rs.getInt("b1.dsuse_cdt");
//
//		Book book = new Book(bookCode, bookName, authrName, trnslrName, pls, pblicteYear, bookPrice, bookCnt,
//				lendPsbCdt, totalLeCnt, bookImg, lcNo, mlNo, registDate, dsuseCdt);
//		
//		book.setBookImgPath(rs.getString("b1.book_img_path"));
//
//		return book;
//	}
	
	private Book getBookVw(ResultSet rs) throws SQLException {
		String bookCode = rs.getString("book_code");
		String bookName = rs.getString("book_name");
		String authrName = rs.getString("authr_name");
		String trnslrName = rs.getString("trnslr_name");
		PublishingCompany pls = new PublishingCompany(rs.getInt("pls"), rs.getString("pls_name"));
		Date pblicteYear = rs.getTimestamp("pblicte_year");
		int bookPrice = rs.getInt("book_price");
		int bookCnt = rs.getInt("book_cnt");
		int lendPsbCdt = rs.getInt("lend_psb_cdt");
		int totalLeCnt = rs.getInt("total_le_cnt");
		byte[] bookImg = rs.getBytes("book_img");
		LargeClassification lcNo = new LargeClassification(rs.getInt("lc_no"), rs.getString("lclas_name"));
		MiddleClassification mlNo = new MiddleClassification(rs.getInt("ml_no"), rs.getString("mlsfc_name"));
		Date registDate = rs.getTimestamp("regist_date");
		int dsuseCdt = rs.getInt("dsuse_cdt");

		Book book = new Book(bookCode, bookName, authrName, trnslrName, pls, pblicteYear, bookPrice, bookCnt,
				lendPsbCdt, totalLeCnt, bookImg, lcNo, mlNo, registDate, dsuseCdt);
		
		book.setBookImgPath(rs.getString("book_img_path"));

		return book;
	}

	@Override
	public Book selectBookByCode(Book book) {
		StringBuilder sql = new StringBuilder("select * from vw_book "); 
		sql.append("where book_code = ? ");
		sql.append("order by book_code ");
		
		System.out.println("sql : " + sql);
	
		try (Connection con = JDBCUtil.getConnection(); 
				PreparedStatement pstmt = con.prepareStatement(sql.toString());) {
			pstmt.setString(1, book.getBookCode());
			LogUtil.prnLog(pstmt);
			try (ResultSet rs = pstmt.executeQuery()) {
				if (rs.next()) {
					return getBookVw(rs);
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public List<Book> selectBookByAll() {
		String sql = "select * from vw_book ";
		List<Book> list = null;
		try (Connection con = JDBCUtil.getConnection();
				PreparedStatement pstmt = con.prepareStatement(sql);
				ResultSet rs = pstmt.executeQuery()) {
			LogUtil.prnLog(pstmt);
			if (rs.next()) {
				list = new ArrayList<>();
				do {
					list.add(getBookVw(rs));
				} while (rs.next());
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<Book> selectBookByCodeAndCat(Book book) {
		StringBuilder sql = new StringBuilder("select * from vw_book "); 
		StringBuilder where = new StringBuilder("where ");
		if (book.getBookCode() != null)
			where.append("book_code like ? and ");
		if (book.getLcNo() != null) {
			where.append("lc_no = ? and ");
		}
		
		where.replace(where.lastIndexOf("and"), where.length(), " ");
		
		sql.append(where);
		sql.append("order by book_code");

		List<Book> list = null;

		try (Connection con = JDBCUtil.getConnection();
				PreparedStatement pstmt = con.prepareStatement(sql.toString())) {
			int argCnt = 1;
			if (book.getBookCode() != null)
				pstmt.setString(argCnt++, book.getBookCode() + "%");
			if (book.getLcNo() != null)
				pstmt.setInt(argCnt++, book.getLcNo().getLclasNo());
			LogUtil.prnLog(pstmt);
			try (ResultSet rs = pstmt.executeQuery()) {
				if (rs.next()) {
					list = new ArrayList<>();
					do {
						list.add(getBookVw(rs));
					} while (rs.next());
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<Book> selectBookByNameAndCat(Book book) {
		StringBuilder sql = new StringBuilder("select * from vw_book "); 
		StringBuilder where = new StringBuilder("where ");
		if (book.getBookName() != null)
			where.append("book_name like ? and ");
		if (book.getLcNo() != null) {
			where.append("lc_no = ? and ");
		}
		where.replace(where.lastIndexOf("and"), where.length(), " ");
		
		sql.append(where);
		sql.append("order by book_code");

		List<Book> list = null;

		try (Connection con = JDBCUtil.getConnection();
				PreparedStatement pstmt = con.prepareStatement(sql.toString())) {
			int argCnt = 1;
			if (book.getBookName() != null)
				pstmt.setString(argCnt++, "%" + book.getBookName() + "%");
			if (book.getLcNo() != null)
				pstmt.setInt(argCnt++, book.getLcNo().getLclasNo());
			LogUtil.prnLog(pstmt);

			try (ResultSet rs = pstmt.executeQuery()) {
				if (rs.next()) {
					list = new ArrayList<>();
					do {
						list.add(getBookVw(rs));
					} while (rs.next());
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<Book> selectBookOnMber(Book book) {
		StringBuilder sql = new StringBuilder("select * from vw_book "); 
		StringBuilder where = new StringBuilder("where ");
		if (book.getBookName() != null)
			where.append("book_name like ? and ");
		if (book.getAuthrName() != null) 
			where.append("authr_name like ? and ");
		if (book.getLcNo() != null) 
			where.append("lc_no = ? and ");
		where.replace(where.lastIndexOf("and"), where.length(), " ");
		
		sql.append(where);
		sql.append("order by book_code");

		List<Book> list = null;

		try (Connection con = JDBCUtil.getConnection();
				PreparedStatement pstmt = con.prepareStatement(sql.toString())) {
			int argCnt = 1;
			if (book.getBookName() != null)
				pstmt.setString(argCnt++, "%" + book.getBookName() + "%");
			if (book.getAuthrName() != null)
				pstmt.setString(argCnt++, book.getAuthrName() + "%");
			if (book.getLcNo() != null)
				pstmt.setInt(argCnt++, book.getLcNo().getLclasNo());
			LogUtil.prnLog(pstmt);

			try (ResultSet rs = pstmt.executeQuery()) {
				if (rs.next()) {
					list = new ArrayList<>();
					do {
						list.add(getBookVw(rs));
					} while (rs.next());
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	
	@Override
	public List<Book> selectBookAllOnMber() {
		String sql = "select * from vw_book ";

		List<Book> list = null;

		try (Connection con = JDBCUtil.getConnection();
				PreparedStatement pstmt = con.prepareStatement(sql);
				ResultSet rs = pstmt.executeQuery()) {
			LogUtil.prnLog(pstmt);
			if (rs.next()) {
				list = new ArrayList<>();
				do {
					list.add(getBookVw(rs));
				} while (rs.next());
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public String selectBookByOverlapBookLastCode(String bName, String aName, int pls) {
		String sql = "select book_code from book where book_name = ? and authr_name = ? and pls = ? order by regist_date desc limit 1 ";
		try (Connection con = JDBCUtil.getConnection();
				PreparedStatement pstmt = con.prepareStatement(sql)) {
			pstmt.setString(1, bName);
			pstmt.setString(2, aName);
			pstmt.setInt(3, pls);
			LogUtil.prnLog(pstmt);
			try(ResultSet rs = pstmt.executeQuery()) {
				if(rs.next()) {
					return rs.getString("book_code");
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	@Override
	public String selectBookByCatLastCode(int lcNo, int mlNo) {
		String sql = "select book_code from book where lc_no = ? and ml_no = ? order by book_code desc limit 1;";
		try (Connection con = JDBCUtil.getConnection();
				PreparedStatement pstmt = con.prepareStatement(sql)) {
			pstmt.setInt(1, lcNo);
			pstmt.setInt(2, mlNo);
			LogUtil.prnLog(pstmt);
			try(ResultSet rs = pstmt.executeQuery()){				
				if (rs.next()) {
					return rs.getString("book_code");
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public int insertBook(Book book) {
		String sql = "insert into book(book_code , book_name , authr_name , trnslr_name , pls , "
				+ "	pblicte_year , book_price , lend_psb_cdt , total_le_cnt , "
				+ "	lc_no , ml_no , regist_date , dsuse_cdt, book_img_path ) values"
				+ "(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
		try (Connection con = JDBCUtil.getConnection(); PreparedStatement pstmt = con.prepareStatement(sql)) {
			pstmt.setString(1, book.getBookCode());
			pstmt.setString(2, book.getBookName());
			pstmt.setString(3, book.getAuthrName());
			pstmt.setString(4, book.getTrnslrName());
			pstmt.setInt(5, book.getPls().getPlsNo());
			pstmt.setTimestamp(6, new Timestamp(book.getPblicteYear().getTime()));
			pstmt.setInt(7, book.getBookPrice());
			pstmt.setInt(8, book.getLendPsbCdt());
			pstmt.setInt(9, book.getTotalLeCnt());
			pstmt.setInt(10, book.getLcNo().getLclasNo());
			pstmt.setInt(11, book.getMlNo().getMlsfcNo());
			pstmt.setTimestamp(12, new Timestamp(book.getRegistDate().getTime()));
			pstmt.setInt(13, book.getDsuseCdt());
			pstmt.setString(14, book.getBookImgPath());
			LogUtil.prnLog(pstmt);
			return pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return 0;
	}

	@Override
	public int updateBook(Book book) {
		StringBuilder sql = new StringBuilder("update book set ");
		if (book.getBookName() != null) sql.append("book_name = ?, ");
		if (book.getAuthrName() != null) sql.append("authr_name = ?, ");
		if (book.getTrnslrName() != null) sql.append("trnslr_name = ?, ");
		if (book.getPls() != null) sql.append("pls = ?, ");
		if (book.getPblicteYear() != null) sql.append("pblicte_year = ?, ");
		if (book.getBookPrice() != -1) sql.append("book_price = ?, ");
		if (book.getLendPsbCdt() != -1) sql.append("lend_psb_cdt = ?, ");
		if (book.getTotalLeCnt() != -1) sql.append("total_le_cnt = ?, ");
		if (book.getBookImg() != null) sql.append("book_img = ?, ");
		if (book.getLcNo() != null) sql.append("lc_no = ?, ");
		if (book.getMlNo() != null) sql.append("ml_no = ?, ");
		if (book.getRegistDate() != null) sql.append("regist_date = ?, ");
		if (book.getDsuseCdt() != -1) sql.append("dsuse_cdt = ?, ");
		if (book.getBookImgPath() != null) sql.append("book_img_path = ?, ");
		sql.replace(sql.lastIndexOf(","), sql.length(), " ");
		sql.append("where book_code = ?");

		try (Connection con = JDBCUtil.getConnection();
				PreparedStatement pstmt = con.prepareStatement(sql.toString())) {
			int argCnt = 1;
			if (book.getBookName() != null) pstmt.setString(argCnt++, book.getBookName());
			if (book.getAuthrName() != null) pstmt.setString(argCnt++, book.getAuthrName());
			if (book.getTrnslrName() != null) pstmt.setString(argCnt++, book.getTrnslrName());
			if (book.getPls() != null) pstmt.setInt(argCnt++, book.getPls().getPlsNo());
			if (book.getPblicteYear() != null) pstmt.setTimestamp(argCnt++, new Timestamp(book.getPblicteYear().getTime()));
			if (book.getBookPrice() != -1) pstmt.setInt(argCnt++, book.getBookPrice());
			if (book.getLendPsbCdt() != -1) pstmt.setInt(argCnt++, book.getLendPsbCdt());
			if (book.getTotalLeCnt() != -1) pstmt.setInt(argCnt++, book.getTotalLeCnt());
			if (book.getBookImg() != null) pstmt.setBytes(argCnt++, book.getBookImg());
			if (book.getLcNo() != null) pstmt.setInt(argCnt++, book.getLcNo().getLclasNo());
			if (book.getMlNo() != null) pstmt.setInt(argCnt++, book.getMlNo().getMlsfcNo());
			if (book.getRegistDate() != null) pstmt.setTimestamp(argCnt++, new Timestamp(book.getRegistDate().getTime()));
			if (book.getDsuseCdt() != -1) pstmt.setInt(argCnt++, book.getDsuseCdt());
			if (book.getBookImgPath() != null) pstmt.setString(argCnt++, book.getBookImgPath());
			pstmt.setString(argCnt++, book.getBookCode());
			LogUtil.prnLog(pstmt);
			return pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return 0;
	}

	@Override
	public int deleteBook(Book book) {
		String sql = "delete from book where book_code = ?";
		try (Connection con = JDBCUtil.getConnection(); PreparedStatement pstmt = con.prepareStatement(sql)) {
			pstmt.setString(1, book.getBookCode());
			LogUtil.prnLog(pstmt);
			return pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return 0;
	}

	@Override
	public int selectLendableBooks() {
		String sql = "select count(book_code) as 'lendableBooks' from book where lend_psb_cdt = 0";
		try (Connection con = JDBCUtil.getConnection();
				PreparedStatement pstmt = con.prepareStatement(sql);
				ResultSet rs = pstmt.executeQuery()) {
			while (rs.next()) {
				return rs.getInt("lendableBooks");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return 0;
	}

	@Override
	public int selectDuringLendBooks() {
		String sql = "select count(book_code) as 'duringLendBooks' from book where lend_psb_cdt = 1";
		try (Connection con = JDBCUtil.getConnection();
				PreparedStatement pstmt = con.prepareStatement(sql);
				ResultSet rs = pstmt.executeQuery()) {
			while (rs.next()) {
				return rs.getInt("duringLendBooks");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return 0;
	}

	@Override
	public int selectTotalBooks() {
		String sql = "select count(book_code) as 'totalBooks' from book";
		try (Connection con = JDBCUtil.getConnection();
				PreparedStatement pstmt = con.prepareStatement(sql);
				ResultSet rs = pstmt.executeQuery()) {
			while (rs.next()) {
				return rs.getInt("totalBooks");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return 0;
	}

	@Override

	public Book LendingBookByCode(Book book) {
		String sql = "select book_code ,book_name ,authr_name ,trnslr_name , pls, p.pls_name, pblicte_year ,book_price ,lend_psb_cdt ,total_le_cnt ,book_img , lc_no , ml_no , regist_date , dsuse_cdt \r\n"
				+ "	from book b left join publishing_company p on b.pls = p.pls_no \r\n" + "	where book_code = ?";
		try (Connection con = JDBCUtil.getConnection(); PreparedStatement pstmt = con.prepareStatement(sql)) {
			pstmt.setString(1, book.getBookCode());
			LogUtil.prnLog(pstmt);
			try (ResultSet rs = pstmt.executeQuery()) {
				if (rs.next()) {
					return getBook2(rs);
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}

	public List<Book> LendingBookByCode2(Book book) {
		List<Book> list = null;
		String sql = "select book_code ,book_name ,authr_name ,trnslr_name , pls, p.pls_name, pblicte_year ,book_price ,lend_psb_cdt ,total_le_cnt ,book_img , lc_no , ml_no , regist_date , dsuse_cdt \r\n"
				+ "	from book b left join publishing_company p on b.pls = p.pls_no \r\n" + "	where book_code like ? and lend_psb_cdt = 0";
		try (Connection con = JDBCUtil.getConnection(); PreparedStatement pstmt = con.prepareStatement(sql)) {
			pstmt.setString(1, book.getBookCode()+"%");
			LogUtil.prnLog(pstmt);
			try (ResultSet rs = pstmt.executeQuery()) {
				if (rs.next()) {
					list = new ArrayList<>();
					do {
						list.add(getBook2(rs));
					} while (rs.next());
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	
	private Book getBook2(ResultSet rs) throws SQLException {
		String bookCode = rs.getString("book_code");
		String bookName = rs.getString("book_name");
		String authrName = rs.getString("authr_name");
		String trnslrName = rs.getString("trnslr_name");
		PublishingCompany pls = new PublishingCompany(rs.getInt("pls"), rs.getString("pls_name"));
		Date pblicteYear = rs.getTimestamp("pblicte_year");
		int bookPrice = rs.getInt("book_price");
		int lendPsbCdt = rs.getInt("lend_psb_cdt");
		int totalLeCnt = rs.getInt("total_le_cnt");
		byte[] bookImg = rs.getBytes("book_img");
		LargeClassification lcNo = new LargeClassification(rs.getInt("lc_no"));
		MiddleClassification mlNo = new MiddleClassification(rs.getInt("ml_no"));
		Date registDate = rs.getTimestamp("regist_date");
		int dsuseCdt = rs.getInt("dsuse_cdt");

		Book book = new Book(bookCode, bookName, authrName, trnslrName, pls, pblicteYear, bookPrice,
				lendPsbCdt, totalLeCnt, bookImg, lcNo, mlNo, registDate, dsuseCdt);

		return book;
	}

	public int[] selectCountByCate() {
		int[] cateCounts = new int[10];
		String sql = "select (select count(book_code) from book where lc_no = 1) as 'cate1', \r\n" + 
				"	   (select count(book_code) from book where lc_no = 2) as 'cate2',\r\n" + 
				"	   (select count(book_code) from book where lc_no = 3) as 'cate3',\r\n" + 
				"	   (select count(book_code) from book where lc_no = 4) as 'cate4',\r\n" + 
				"	   (select count(book_code) from book where lc_no = 5) as 'cate5',\r\n" + 
				"	   (select count(book_code) from book where lc_no = 6) as 'cate6',\r\n" + 
				"	   (select count(book_code) from book where lc_no = 7) as 'cate7',\r\n" + 
				"	   (select count(book_code) from book where lc_no = 8) as 'cate8',\r\n" + 
				"	   (select count(book_code) from book where lc_no = 9) as 'cate9',\r\n" + 
				"	   (select count(book_code) from book where lc_no = 10) as 'cate10'";
		try(Connection con = JDBCUtil.getConnection();
				PreparedStatement pstmt = con.prepareStatement(sql);
				ResultSet rs = pstmt.executeQuery()) {
			while(rs.next()) {
				cateCounts = getCateCounts(rs);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return cateCounts;
	}

	private int[] getCateCounts(ResultSet rs) throws SQLException {
		int cate1 = rs.getInt("cate1");
		int cate2 = rs.getInt("cate2");
		int cate3 = rs.getInt("cate3");
		int cate4 = rs.getInt("cate4");
		int cate5 = rs.getInt("cate5");
		int cate6 = rs.getInt("cate6");
		int cate7 = rs.getInt("cate7");
		int cate8 = rs.getInt("cate8");
		int cate9 = rs.getInt("cate9");
		int cate10 = rs.getInt("cate10");
		return new int[] {cate1,cate2,cate3,cate4,cate5,cate6,cate7,cate8,cate9,cate10};
	}

	@Override
	public int selectDisposalBooks() {
		String sql = "select count(book_code) as 'disposalbooks' from book where dsuse_cdt = 1";
		try(Connection con = JDBCUtil.getConnection();
				PreparedStatement pstmt = con.prepareStatement(sql);
				ResultSet rs = pstmt.executeQuery()) {
			while(rs.next()) {
				return rs.getInt("disposalbooks");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return 0;
	}

	@Override
	public List<Book> selectNewBookList() {
		String sql = "select pblicte_year, book_name , book_img_path , authr_name , trnslr_name , b.lc_no , l.lclas_name , b.ml_no , m.mlsfc_name , b.pls , p.pls_name \r\n" + 
				"	from book b left join large_classification l on b.lc_no = l.lclas_no \r\n" + 
				"				left join middle_classification m on b.ml_no = m.mlsfc_no and l.lclas_no = m.lclas_no \r\n" + 
				"				left join publishing_company p on b.pls = p.pls_no \r\n" + 
				"	group by book_name\r\n" + 
				"	order by pblicte_year desc limit 100";
		List<Book> list = null;
		try (Connection con = JDBCUtil.getConnection();
				PreparedStatement pstmt = con.prepareStatement(sql);
				ResultSet rs = pstmt.executeQuery()) {
			LogUtil.prnLog(pstmt);
			if(rs.next()) {
				list = new ArrayList<>();
				do {
					list.add(getNewBookList(rs));
				} while(rs.next());
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}

	private Book getNewBookList(ResultSet rs) throws SQLException {
		Book newBook = new Book();
		newBook.setBookName(rs.getString("book_name"));
		newBook.setBookImgPath(rs.getString("book_img_path"));
		newBook.setAuthrName(rs.getString("authr_name"));
		newBook.setTrnslrName(rs.getString("trnslr_name"));
		newBook.setLcNo(new LargeClassification(rs.getInt("b.lc_no"), rs.getString("l.lclas_name")));
		newBook.setMlNo(new MiddleClassification(new LargeClassification(rs.getInt("b.lc_no")), rs.getInt("b.ml_no"), rs.getString("m.mlsfc_name")));
		newBook.setPls(new PublishingCompany(rs.getInt("b.pls"), rs.getString("p.pls_name")));
		
		return newBook;
	}

	@Override
	public List<Book> lendingBookByName(Book book) {
		List<Book> list = null;
		String sql = "select book_code ,book_name ,authr_name ,trnslr_name , pls, p.pls_name, pblicte_year ,book_price ,lend_psb_cdt ,total_le_cnt ,book_img , lc_no , ml_no , regist_date , dsuse_cdt \r\n"
				+ "	from book b left join publishing_company p on b.pls = p.pls_no \r\n" + "	where book_name like ? and lend_psb_cdt = 0";
		try (Connection con = JDBCUtil.getConnection(); PreparedStatement pstmt = con.prepareStatement(sql)) {
			pstmt.setString(1, "%"+book.getBookName()+"%");
			LogUtil.prnLog(pstmt);
			try (ResultSet rs = pstmt.executeQuery()) {
				if (rs.next()) {
					list = new ArrayList<>();
					do {
						list.add(getBook2(rs));
					} while (rs.next());
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public Book selectBookByNameAndWriterNameAndPls(String bookName, String authr, String trnslr, String pls) {
		String sql = "select b.book_name , b.authr_name , b.trnslr_name , pls.pls_name \r\n" + 
				"	from book b left join publishing_company pls on b.pls = pls.pls_no \r\n" + 
				"	where b.book_name = ? and b.authr_name = ? and b.trnslr_name like ? and pls.pls_name like ? \r\n" + 
				"	group by b.book_name";
		try (Connection con = JDBCUtil.getConnection();
				PreparedStatement pstmt = con.prepareStatement(sql)) {
			pstmt.setString(1, bookName);
			pstmt.setString(2, authr);
			pstmt.setString(3, "%"+trnslr+"%");
			pstmt.setString(4, "%"+pls+"%");
			LogUtil.prnLog(pstmt);
			try (ResultSet rs = pstmt.executeQuery()){
				if(rs.next()) {
					Book checkBook = new Book();
					checkBook.setBookName(rs.getString(1));
					checkBook.setAuthrName(rs.getString(2));
					checkBook.setTrnslrName(rs.getString(3));
					checkBook.setPls(new PublishingCompany(rs.getString(4)));
					return checkBook;
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
}


//	public List<Book> LendingBookByCode2(Book book) {
//		List<Book> list = null;
//		String sql = "select book_code ,book_name ,authr_name ,trnslr_name , pls, p.pls_name, pblicte_year ,book_price ,lend_psb_cdt ,total_le_cnt ,book_img , lc_no , ml_no , regist_date , dsuse_cdt \r\n"
//				+ "	from book b left join publishing_company p on b.pls = p.pls_no \r\n" + "	where book_code like ?";
//		try (Connection con = MysqlDataSource.getConnection(); PreparedStatement pstmt = con.prepareStatement(sql)) {
//			pstmt.setString(1, "%"+book.getBookCode()+"%");
//			LogUtil.prnLog(pstmt);
//			try (ResultSet rs = pstmt.executeQuery()) {
//				if (rs.next()) {
//					list = new ArrayList<>();
//					do {
//						list.add(getBook2(rs));
//					} while (rs.next());
//				}
//			}
//		} catch (SQLException e) {
//			e.printStackTrace();
//		}
//		return list;
//	}


