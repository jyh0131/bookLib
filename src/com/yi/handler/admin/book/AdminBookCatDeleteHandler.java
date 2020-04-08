package com.yi.handler.admin.book;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.codehaus.jackson.map.ObjectMapper;

import com.yi.dao.LargeClassificationDao;
import com.yi.dao.MiddleClassificationDao;
import com.yi.dao.impl.LargeClassificationDaoImpl;
import com.yi.dao.impl.MiddleClassificationDaoImpl;
import com.yi.model.LargeClassification;
import com.yi.model.MiddleClassification;
import com.yi.mvc.CommandHandler;

public class AdminBookCatDeleteHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		String type = req.getParameter("type");
		String lcNo = req.getParameter("lcNo");
		String mlNo = req.getParameter("mlNo");
		String mlName = req.getParameter("mlName");
		
		try {
			LargeClassification lclas = new LargeClassification();
			
			if(type.equals("lc")) {
				LargeClassificationDao dao = LargeClassificationDaoImpl.getInstace();
				lclas.setLclasNo(Integer.parseInt(lcNo));
				
				int lcMlCdt = dao.selectLargeClassificationByNoAndMl(Integer.parseInt(lcNo));
				if(lcMlCdt > 0) {
					ObjectMapper om = new ObjectMapper();
					String json = om.writeValueAsString(lcMlCdt);
					res.setContentType("application/json;charset=UTF-8");
					PrintWriter out = res.getWriter();
					out.print(json);
					out.flush();
					return null;
				}
				
				dao.deleteLargeClassification(lclas);
				res.sendRedirect(req.getContextPath()+"/admin/book/bookCatList.do");
				return null;
			}
			
			if(type.equals("ml")) {
				MiddleClassificationDao dao = MiddleClassificationDaoImpl.getInstance();
				MiddleClassification mlsfc = new MiddleClassification();
				lclas.setLclasNo(Integer.parseInt(lcNo));
				mlsfc.setLclasNo(lclas);
				mlsfc.setMlsfcNo(Integer.parseInt(mlNo));
				mlsfc.setMlsfcName(mlName);
				dao.deleteMiddleClassification(mlsfc);
			}
			
			res.sendRedirect(req.getContextPath()+"/admin/book/bookCatList.do");
			return null;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

}
