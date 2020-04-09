package com.yi.handler.user.book;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yi.mvc.CommandHandler;

public class UserBookReqstListHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		// 올해 년도부터 5년전 까지 년도 숫자 넘기기
		Date today = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy");
		int year = Integer.parseInt(sdf.format(today));
		List<Integer> yearList = new ArrayList<Integer>();

		for (int i = 0; i < 5; i++) {
			yearList.add(year);
			year--;
		}

		req.setAttribute("yearList", yearList);

		return "/WEB-INF/view/user/book/userBookReqstList.jsp";
	}

}
