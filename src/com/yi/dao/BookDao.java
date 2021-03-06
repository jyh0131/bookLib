package com.yi.dao;

import java.util.Date;
import java.util.List;

import com.yi.model.Book;

public interface BookDao {
	Book selectBookByCode(Book book);

	List<Book> selectBookByAll();

	List<Book> selectBookByCodeAndCat(Book book);

	List<Book> selectBookByNameAndCat(Book book);

	List<Book> selectBookOnMber(Book book);
	
	List<Book> selectBookAllOnMber();

	String selectBookByOverlapBookLastCode(String bName, String aName, int pls);
	
	String selectBookByCatLastCode(int lcNo, int mlNo);

	Book LendingBookByCode(Book book);

	int insertBook(Book book);

	int updateBook(Book book);

	int deleteBook(Book book);

	int selectLendableBooks();

	int selectDuringLendBooks();

	int selectTotalBooks();

	int selectDisposalBooks();

	int[] selectCountByCate();

	List<Book> selectNewBookList(int cnt);

	List<Book> lendingBookByName(Book book);

	List<Book> LendingBookByCode2(Book book);
	
	Book selectBookByNameAndWriterNameAndPls(String bookName, String authr, String trnslr, String pls);
	
	int selectOverdueBooks();
	
	int selectNoLendingBooks();
	
	int[] selectCountByCateDate(Date date);
	
	int [] selectLendingCategoryCnt(Date date);
	
	int [] selectLendingCate();

	int selectCountByCateDateYear(Date yearD);

	int selectLendingCategoryYearCnt(Date yearD);
}
