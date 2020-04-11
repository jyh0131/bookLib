package com.yi.handler.admin.profile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yi.model.Librarian;
import com.yi.mvc.CommandHandler;

public class AdminProfilePwCheckHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		if(req.getMethod().equalsIgnoreCase("get")) {
			
			return "/WEB-INF/view/admin/profile/adminProfileCheck.jsp";
	
		}if(req.getMethod().equalsIgnoreCase("post")) {
			
			Librarian lib=null;
		
				String pass = req.getParameter("pass");
				if(pass.equals(lib.getLbPass())) {
					res.sendRedirect(req.getContextPath()+"/admin/profile/profile.do");
					return null;
				
			}
		}
		return null;
	}

}
