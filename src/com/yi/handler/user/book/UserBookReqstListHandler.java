package com.yi.handler.user.book;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yi.dao.RequestBookDao;
import com.yi.dao.impl.RequestBookDaoImpl;
import com.yi.model.Member;
import com.yi.model.RequestBook;
import com.yi.mvc.CommandHandler;

public class UserBookReqstListHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		if(req.getMethod().equalsIgnoreCase("get")) {	
			String memId = (String)req.getSession().getAttribute("MemId");
			
			List<Integer> yearList = yearList();
			req.setAttribute("yearList", yearList);
			
			try {
				RequestBookDao dao = RequestBookDaoImpl.getInstance();
				RequestBook rb = new RequestBook(new Member(memId));
				List<RequestBook> list = dao.selectRequestBookByIdAll(rb);
				
				req.setAttribute("list", list);
				return "/WEB-INF/view/user/book/userBookReqstList.jsp";
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		} else if(req.getMethod().equalsIgnoreCase("post")) {
			String year = req.getParameter("year");
			String memId = (String)req.getSession().getAttribute("MemId");
			
			List<Integer> yearList = yearList();
			req.setAttribute("yearList", yearList);
			
			try {
				RequestBookDao dao = RequestBookDaoImpl.getInstance();
				RequestBook rb = new RequestBook(new Member(memId));
				List<RequestBook> list = dao.selectRequestBookByIdAndYearOption(rb, year);
				req.setAttribute("list", list);
				return "/WEB-INF/view/user/book/userBookReqstList.jsp";
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		}
		
		return null;
	}

	private List<Integer> yearList() {
		// 올해 년도부터 5년전 까지 년도 숫자 넘기기
		Date today = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy");
		int year = Integer.parseInt(sdf.format(today));
		List<Integer> yearList = new ArrayList<Integer>();
		
		for (int i = 0; i < 5; i++) {
			yearList.add(year);
			year--;
		}
		return yearList;
	}

}
