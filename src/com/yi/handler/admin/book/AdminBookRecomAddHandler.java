package com.yi.handler.admin.book;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yi.mvc.CommandHandler;

public class AdminBookRecomAddHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		// TODO Auto-generated method stub
		if(req.getMethod().equalsIgnoreCase("post")) {
			
			return null;
		}
		
		String code = req.getParameter("code");
		System.out.println("code : " + code);
		return "/WEB-INF/view/admin/book/adminBookRecomAddForm.jsp";
	}

}
