package com.yi.handler.login;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.yi.mvc.CommandHandler;

public class LogoutHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		//logout 처리
		HttpSession session = req.getSession();
		session.invalidate();
		
		res.sendRedirect(req.getContextPath() + "/user/home.do");
		return null;
	}

}
