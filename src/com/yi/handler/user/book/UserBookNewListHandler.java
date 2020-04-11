package com.yi.handler.user.book;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yi.dao.BookDao;
import com.yi.dao.impl.BookDaoImpl;
import com.yi.model.Book;
import com.yi.mvc.CommandHandler;

public class UserBookNewListHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		
		try {
			BookDao dao = BookDaoImpl.getInstance();
			List<Book> list = dao.selectNewBookList(50);
			
			req.setAttribute("list", list);
			return "/WEB-INF/view/user/book/userBookNewList.jsp";
		} catch (Exception e) {
			e.printStackTrace();
		}		
		return null;
	}

}
