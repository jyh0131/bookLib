package com.yi.handler.admin.staff;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yi.mvc.CommandHandler;

public class AdminStaffmanagementHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		if(req.getMethod().equalsIgnoreCase("get")) {
			return "/WEB-INF/view/admin/staff/adminStaffmanagement.jsp";
		}else if(req.getMethod().equalsIgnoreCase("post")) {
			
		}
		return null;
	}

}
