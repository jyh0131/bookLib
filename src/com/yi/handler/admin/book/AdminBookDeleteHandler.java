package com.yi.handler.admin.book;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yi.dao.BookDao;
import com.yi.dao.impl.BookDaoImpl;
import com.yi.model.Book;
import com.yi.mvc.CommandHandler;

public class AdminBookDeleteHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		// TODO Auto-generated method stub
		try {
			BookDao dao = BookDaoImpl.getInstance();
			Book book = new Book(req.getParameter("code"));
			dao.deleteBook(book);
			
			res.sendRedirect(req.getContextPath()+"/admin/book/list.do");
			return null;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

}
