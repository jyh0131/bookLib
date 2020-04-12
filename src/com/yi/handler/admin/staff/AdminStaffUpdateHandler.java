package com.yi.handler.admin.staff;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yi.dao.LibrarianDao;
import com.yi.dao.impl.LibrarianDaoImpl;
import com.yi.model.Librarian;
import com.yi.model.Title;
import com.yi.mvc.CommandHandler;

public class AdminStaffUpdateHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		if(req.getMethod().equalsIgnoreCase("get")) {
			String id = req.getParameter("id");
			
			try {
				
				LibrarianDao dao = LibrarianDaoImpl.getInstance();
				Librarian item = dao.selectLibrarianById(new Librarian(id));
				
				req.setAttribute("item", item);
				
				return "/WEB-INF/view/admin/staff/adminStaffUpdate.jsp";
			}catch (Exception e) {
				e.printStackTrace();
			}
			
		}else if(req.getMethod().equalsIgnoreCase("post")) {
			try{
				String titleName = req.getParameter("title");
				int titleNo = Integer.parseInt(titleName);
				
				String workCdtStr = req.getParameter("workCdt");
				int workCdt = Integer.parseInt(workCdtStr);
		
				
				LibrarianDao dao = LibrarianDaoImpl.getInstance();
				Librarian lib = new Librarian();
				
				lib.setLbId(req.getParameter("id"));
				lib.setLbName(req.getParameter("name")); 
				lib.setTitle(new Title(titleNo));
				lib.setWorkCdt(workCdt);

				dao.updateLibrarian(lib);
				
				res.sendRedirect(req.getContextPath() +"/admin/staff/management.do");
				return null;
				
			}catch (Exception e) {
				e.printStackTrace();
			}
		}
		return null;
	}
}
