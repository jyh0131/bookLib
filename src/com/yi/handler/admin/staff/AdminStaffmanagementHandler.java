package com.yi.handler.admin.staff;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yi.dao.LibrarianDao;
import com.yi.dao.MemberDao;
import com.yi.dao.impl.LibrarianDaoImpl;
import com.yi.dao.impl.MemberDaoImpl;
import com.yi.model.Librarian;
import com.yi.model.Member;
import com.yi.mvc.CommandHandler;

public class AdminStaffmanagementHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		if(req.getMethod().equalsIgnoreCase("get")) {
			try {
				LibrarianDao libDao = LibrarianDaoImpl.getInstance();
				List<Librarian> libList = libDao.selectLibrarianByAll();
				req.setAttribute("libList", libList);
				
			}catch (Exception e) {
				e.printStackTrace();
			}
			
			return "/WEB-INF/view/admin/staff/adminStaffmanagement.jsp";
		}else if(req.getMethod().equalsIgnoreCase("post")) {

			String schType = req.getParameter("schType") == null ? "" : req.getParameter("schType");
			String schText = req.getParameter("schText") == null ? "" : req.getParameter("schText");
			
			try {
				LibrarianDao libDao = LibrarianDaoImpl.getInstance();
				List<Librarian> libList = null;

				Librarian lib = new Librarian();
				
				if (schType.contentEquals("사서이름")) {
					lib.setLbName(schText.trim());
					libList = libDao.searchLibrarianByName(lib);
					if(libList !=null) {
						req.setAttribute("libList", libList);
					}else {
						req.setAttribute("libListNull", true);
					}
				}else if(schType.contentEquals("사서ID")) {
					lib.setLbId(schText.trim());
					libList = libDao.searchLibrarianByID(lib);
					if(libList!=null) {
						req.setAttribute("libList", libList);
					}else {
						req.setAttribute("libListNull", true);
					}	
				}
				
				
			}catch (Exception e) {
				e.printStackTrace();
			}
			
			return "/WEB-INF/view/admin/staff/adminStaffmanagement.jsp";

		}
		return null;
	}

}
