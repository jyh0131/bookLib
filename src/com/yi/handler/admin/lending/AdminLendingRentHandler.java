package com.yi.handler.admin.lending;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yi.mvc.CommandHandler;

public class AdminLendingRentHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {

		return "/WEB-INF/view/admin/lending/adminLending.jsp";
	}
}
