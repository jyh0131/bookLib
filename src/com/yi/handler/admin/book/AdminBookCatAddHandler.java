package com.yi.handler.admin.book;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yi.dao.LargeClassificationDao;
import com.yi.dao.MiddleClassificationDao;
import com.yi.dao.impl.LargeClassificationDaoImpl;
import com.yi.dao.impl.MiddleClassificationDaoImpl;
import com.yi.model.LargeClassification;
import com.yi.model.MiddleClassification;
import com.yi.mvc.CommandHandler;

public class AdminBookCatAddHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		if(req.getMethod().equalsIgnoreCase("post")) {
			String type = req.getParameter("type");
			LargeClassification lclas = new LargeClassification();
			MiddleClassification mlsfc = new MiddleClassification();
			
			try {
				if(type.equals("lc")) {
					String lcNo = req.getParameter("lcNo");
					String lcName = req.getParameter("lcName");
					
					LargeClassificationDao lcDao = LargeClassificationDaoImpl.getInstace();
					lclas.setLclasNo(Integer.parseInt(lcNo));
					lclas.setLclasName(lcName);
					lcDao.insertLargeClassification(lclas);
				}
				
				if(type.equals("ml")) {
					String mlLcNo = req.getParameter("mlLcNo");
					String mlNo = req.getParameter("mlNo");
					String mlName = req.getParameter("mlName");
					
					MiddleClassificationDao mlDao = MiddleClassificationDaoImpl.getInstance();
					lclas.setLclasNo(Integer.parseInt(mlLcNo));
					mlsfc.setLclasNo(lclas);
					mlsfc.setMlsfcNo(Integer.parseInt(mlNo));
					mlsfc.setMlsfcName(mlName);
					mlDao.insertMiddleClassification(mlsfc);
				}
				
				res.sendRedirect(req.getContextPath()+"/admin/book/bookCatList.do");
				return null;
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		}
		return null;
	}

}
