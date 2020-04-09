package com.yi.handler.admin.book;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yi.mvc.CommandHandler;

public class AdminBookReastExcelAddHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		if(req.getMethod().equalsIgnoreCase("post")) {
			String[] no = req.getParameterValues("no");
			String[] bookName = req.getParameterValues("bookName");
			String[] auth = req.getParameterValues("auth");
			String[] trns = req.getParameterValues("trns");
			String[] pls = req.getParameterValues("pls");
			String[] cnt = req.getParameterValues("cnt");
			String[] date = req.getParameterValues("date");
			String[] whCdt = req.getParameterValues("whCdt");
			List<String> data = new ArrayList<String>();
			
			for(int i=0; i<no.length; i++) {
				data.add(no[i]);
				data.add(bookName[i]);
				data.add(auth[i]);
				data.add(trns[i]);
				data.add(pls[i]);
				data.add(cnt[i]);
				data.add(date[i]);
				data.add(whCdt[i]);
			}
			
			System.out.println("data : " + data);
			
			res.sendRedirect(req.getContextPath()+"/admin/book/bookReqstList.do");
			return null;
		}
		return null;
	}

}
