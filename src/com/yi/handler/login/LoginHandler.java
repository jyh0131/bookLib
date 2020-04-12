package com.yi.handler.login;

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

public class LoginHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		
		if (req.getMethod().equalsIgnoreCase("get")) {
			return "/WEB-INF/view/login/login.jsp";

		} else if (req.getMethod().equalsIgnoreCase("post")) {
			try {
				// input 값 가지고옴
				String id = req.getParameter("id");
				String password = req.getParameter("password");

				// 회원로그인
				MemberDao userDao = MemberDaoImpl.getInstance();
				Member member = new Member();
				member.setMberId(id);
				member.setMberPass(password);
				Member loginMember = userDao.loginMember(member);

				// 사서로그인
				LibrarianDao libDao = LibrarianDaoImpl.getInstance();
				Librarian libratian = new Librarian();
				libratian.setLbId(id);
				libratian.setLbPass(password);
				Librarian loginLib = libDao.loginLibrarian(libratian);

		
				if(loginLib !=null) {
					if(loginLib.getWorkCdt()==0) {
						HttpSession session = req.getSession();
						session.setAttribute("retire", "retire");
						
//						res.sendRedirect(req.getContextPath() + "/user/userLogin.do");
//						return null;

						return "/WEB-INF/view/login/login.jsp";
					}
					if(loginLib.getTitle().getTitleNo() == 0) {
						HttpSession session = req.getSession();
						session.setAttribute("Lib", loginLib.getLbName());
						session.setAttribute("LibId", loginLib.getLbId());
						session.setAttribute("LibPass", loginLib.getLbPass());
						session.setAttribute("Title",loginLib.getTitle().getTitleNo());
						session.setAttribute("LibImage", loginLib.getLibImgPath());
						res.sendRedirect(req.getContextPath() + "/user/home.do");
						return null;
					}
					if(loginLib.getTitle().getTitleNo() ==1) {
						HttpSession session = req.getSession();
						session.setAttribute("Lib", loginLib.getLbName());
						session.setAttribute("LibId", loginLib.getLbId());
						session.setAttribute("LibPass", loginLib.getLbPass());
						session.setAttribute("Title", loginLib.getTitle().getTitleNo());
						session.setAttribute("LibImage", loginLib.getLibImgPath());
						res.sendRedirect(req.getContextPath() + "/user/home.do");
						return null;
					}
				}else if(loginMember !=null) {
					if(loginMember.getWdrCdt() ==1) {
						HttpSession session = req.getSession();
						session.setAttribute("retire", "retire");
						
						return "/WEB-INF/view/login/login.jsp";
					}
					
					HttpSession session = req.getSession();
					session.setAttribute("Mem", loginMember.getMberName());
					session.setAttribute("MemId", loginMember.getMberId());
					session.setAttribute("MemImage", loginMember.getMemberImgPath());
					res.sendRedirect(req.getContextPath() + "/user/home.do");
					return null;
				}
				else {
					HttpSession session = req.getSession();
					session.setAttribute("notMatchId", "notMatchId");
//					res.sendRedirect(req.getContextPath() + "/user/userLogin.do");
//					return null;
					
					return "/WEB-INF/view/login/login.jsp";
				}	
			}catch (Exception e) {
				e.printStackTrace();
			}
			
		}
		return null;
	}

}
