package com.yi.handler.admin.statistics;

import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.codehaus.jackson.map.ObjectMapper;

import com.yi.dao.BookDao;
import com.yi.dao.impl.BookDaoImpl;
import com.yi.mvc.CommandHandler;

public class AdminCategoryStatisticsHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		if(req.getMethod().equalsIgnoreCase("get")) {
			BookDao bookDao = BookDaoImpl.getInstance();
			int [] lendCate = bookDao.selectLendingCate();
			req.setAttribute("lendCate", lendCate);
			return "/WEB-INF/view/admin/statistics/adminCategoryStatistics.jsp";
		}
		else if(req.getMethod().equalsIgnoreCase("post")) {
			String y = req.getParameter("year");
			String m = req.getParameter("month");
			String wantDate = y+"-"+m+"-01";
			System.out.println("wantDate : "+wantDate);
			
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			Date d = sdf.parse(wantDate);
			BookDao bookDao = BookDaoImpl.getInstance();
			int [] countCate = bookDao.selectLendingCategoryCnt(d);
			ObjectMapper om = new ObjectMapper();
			String json = om.writeValueAsString(countCate);
			res.setContentType("application/json;charset=UTF-8");
			PrintWriter out = res.getWriter();
			out.print(json);
			out.flush();
		}
		return null;
	}

}
