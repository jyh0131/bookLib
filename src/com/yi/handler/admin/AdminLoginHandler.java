package com.yi.handler.admin;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.yi.dao.LibrarianDao;
import com.yi.dao.impl.LibrarianDaoImpl;
import com.yi.model.Librarian;
import com.yi.mvc.CommandHandler;

public class AdminLoginHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		if(req.getMethod().equalsIgnoreCase("get")) {
			return "/WEB-INF/view/user/userLogin.jsp";
			
		}else if(req.getMethod().equalsIgnoreCase("post")) {
			String id = req.getParameter("id");
			String password = req.getParameter("password");
			
			//사서로그인
			LibrarianDao libDao = LibrarianDaoImpl.getInstance();
			Librarian librarian = new Librarian();
			librarian.setLbId(id);
			librarian.setLbPass(password);
			Librarian loginLib = libDao.loginLibrarian(librarian);
			
			if (loginLib == null) {
				req.setAttribute("id", id);
				req.setAttribute("password", password);
				HttpSession session = req.getSession();
				session.setAttribute("error", "notMatchId");
				return "/WEB-INF/view/user/userLogin.jsp";
			} else {
				HttpSession session = req.getSession();
				session.setAttribute("Auth", librarian.getLbName());

				res.sendRedirect(req.getContextPath() + "/user/home.do");
				return null;
			}
		}
		return null;
	}

}
