package com.yi.handler.admin.lending;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yi.mvc.CommandHandler;

public class AdminLendingReturnHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {

//		Connection conn = null;
//		try {
//			conn = JDBCUtil.getConnection();
//			BookDao dao = BookDaoImpl.getInstance();
////			String bookCode = req.getParameter("bookSearch");
////			Book book = new Book(bookCode);
//			List<Book> list = dao.selectBookByAll();
//			req.setAttribute("rentBook2", list);
//		} catch (Exception e) {
//			e.printStackTrace();
//		} finally {
//			JDBCUtil.close(conn);
//		}

		return "/WEB-INF/view/admin/lending/adminLending2.jsp";
	}
}
