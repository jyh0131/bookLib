package com.yi.handler.admin.book;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yi.dao.RequestBookDao;
import com.yi.dao.impl.RequestBookDaoImpl;
import com.yi.model.RequestBook;
import com.yi.mvc.CommandHandler;

public class AdminBookReastWhCdtUpdateHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		if(req.getMethod().equalsIgnoreCase("post")) {
			String[] items = req.getParameterValues("chk");
			String type = req.getParameter("type");
			System.out.println("type : " + type);
			
			try {
				RequestBookDao dao = RequestBookDaoImpl.getInstance();
				
				for(int i=0; i<items.length; i++) {
					System.out.println(items[i]);
					String[] item = items[i].split(",");
					RequestBook rb = new RequestBook();
					if(type.equals("whChtY")) {						
						rb.setWhCdt(1);
					} else if(type.equals("whChtN")) {
						rb.setWhCdt(0);
					}
					rb.setRequestBookName(item[0]);
					rb.setRequestBookPls(item[1]);
					rb.setRequestBookAuthor(item[2]);
					
					dao.updateReuestBookByWhCdt(rb);
				}
				
				res.sendRedirect(req.getContextPath()+"/admin/book/bookReqstList.do");
				return null;
				
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		return null;
	}

}
