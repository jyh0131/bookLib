package com.yi.handler.admin.book;

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

public class AdminBookListHandler implements CommandHandler {
	
	public void lcList(HttpServletRequest req) {
		LargeClassificationDao lcDao = LargeClassificationDaoImpl.getInstace();
		List<LargeClassification> lcList = lcDao.selectLargeClassificationByAll();
		req.setAttribute("lcList", lcList);
	}

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		// TODO Auto-generated method stub
		if(req.getMethod().equalsIgnoreCase("get")) {
			
			try {
				lcList(req);
				
				BookDao bookDao = BookDaoImpl.getInstance();
				List<Book> bookList = bookDao.selectBookByAll();
				req.setAttribute("bookList", bookList);
				
				//System.out.println("역자 : " + bookList.get(1).getTrnslrName());

			} catch (Exception e) {
				e.printStackTrace();
			}
		
			return "/WEB-INF/view/admin/book/adminBookList.jsp";
		} else if (req.getMethod().equalsIgnoreCase("post")) {
			String schType = req.getParameter("schType") == null ? "" : req.getParameter("schType");
			int lcNo = Integer.parseInt(req.getParameter("lcNo").equals("") ? "0" : req.getParameter("lcNo"));
			String schText = req.getParameter("schText") == null ? "" : req.getParameter("schText");
			
			try {
				BookDao dao = BookDaoImpl.getInstance();
				List<Book> bookList = null;
				Book book = new Book();
				
				if(schType.contentEquals("도서코드")) {	
					if(lcNo > 0) {
						book.setBookCode(schText);
						book.setLcNo(new LargeClassification(lcNo));
						bookList = dao.selectBookByCodeAndCat(book);
						req.setAttribute("bookList", bookList);
					} else if(lcNo == 0) {
						book.setBookCode(schText);
						bookList = dao.selectBookByCodeAndCat(book);
						req.setAttribute("bookList", bookList);
					}
				} else if(schType.contentEquals("도서명")) {
					if(lcNo > 0) {
						book.setBookName(schText);
						book.setLcNo(new LargeClassification(lcNo));
						bookList = dao.selectBookByNameAndCat(book);
						req.setAttribute("bookList", bookList);
					} else if(lcNo == 0) {
						book.setBookName(schText);
						bookList = dao.selectBookByNameAndCat(book);
						req.setAttribute("bookList", bookList);
					}
				} else if(lcNo > 0){
					book.setLcNo(new LargeClassification(lcNo));
					bookList = dao.selectBookByCodeAndCat(book);
					req.setAttribute("bookList", bookList);
				} else if(lcNo == 0){
					bookList = dao.selectBookByAll();
					req.setAttribute("bookList", bookList);
				}
				
				lcList(req);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			return "/WEB-INF/view/admin/book/adminBookList.jsp";
		}
		return null;
	}

}
