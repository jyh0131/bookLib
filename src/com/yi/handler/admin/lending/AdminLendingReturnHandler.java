package com.yi.handler.admin.lending;

import java.io.PrintWriter;
import java.sql.Connection;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.codehaus.jackson.map.ObjectMapper;

import com.yi.dao.LendingDao;
import com.yi.dao.MemberDao;
import com.yi.dao.impl.LendingDaoImpl;
import com.yi.dao.impl.MemberDaoImpl;
import com.yi.jdbc.JDBCUtil;
import com.yi.model.Lending;
import com.yi.model.Member;
import com.yi.mvc.CommandHandler;

public class AdminLendingReturnHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		if (req.getMethod().equalsIgnoreCase("get")) {
			return "/WEB-INF/view/admin/lending/adminLending2.jsp";
		} else if (req.getMethod().equalsIgnoreCase("post")) {
			String id = req.getParameter("mber_id");

			Connection conn = null;
			try {
				conn = JDBCUtil.getConnection();
				MemberDao memberDao = MemberDaoImpl.getInstance();
				LendingDao lendingDao = LendingDaoImpl.getInstance();
				Member mem = new Member(id);
				Member member = memberDao.selectMemberByNo(mem);
				List<Lending> list = lendingDao.selectLendingByMberId(member);

				ObjectMapper om = new ObjectMapper();
				String json = om.writeValueAsString(list);

				res.setContentType("application/json;charset=UTF-8");
				PrintWriter out = res.getWriter();
				out.print(json);
				out.flush();
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				JDBCUtil.close(conn);
			}
			return null;
		}
		return null;
	}
}
