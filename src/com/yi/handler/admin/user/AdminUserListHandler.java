package com.yi.handler.admin.user;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yi.mvc.CommandHandler;

public class AdminUserListHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		if(req.getMethod().equalsIgnoreCase("get")) {
			return "/WEB-INF/view/admin/user/adminUserList.jsp";
		}else if(req.getMethod().equalsIgnoreCase("post")) {
			
		}
		return null;
	}

}