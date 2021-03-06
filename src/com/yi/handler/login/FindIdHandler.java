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

public class FindIdHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		if(req.getMethod().equalsIgnoreCase("get")) {
			return "/WEB-INF/view/login/findId.jsp";
			
		}else if(req.getMethod().equalsIgnoreCase("post")) {
			
			try{
				String name = req.getParameter("name");
				String birthday = req.getParameter("birthday");
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
				Date brthdy = sdf.parse(birthday);
				
				MemberDao userDao = MemberDaoImpl.getInstance();
				Member member = new Member();
				member.setMberName(name);
				member.setMberBrthdy(brthdy);
				
				LibrarianDao libDao = LibrarianDaoImpl.getInstance();
				Librarian libratian = new Librarian();
				libratian.setLbName(name);
				libratian.setLbBirthDay(brthdy);
				
				Member findMemberId = userDao.findMemberId(member);
				Librarian findLibId = libDao.findLibrarianId(libratian);
				
				System.out.println("member : " + findMemberId);
				System.out.println("lib : " + findLibId);
				
				if(findMemberId == null) {
					if(findLibId ==null) {
						HttpSession session = req.getSession();
						session.setAttribute("error", "nullId");
						System.out.println("error : " );

						return "/WEB-INF/view/login/findId.jsp";
					}
					
					HttpSession session = req.getSession();
					session.setAttribute("Lib", findLibId.getLbId());
					res.sendRedirect(req.getContextPath() + "/login/findId.do");
			
					return null;
					
				}
				HttpSession session = req.getSession();
				session.setAttribute("Mem", findMemberId.getMberId());
				res.sendRedirect(req.getContextPath() + "/login/findId.do");
			
				return null;
				
			}catch (Exception e) {
				e.printStackTrace();
			}

		}
		return null;
	}

}
