package com.yi.handler.user.book;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yi.dao.RequestBookDao;
import com.yi.dao.impl.RequestBookDaoImpl;
import com.yi.model.Member;
import com.yi.model.RequestBook;
import com.yi.mvc.CommandHandler;

public class UserBookReqstDeleteHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		String id = (String)req.getSession().getAttribute("MemId");
		String name = req.getParameter("name");
		
		try {
			RequestBookDao dao = RequestBookDaoImpl.getInstance();
			RequestBook rb = new RequestBook();
			rb.setRequestMbId(new Member(id));
			rb.setRequestBookName(name);
			dao.deleteRequestBook(rb);
			res.sendRedirect(req.getContextPath()+"/user/book/requestList.do");
			return null;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

}
