package com.yi.handler.user.book;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yi.dao.BookDao;
import com.yi.dao.RequestBookDao;
import com.yi.dao.impl.BookDaoImpl;
import com.yi.dao.impl.RequestBookDaoImpl;
import com.yi.model.Book;
import com.yi.model.Member;
import com.yi.model.RequestBook;
import com.yi.mvc.CommandHandler;

public class UserBookReqstAddHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		if(req.getMethod().equalsIgnoreCase("get")) {
			
			return "/WEB-INF/view/user/book/userBookReqstAddForm.jsp";
			
		} else if(req.getMethod().equalsIgnoreCase("post")) {
			String bookName = req.getParameter("bookName");
			String authr = req.getParameter("authr");
			String trnslr = req.getParameter("trnslr");
			String pls = req.getParameter("pls");
			String id = (String)req.getSession().getAttribute("MemId");
			System.out.println("trnslr: " + trnslr);
			
			try {
				BookDao bookDao = BookDaoImpl.getInstance();	
				System.out.println("trnslr : " + trnslr);
				Book chkBook = bookDao.selectBookByNameAndWriterNameAndPls(bookName, authr, trnslr, pls);
				System.out.println(chkBook);
				System.out.println("111");
				System.out.println("33");
				RequestBook rb = new RequestBook();
				rb.setRequestBookName(bookName);
				rb.setRequestBookAuthor(authr);
				rb.setRequestBookTrnslr(trnslr);
				rb.setRequestBookPls(pls);
				rb.setRequestMbId(new Member(id));
				rb.setRequestDate(new Date());
				rb.setWhCdt(0);
				
				RequestBookDao dao = RequestBookDaoImpl.getInstance();
				
				dao.insertRequestBook(rb);
				
				res.sendRedirect(req.getContextPath()+"/user/book/requestList.do");
				return null;
				
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		return null;
	}

}
