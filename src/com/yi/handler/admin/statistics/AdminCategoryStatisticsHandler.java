package com.yi.handler.admin.statistics;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yi.dao.BookDao;
import com.yi.dao.impl.BookDaoImpl;
import com.yi.mvc.CommandHandler;

public class AdminCategoryStatisticsHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		if(req.getMethod().equalsIgnoreCase("get")) {
			BookDao bookDao = BookDaoImpl.getInstance();
			int lendable = bookDao.selectLendableBooks();
			int duringLend = bookDao.selectDuringLendBooks();
			int OverdueBooks = bookDao.selectOverdueBooks();
			int NoLendingBooks = bookDao.selectNoLendingBooks();
			req.setAttribute("lendable", lendable);
			req.setAttribute("duringLend", duringLend);
			req.setAttribute("OverdueBooks", OverdueBooks);
			req.setAttribute("NoLendingBooks", NoLendingBooks);
			return "/WEB-INF/view/admin/statistics/adminCategoryStatistics.jsp";
		}
		else if(req.getMethod().equalsIgnoreCase("post")) {

		}
		return null;
	}

}
