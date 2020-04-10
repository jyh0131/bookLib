package com.yi.handler.user.book;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yi.dao.BookDao;
import com.yi.dao.LargeClassificationDao;
import com.yi.dao.impl.BookDaoImpl;
import com.yi.dao.impl.LargeClassificationDaoImpl;
import com.yi.model.Book;
import com.yi.model.LargeClassification;
import com.yi.mvc.CommandHandler;

public class UserBookListHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		if(req.getMethod().equalsIgnoreCase("get")) {		
			try {
				lcList(req);
				return "/WEB-INF/view/user/book/userBookList.jsp";
			} catch (Exception e) {
				e.printStackTrace();
			}			
		} else if (req.getMethod().equalsIgnoreCase("post")) {
			String bookName = req.getParameter("bookName");
			String authrName = req.getParameter("authrName");
			String lcNo = req.getParameter("lcNo");
			LargeClassification lc = new LargeClassification();
			if(lcNo == null || lcNo.equals("")) {
				lc = null;
			} else {
				lc.setLclasNo(Integer.parseInt(lcNo));
			}
			
			req.setAttribute("viewList", "viewList");
			try {
				lcList(req);
				BookDao dao = BookDaoImpl.getInstance();
				Book book = new Book();
				book.setBookName(bookName);
				book.setAuthrName(authrName);
				book.setLcNo(lc);
				List<Book> schList = dao.selectBookOnMber(book);		
				
				for(Book b : schList) {
					System.out.println("book : " + b);
				}
				
				req.setAttribute("schList", schList);
				return "/WEB-INF/view/user/book/userBookList.jsp";
			} catch (Exception e) {
				e.printStackTrace();
			}			
		}
		return null;
	}

	private void lcList(HttpServletRequest req) {
		LargeClassificationDao lcDao = LargeClassificationDaoImpl.getInstace();
		List<LargeClassification> lcList = lcDao.selectLargeClassificationByAll();
		req.setAttribute("lcList", lcList);
	}

}
