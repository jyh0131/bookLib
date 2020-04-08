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

public class AdminBookCatUpdateHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		String type = req.getParameter("type");
		String lcNo = req.getParameter("lcNo");
		String lcName = req.getParameter("lcName");
		String mlNo = req.getParameter("mlNo");
		String mlName = req.getParameter("mlName");
		
		System.out.println("lcNo : " + lcNo);
		System.out.println("mlNo : " + mlNo);
		System.out.println("mlName : " + mlName);
		
		try {
			LargeClassificationDao lcDao = LargeClassificationDaoImpl.getInstace();
			MiddleClassificationDao mlDao = MiddleClassificationDaoImpl.getInstance();
			LargeClassification lclas = new LargeClassification();
			MiddleClassification mlsfc = new MiddleClassification();
			
			if(type.equals("lc")) {
				lclas.setLclasName(lcName);
				lclas.setLclasNo(Integer.parseInt(lcNo));
				lcDao.updateLargeClassification(lclas);
			}
			
			if(type.equals("ml")) {
				lclas.setLclasNo(Integer.parseInt(lcNo));
				mlsfc.setLclasNo(lclas);
				mlsfc.setMlsfcNo(Integer.parseInt(mlNo));
				mlsfc.setMlsfcName(mlName);
				mlDao.updateMiddleClassification(mlsfc);
			}
			
			res.sendRedirect(req.getContextPath()+"/admin/book/bookCatList.do");
			return null;
		} catch (Exception e) {
			e.printStackTrace();
		}		
		return null;
	}

}
