package com.yi.handler.admin.book;

import java.io.PrintWriter;
import java.util.List;

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

public class AdminBookCatListHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		// TODO Auto-generated method stub
		if(req.getMethod().equalsIgnoreCase("get")) {
			
			String lcNo = req.getParameter("lcNo");
			LargeClassification lc = new LargeClassification();
			String lcMlLast = req.getParameter("lcMlLast");
			LargeClassification lcLast = new LargeClassification();
	
			try {
				
				LargeClassificationDao lcDao = LargeClassificationDaoImpl.getInstace();
				List<LargeClassification> lcList = lcDao.selectLargeClassificationByAll();
				int lcLastNo = lcDao.selectLaseCode();
				
				MiddleClassificationDao mlDao = MiddleClassificationDaoImpl.getInstance();
				List<MiddleClassification> mlList = mlDao.selectMiddleClassificationByAll();
				
				if(lcNo != null) {				
					lc.setLclasNo(Integer.parseInt(req.getParameter("lcNo")));
					mlList = mlDao.selectMiddleClassificationGroupLc(lc);
					
					ObjectMapper om = new ObjectMapper();
					String json = om.writeValueAsString(mlList);
					res.setContentType("application/json;charset=UTF-8");
					PrintWriter out = res.getWriter();
					out.print(json);
					out.flush();
					return null;
				}
				
				if(lcMlLast != null) {
					lcLast.setLclasNo(Integer.parseInt(lcMlLast));
					int mlLast = mlDao.selectLastCode(lcLast) + 1;
					System.out.println("mlLast : "+ mlLast);
					
					ObjectMapper om = new ObjectMapper();
					String json = om.writeValueAsString(mlLast);
					res.setContentType("application/json;charset=UTF-8");
					PrintWriter out = res.getWriter();
					out.print(json);
					out.flush();
					return null;
				}
				
				req.setAttribute("lcList", lcList);
				req.setAttribute("lcLastNo", lcLastNo);
				req.setAttribute("mlList", mlList);
				
				return "/WEB-INF/view/admin/book/adminBookCatList.jsp";
				
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if(req.getMethod().equalsIgnoreCase("post")) {
			
		}
		return null;
	}

}
