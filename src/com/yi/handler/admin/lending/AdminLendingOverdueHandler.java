package com.yi.handler.admin.lending;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yi.dao.LendingDao;
import com.yi.dao.impl.LendingDaoImpl;
import com.yi.jdbc.JDBCUtil;
import com.yi.model.Lending;
import com.yi.mvc.CommandHandler;

public class AdminLendingOverdueHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		if (req.getMethod().equalsIgnoreCase("get")) {
			Connection conn = null;

			try {
				conn = JDBCUtil.getConnection();
				LendingDao lendingDao = LendingDaoImpl.getInstance();
				List<Lending> overdueList = lendingDao.showLendingListByOverdue();
				req.setAttribute("overdueList", overdueList);
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				JDBCUtil.close(conn);
			}
			return "/WEB-INF/view/admin/lending/AdminLendingOverdue.jsp";
		}
		else if(req.getMethod().equalsIgnoreCase("post")) {
			String[] mberId = req.getParameterValues("chk");
			List<String> emailList = new ArrayList<>();
			for(String s: mberId) {
				emailList.add(s);
			}
			req.setAttribute("emailList", emailList);
			return "/WEB-INF/view/admin/lending/mailForm2.jsp";
		}
		return null;
	}

}
