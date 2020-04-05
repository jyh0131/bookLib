package com.yi.handler.admin.lending;

import java.sql.Connection;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yi.dao.MemberDao;
import com.yi.dao.impl.MemberDaoImpl;
import com.yi.jdbc.JDBCUtil;
import com.yi.model.Member;
import com.yi.mvc.CommandHandler;

public class AdminLendingMemberHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		Connection conn = null;
		try {
			conn = JDBCUtil.getConnection();
			MemberDao memberDao = MemberDaoImpl.getInstance();
			String sel = req.getParameter("choice");
			String text = req.getParameter("text");
			if (sel.equals("id")) {
				Member member = new Member(text);
				List<Member> list2 = memberDao.selectMemberByCodeName(member);
				req.setAttribute("memberSel", list2);
			} else if (sel.equals("name")) {
				Member member = new Member(text, new Date());
				List<Member> list2 = memberDao.selectMemberByCodeName2(member);
				req.setAttribute("memberSel", list2);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(conn);
		}
		return "/WEB-INF/view/admin/lending/adminLendingMemberPop.jsp";
	}
}
