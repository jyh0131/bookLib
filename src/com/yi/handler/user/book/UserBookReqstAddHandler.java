package com.yi.handler.user.book;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yi.dao.RequestBookDao;
import com.yi.dao.impl.RequestBookDaoImpl;
import com.yi.model.RequestBook;
import com.yi.mvc.CommandHandler;

public class UserBookReqstAddHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		if(req.getMethod().equalsIgnoreCase("get")) {
			return "/WEB-INF/view/user/book/userBookReqstAddForm.jsp";
		} else if(req.getMethod().equalsIgnoreCase("post")) {
			String bookName = req.getParameter("bookName");
			String authr = req.getParameter("artur");
			String trnslr = req.getParameter("trnslr").equals("") ? null : req.getParameter("trnslr");
			String pls = req.getParameter("pls");
			String id = req.getParameter("id");
			
			System.out.println("id : " + id);
			
			try {
				RequestBook rb = new RequestBook();
				rb.setRequestBookName(bookName);
				rb.setRequestBookAuthor(authr);
				rb.setRequestBookTrnslr(trnslr);
				rb.setRequestBookPls(pls);
				
				//RequestBookDao dao = RequestBookDaoImpl.getInstance();
				//dao.insertRequestBook(rb);
				
				res.sendRedirect(req.getContextPath()+"/user/book/requestAdd.do ");
				return null;
				
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		return null;
	}

}
