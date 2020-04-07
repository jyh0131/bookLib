package com.yi.handler.admin.book;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.codehaus.jackson.map.ObjectMapper;

import com.yi.dao.PublishingCompanyDao;
import com.yi.dao.impl.PublishingCompanyDaoImpl;
import com.yi.model.PublishingCompany;
import com.yi.mvc.CommandHandler;

public class AdminBookPlsAddHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		if(req.getMethod().equalsIgnoreCase("get")) {
			String plsName = req.getParameter("plsName");
			
			try {
				PublishingCompanyDao dao = PublishingCompanyDaoImpl.getInstance();
				int lastCode = dao.selectLastCode() + 1;
				req.setAttribute("lastCode", lastCode);
				
				if(plsName != null) {
					PublishingCompany overlep = dao.selectPublishingCompanyByName(plsName);
					
					ObjectMapper om = new ObjectMapper();
					String json = om.writeValueAsString(overlep);
					res.setContentType("application/json;charset=UTF-8");
					PrintWriter out = res.getWriter();
					out.print(json);
					out.flush();
					return null;
				}
				
				return "/WEB-INF/view/admin/book/adminBookPlsAddForm.jsp";
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if(req.getMethod().equalsIgnoreCase("post")) {
			int plsNo = Integer.parseInt(req.getParameter("plsNo"));
			String plsName = req.getParameter("plsName");
			
			try {
				PublishingCompanyDao dao = PublishingCompanyDaoImpl.getInstance();
				PublishingCompany pls = new PublishingCompany(plsNo, plsName);
				dao.insertPublishingCompany(pls);
				
				res.sendRedirect(req.getContextPath() + "/admin/book/plsList.do");
				return null;
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		return null;
	}

}
