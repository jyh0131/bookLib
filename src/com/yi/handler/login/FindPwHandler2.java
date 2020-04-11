package com.yi.handler.login;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.yi.dao.LibrarianDao;
import com.yi.dao.MemberDao;
import com.yi.dao.impl.LibrarianDaoImpl;
import com.yi.dao.impl.MemberDaoImpl;
import com.yi.model.Librarian;
import com.yi.model.Member;
import com.yi.mvc.CommandHandler;

public class FindPwHandler2 implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		if (req.getMethod().equalsIgnoreCase("get")) {

			return "/WEB-INF/view/login/findPw.jsp";

		} else if (req.getMethod().equalsIgnoreCase("post")) {

			try {
				String id = req.getParameter("id");
				String name = req.getParameter("name");
				String birthday = req.getParameter("birthday");
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
				Date brthdy = sdf.parse(birthday);

				MemberDao userDao = MemberDaoImpl.getInstance();
				Member member = new Member();
				member.setMberId(id);
				member.setMberName(name);
				member.setMberBrthdy(brthdy);

				LibrarianDao libDao = LibrarianDaoImpl.getInstance();
				Librarian libratian = new Librarian();
				libratian.setLbId(id);
				libratian.setLbName(name);
				libratian.setLbBirthDay(brthdy);

				Member findMemberPw = userDao.findMemberPw(member);
				Librarian findLibPw = libDao.findLibrarianPw(libratian);

				if (findMemberPw == null) {
					if (findLibPw == null) {
						HttpSession session = req.getSession();
						session.setAttribute("error", "nullId");

						return "/WEB-INF/view/login/findId.jsp";
					}

					HttpSession session = req.getSession();
					session.setAttribute("Lib", findLibPw.getLbPass());
					res.sendRedirect(req.getContextPath() + "/login/findPw.do");

					return null;

				}
				HttpSession session = req.getSession();
				session.setAttribute("Mem", findMemberPw.getMberPass());
				res.sendRedirect(req.getContextPath() + "/login/findPw.do");

				return null;

			} catch (Exception e) {
				e.printStackTrace();
			}

		}
		return null;
	}
}
