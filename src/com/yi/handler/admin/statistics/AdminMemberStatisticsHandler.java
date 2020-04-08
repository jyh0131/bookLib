package com.yi.handler.admin.statistics;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yi.dao.MemberDao;
import com.yi.dao.impl.MemberDaoImpl;
import com.yi.mvc.CommandHandler;

public class AdminMemberStatisticsHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		if(req.getMethod().equalsIgnoreCase("get")) {
			MemberDao memberDao = MemberDaoImpl.getInstance();
			int [] memberCnt = memberDao.selectMemberCounts();
			req.setAttribute("memberCnt", memberCnt);
			return "/WEB-INF/view/admin/statistics/adminMemberStatistics.jsp";
		}
		else if(req.getMethod().equalsIgnoreCase("post")) {

		}
		return null;
	}

}
