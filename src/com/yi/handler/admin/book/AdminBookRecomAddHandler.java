package com.yi.handler.admin.book;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yi.dao.BookDao;
import com.yi.dao.RecommendationDao;
import com.yi.dao.impl.BookDaoImpl;
import com.yi.dao.impl.RecommendationDaoImpl;
import com.yi.model.Book;
import com.yi.model.Recommendation;
import com.yi.mvc.CommandHandler;

public class AdminBookRecomAddHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		// TODO Auto-generated method stub
		if(req.getMethod().equalsIgnoreCase("get")) {
			String code = req.getParameter("code");
			
			try { 
				BookDao dao = BookDaoImpl.getInstance();
				Book book = new Book(code);
				Book pick = dao.selectBookByCode(book);
				
				req.setAttribute("pick", pick);
				return "/WEB-INF/view/admin/book/adminBookRecomAddForm.jsp";	
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		} else if(req.getMethod().equalsIgnoreCase("post")) {
			String bookCont = req.getParameter("bookCont");
			String bookCode = req.getParameter("bookCode");
			
			try {
				RecommendationDao dao = RecommendationDaoImpl.getInstance();
				Recommendation recommend = new Recommendation();
				recommend.setBookCode(new Book(bookCode));
				recommend.setBookCont(bookCont);
				
				dao.insertRecommendation(recommend);
				
				res.sendRedirect(req.getContextPath()+"/admin/book/recomList.do");
				return null;
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		return null;
	}

}
