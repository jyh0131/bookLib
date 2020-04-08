package com.yi.handler.admin.statistics;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yi.dao.BookDao;
import com.yi.dao.impl.BookDaoImpl;
import com.yi.mvc.CommandHandler;

public class AdminBookStatisticsHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		if(req.getMethod().equalsIgnoreCase("get")) {
			BookDao bookDao = BookDaoImpl.getInstance();
			int disposal = bookDao.selectDisposalBooks();
			int totalBooks = bookDao.selectTotalBooks();
			int [] countCate = bookDao.selectCountByCate();
			req.setAttribute("disposal", disposal);
			req.setAttribute("totalBooks", totalBooks);
			req.setAttribute("countCate", countCate);
			return "/WEB-INF/view/admin/statistics/adminBookStatistics.jsp";
		}
		else if(req.getMethod().equalsIgnoreCase("post")) {

		}
		return null;
	}

}
