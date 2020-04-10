package com.yi.handler.admin.staff;

import java.sql.Timestamp;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yi.dao.LibrarianDao;
import com.yi.dao.TitleDao;
import com.yi.dao.impl.LibrarianDaoImpl;
import com.yi.dao.impl.TitleDaoImpl;
import com.yi.model.Librarian;
import com.yi.model.Title;
import com.yi.model.ZipCode;
import com.yi.mvc.CommandHandler;

public class AdminStaffAddHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		if(req.getMethod().equalsIgnoreCase("get")) {
			String titleNo = req.getParameter("titleNo");
			
			try {
				TitleDao dao = TitleDaoImpl.getInstance();
				List<Title> titleList = dao.selectTitleByAll();
				req.setAttribute("titleList", titleList);
			}catch (Exception e) {
				e.printStackTrace();
			}
			
			return "/WEB-INF/view/admin/staff/adminStaffAdd.jsp";
		
		}else if(req.getMethod().equalsIgnoreCase("post")) {
			String titleNo = req.getParameter("title");
			
			LibrarianDao dao = LibrarianDaoImpl.getInstance();
			Librarian lib = new Librarian();
			
			lib.setLbId(req.getParameter("id"));
			lib.setLbName(req.getParameter("name"));
			lib.setLbPass(req.getParameter("pass"));
			lib.setTitle(new Title(titleNo));
			lib.setJoinDate(new Date());
			lib.setWorkCdt(1);
	
	
			dao.insertLibrarian(lib);
			res.sendRedirect(req.getContextPath() +"/admin/staff/staffAdd.do");
			return null;
		}
		return null;
	}

}
