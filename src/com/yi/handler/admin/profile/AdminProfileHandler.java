package com.yi.handler.admin.profile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.jsp.PageContext;

import com.yi.dao.LibrarianDao;
import com.yi.dao.impl.LibrarianDaoImpl;
import com.yi.model.Librarian;
import com.yi.mvc.CommandHandler;

public class AdminProfileHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		if (req.getMethod().equalsIgnoreCase("get")) {
			String id = req.getParameter("id");

			try {
				LibrarianDao libDao = LibrarianDaoImpl.getInstance();
				Librarian item = libDao.JSPSelectUpdateLib(new Librarian(id));

				req.setAttribute("item", item);

				return "/WEB-INF/view/admin/profile/adminProfile.jsp";

			} catch (Exception e) {
				e.printStackTrace();
			}

		} else if (req.getMethod().equalsIgnoreCase("post")) {
		}
		return null;

	}
}
