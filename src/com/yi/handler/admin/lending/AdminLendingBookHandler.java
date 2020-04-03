package com.yi.handler.admin.lending;

import java.sql.Connection;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yi.dao.BookDao;
import com.yi.dao.impl.BookDaoImpl;
import com.yi.jdbc.JDBCUtil;
import com.yi.model.Book;
import com.yi.mvc.CommandHandler;

public class AdminLendingBookHandler implements CommandHandler {
	
	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
//		if (req.getMethod().equalsIgnoreCase("get")) {
		Connection conn = null;
		try {
			conn = JDBCUtil.getConnection();
			BookDao dao = BookDaoImpl.getInstance();
//				String bookCode = req.getParameter("bookSearch");
//				Book book = new Book(bookCode);
			String sel = req.getParameter("choice");
			String text = req.getParameter("text");
//			System.out.println("=====================================");
//			JOptionPane.showMessageDialog(null, "잘넘어왔나");
//			System.out.println(sel+"@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
//			System.out.println(text+"%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%");
			if (sel.equals("code")) {
				System.out.println("코드 체크");
				Book book = new Book(text);
				List<Book> list2 = dao.LendingBookByCode2(book);
				req.setAttribute("rentBook", list2);
			} else if (sel.equals("name")) {
				System.out.println("네임 체크");
				Book book = new Book(text, new Date());
				List<Book> list2 = dao.lendingBookByName(book);
				req.setAttribute("rentBook", list2);
			}
//			System.out.println(sel);
//			List<Book> list2 = dao.selectBookByAll();
//			req.setAttribute("rentBook2", list2);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(conn);
		}
		return "/WEB-INF/view/admin/lending/adminLendingBookPop.jsp";

//		}
//		return null;
	}
}
