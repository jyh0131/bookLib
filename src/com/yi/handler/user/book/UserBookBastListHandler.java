package com.yi.handler.user.book;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yi.dao.LendingDao;
import com.yi.dao.impl.LendingDaoImpl;
import com.yi.model.Lending;
import com.yi.mvc.CommandHandler;

public class UserBookBastListHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		
		try {
			LendingDao dao = LendingDaoImpl.getInstance();
			List<Lending> list = dao.selectLendingBastList(50);
			req.setAttribute("list", list);
			
			return "/WEB-INF/view/user/book/userBookBastList.jsp";
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return null;
	}

}
