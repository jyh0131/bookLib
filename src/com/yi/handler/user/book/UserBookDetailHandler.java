package com.yi.handler.user.book;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yi.dao.BookDao;
import com.yi.dao.LendingDao;
import com.yi.dao.impl.BookDaoImpl;
import com.yi.dao.impl.LendingDaoImpl;
import com.yi.model.Book;
import com.yi.mvc.CommandHandler;

public class UserBookDetailHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		String code = req.getParameter("no");
		
		try {
			BookDao dao = BookDaoImpl.getInstance();
			LendingDao lendDao = LendingDaoImpl.getInstance();
			
			Book book = new Book(code);
			Book item = dao.selectBookByCode(book);
			Date rtunDate = lendDao.selectRturnDueDateByBookCode(code);
			
			req.setAttribute("item", item);
			req.setAttribute("rtunDate", rtunDate);
			return "/WEB-INF/view/user/book/userBookDetail.jsp";
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

}
