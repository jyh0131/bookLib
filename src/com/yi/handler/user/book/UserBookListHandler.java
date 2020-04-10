package com.yi.handler.user.book;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yi.mvc.CommandHandler;

public class UserBookListHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		if(req.getMethod().equalsIgnoreCase("get")) {		
			return "/WEB-INF/view/user/book/userBookList.jsp";
		} else if (req.getMethod().equalsIgnoreCase("post")) {
			return "/WEB-INF/view/user/book/userBookList.jsp";
		}
		return null;
	}

}
