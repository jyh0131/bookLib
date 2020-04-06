package com.yi.handler.admin.lending;

import java.sql.Connection;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yi.dao.BookDao;
import com.yi.dao.LendingDao;
import com.yi.dao.impl.BookDaoImpl;
import com.yi.dao.impl.LendingDaoImpl;
import com.yi.jdbc.JDBCUtil;
import com.yi.model.Book;
import com.yi.model.Member;
import com.yi.mvc.CommandHandler;

public class AdminLendingRentHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		if(req.getMethod().equalsIgnoreCase("post")) {
			
			String id = req.getParameter("member_id");
			String[] bookCd = req.getParameterValues("book_code");
			
			Connection conn = null;
			try {
				conn = JDBCUtil.getConnection();
				BookDao bookDao = BookDaoImpl.getInstance();
				LendingDao lendingDao = LendingDaoImpl.getInstance();
				Member member = new Member(id);
				for(String s : bookCd) {
					Book bookcode = new Book(s);
					Book book = bookDao.selectBookByCode(bookcode);
					lendingDao.insertLendingUpdateBookMember(member, book);
				}
				return "/WEB-INF/view/admin/lending/adminLending.jsp";
			} catch (Exception e) {
				e.printStackTrace();
			}finally {
				JDBCUtil.close(conn);
			}
			return "/WEB-INF/view/admin/adminHome.jsp";
		}
		return "/WEB-INF/view/admin/lending/adminLending.jsp";
	}
}
