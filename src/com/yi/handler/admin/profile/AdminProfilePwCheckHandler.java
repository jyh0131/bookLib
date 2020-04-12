package com.yi.handler.admin.profile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yi.dao.LibrarianDao;
import com.yi.dao.impl.LibrarianDaoImpl;
import com.yi.model.Librarian;
import com.yi.mvc.CommandHandler;

public class AdminProfilePwCheckHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		if(req.getMethod().equalsIgnoreCase("get")) {
			String libId = (String)req.getSession().getAttribute("LibId");
			String pass = (String)req.getSession().getAttribute("LibPass");
			try {
				LibrarianDao libDao = LibrarianDaoImpl.getInstance();
				Librarian lib = new Librarian(libId);
				Librarian libInfo = libDao.selectLibrarianById(lib);
				req.setAttribute("libInfo", libInfo);
				return "/WEB-INF/view/admin/profile/adminProfileCheck.jsp";
				
			}catch (Exception e) {
				e.printStackTrace();
			}
		}else if(req.getMethod().equalsIgnoreCase("post")) {
			String libId = (String)req.getSession().getAttribute("LibId");
			String pass = (String)req.getSession().getAttribute("LibPass");
			
			LibrarianDao libDao = LibrarianDaoImpl.getInstance();
			Librarian lib = new Librarian(libId);
			Librarian libInfo = libDao.selectLibrarianById(lib);
			req.setAttribute("libInfo", libInfo);
			res.sendRedirect(req.getContextPath()+"/admin/profile/adminProfile.do");
			return null;
		}
		return null;
	}

}
