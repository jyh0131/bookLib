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

public class AdminBookStatisticsHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		if(req.getMethod().equalsIgnoreCase("get")) {
			BookDao bookDao = BookDaoImpl.getInstance();
			int disposal = bookDao.selectDisposalBooks();
			int totalBooks = bookDao.selectTotalBooks();
			int [] countCate = bookDao.selectCountByCate();
			req.setAttribute("disposal", disposal);
			req.setAttribute("totalBooks", totalBooks);
			req.setAttribute("countCate", countCate);
			return "/WEB-INF/view/admin/statistics/adminBookStatistics.jsp";
		}
		else if(req.getMethod().equalsIgnoreCase("post")) {
			String y = req.getParameter("year");
			String m = req.getParameter("month");
			String wantDate = y+"-"+m+"-01";
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			Date d = sdf.parse(wantDate);
			BookDao bookDao = BookDaoImpl.getInstance();
			int[] cnt = bookDao.selectCountByCateDate(d);
			ObjectMapper om = new ObjectMapper();
			String json = om.writeValueAsString(cnt);
			res.setContentType("application/json;charset=UTF-8");
			PrintWriter out = res.getWriter();
			out.print(json);
			out.flush();
		}
		return null;
	}

}
