package com.yi.handler.admin.staff;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yi.dao.LibrarianDao;
import com.yi.dao.impl.LibrarianDaoImpl;
import com.yi.model.Librarian;
import com.yi.mvc.CommandHandler;

public class AdminStaffAddHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		if(req.getMethod().equalsIgnoreCase("get")) {
			
		}else if(req.getMethod().equalsIgnoreCase("post")) {
			
		}
		return null;
	}

}
