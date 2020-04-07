package com.yi.handler.admin.book;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yi.dao.PublishingCompanyDao;
import com.yi.dao.impl.PublishingCompanyDaoImpl;
import com.yi.model.PublishingCompany;
import com.yi.mvc.CommandHandler;

public class AdminBookPlsListHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		// TODO Auto-generated method stub
		if(req.getMethod().equalsIgnoreCase("get")) {			
			try {
				PublishingCompanyDao dao = PublishingCompanyDaoImpl.getInstance();
				List<PublishingCompany> list = dao.selectPublishingCompanyByAll();
				
				req.setAttribute("list", list);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			return "/WEB-INF/view/admin/book/adminBookPlsList.jsp";
			
		} else if (req.getMethod().equalsIgnoreCase("post")) {
			String pls = req.getParameter("pls");
			String radioType = req.getParameter("plsChk");
			
			try {
				PublishingCompanyDao dao = PublishingCompanyDaoImpl.getInstance();
				PublishingCompany item;
				List<PublishingCompany> list = new ArrayList<PublishingCompany>();
				
				if(pls.equals("")) {					
					list = dao.selectPublishingCompanyByAll();
					req.setAttribute("list", list);
					return "/WEB-INF/view/admin/book/adminBookPlsList.jsp";
				}
				
				if(radioType.equals("code")) {
					item = dao.selectPublishingCompanyByNo(new PublishingCompany(Integer.parseInt(pls)));
					
					if(item == null) {
						req.setAttribute("list", null);
					} else {						
						list.add(item);
						req.setAttribute("list", list);
					}
					
					System.out.println("no : " + list);
					
					return "/WEB-INF/view/admin/book/adminBookPlsList.jsp";
				}
				
				if(radioType.equals("name")) {
					list = dao.selectPublishingCompanyByNameAll(pls);
					
					req.setAttribute("list", list);
					System.out.println("name : " + list);
					return "/WEB-INF/view/admin/book/adminBookPlsList.jsp";
				}
				
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			return "/WEB-INF/view/admin/book/adminBookPlsList.jsp";
		}
		
		return null;
	}

}
