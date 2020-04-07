package com.yi.handler.admin.book;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yi.dao.PublishingCompanyDao;
import com.yi.dao.impl.PublishingCompanyDaoImpl;
import com.yi.model.PublishingCompany;
import com.yi.mvc.CommandHandler;

public class AdminBookPlsDeleteHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		int plsNo = Integer.parseInt(req.getParameter("no"));
		
		try {
			PublishingCompanyDao dao = PublishingCompanyDaoImpl.getInstance();
			PublishingCompany pls = new PublishingCompany(plsNo);
			dao.deletePublishingCompany(pls);
			res.sendRedirect(req.getContextPath() + "/admin/book/plsList.do");
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return null;
	}

}
