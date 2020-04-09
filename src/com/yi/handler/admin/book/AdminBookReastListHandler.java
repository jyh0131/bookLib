package com.yi.handler.admin.book;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yi.dao.RequestBookDao;
import com.yi.dao.impl.RequestBookDaoImpl;
import com.yi.model.RequestBook;
import com.yi.mvc.CommandHandler;

public class AdminBookReastListHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		// TODO Auto-generated method stub
		if(req.getMethod().equalsIgnoreCase("get")) {
			// 올해 년도부터 5년전 까지 년도 숫자 넘기기
			Date today = new Date();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy");
			int yearNum = Integer.parseInt(sdf.format(today));
			List<Integer> yearList = new ArrayList<Integer>();
			
			for(int i=0; i<5; i++) {
				yearList.add(yearNum);
				yearNum--;
			}
			
			try {				
				RequestBookDao dao = RequestBookDaoImpl.getInstance();
				List<RequestBook> list = dao.selectRequestBookByAll();
				
				req.setAttribute("yearList", yearList);
				req.setAttribute("list", list);
				return "/WEB-INF/view/admin/book/adminBookReqstList.jsp";
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		} else if(req.getMethod().equalsIgnoreCase("post")) {
			Date today = new Date();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy");
			int yearNum = Integer.parseInt(sdf.format(today));
			List<Integer> yearList = new ArrayList<Integer>();
			
			for(int i=0; i<5; i++) {
				yearList.add(yearNum);
				yearNum--;
			}
			req.setAttribute("yearList", yearList);
			
			/*String search = req.getParameter("search");
			String excelBtn = req.getParameter("excelBtn");
			String whCdtItem = req.getParameter("whCdtItem");*/
			
			try {
				String year = req.getParameter("year").equals("") ? null : req.getParameter("year");
				String month = req.getParameter("month").equals("") ? null : req.getParameter("month");
				String getWhCdt = req.getParameter("whCdt"); 
				int whCdt = Integer.parseInt(getWhCdt);
				
				RequestBookDao dao = RequestBookDaoImpl.getInstance();
				List<RequestBook> list = dao.selectRequestBookByOptionAll(whCdt, year, month);
				
				req.setAttribute("list", list);
				
				return "/WEB-INF/view/admin/book/adminBookReqstList.jsp";
				
			} catch (Exception e) {
				e.printStackTrace();
			}			
		}
		return null;
	}

}
