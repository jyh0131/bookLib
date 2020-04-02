package com.yi.handler.admin;

import java.sql.Connection;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yi.dao.BookDao;
import com.yi.dao.impl.BookDaoImpl;
import com.yi.jdbc.JDBCUtil;
import com.yi.model.Book;
import com.yi.mvc.CommandHandler;

public class AdminLendingRentHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		if (req.getMethod().equalsIgnoreCase("get")) {
			return "/WEB-INF/view/admin/adminLending.jsp";
		} else if (req.getMethod().equalsIgnoreCase("post")) {
			Connection conn = null;
			try {
				conn = JDBCUtil.getConnection();
				BookDao dao = BookDaoImpl.getInstance();
				String bookCode = req.getParameter("bookSearch");
				Book book = new Book(bookCode);
				List<Book> list = dao.selectBookByAll();
				req.setAttribute("rentBook", list);
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				JDBCUtil.close(conn);
			}
		}
		return null;
	}
}
