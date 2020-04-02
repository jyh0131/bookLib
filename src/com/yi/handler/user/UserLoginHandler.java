package com.yi.handler.user;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.yi.dao.MemberDao;
import com.yi.dao.impl.MemberDaoImpl;
import com.yi.model.Member;
import com.yi.mvc.CommandHandler;

public class UserLoginHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		if (req.getMethod().equalsIgnoreCase("get")) {
			return "/WEB-INF/view/user/userLogin.jsp";

		} else if (req.getMethod().equalsIgnoreCase("post")) {
			String id = req.getParameter("id");
			String password = req.getParameter("password");

		
				MemberDao dao = MemberDaoImpl.getInstance();

				Member member = new Member();
				member.setMberId(id);
				member.setMberPass(password);
				
				Member loginMember = dao.loginMember(member);

				if (loginMember == null) {
					req.setAttribute("id", id);
					req.setAttribute("password", password);
					HttpSession session = req.getSession();
					session.setAttribute("error", "notMatchId");
					return "/WEB-INF/view/user/userLogin.jsp";
				} else {
					HttpSession session = req.getSession();
					session.setAttribute("Auth", loginMember.getMberName());

					res.sendRedirect(req.getContextPath() + "/user/home.do");
					return null;
				}
		}
		return null;
	}

}
