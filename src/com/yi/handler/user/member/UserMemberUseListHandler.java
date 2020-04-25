package com.yi.handler.user.member;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yi.dao.LendingDao;
import com.yi.dao.MemberDao;
import com.yi.dao.impl.LendingDaoImpl;
import com.yi.dao.impl.MemberDaoImpl;
import com.yi.model.Lending;
import com.yi.model.Member;
import com.yi.mvc.CommandHandler;

public class UserMemberUseListHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		if(req.getMethod().equalsIgnoreCase("get")) {
			String id = (String)req.getSession().getAttribute("MemId");
			
			try {
				MemberDao memDao = MemberDaoImpl.getInstance();
				Member member = new Member(id);
				Member memInfo = memDao.selectMemberByNo(member);
				
				LendingDao dao = LendingDaoImpl.getInstance();
				Lending lending = new Lending(member);
				List<Lending> lendList = dao.selectLendingByMberIdAndLendBookTotalAll(lending);
				
				req.setAttribute("memInfo", memInfo);
				req.setAttribute("lendList", lendList);
				req.setAttribute("today", new Date());
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			return "/WEB-INF/view/user/member/userMenberUseList.jsp";
			
		} else if(req.getMethod().equalsIgnoreCase("post")) {
			String id = (String)req.getSession().getAttribute("MemId");
			String selCdt = req.getParameter("selCdt");
			
			try {
				MemberDao memDao = MemberDaoImpl.getInstance();
				Member member = new Member(id);
				Member memInfo = memDao.selectMemberByNo(member);
				req.setAttribute("memInfo", memInfo);
				
				LendingDao dao = LendingDaoImpl.getInstance();
				List<Lending> lendList;
				Lending lending = new Lending(member);
				
				if(selCdt.equals("total")) {
					lendList = dao.selectLendingByMberIdAndLendBookTotalAll(lending);
					req.setAttribute("lendList", lendList);
					req.setAttribute("today", new Date());
					return "/WEB-INF/view/user/member/userMenberUseList.jsp";
				}
				
				if(selCdt.equals("lendCdt")) {
					lendList = dao.selectLendingByMberIdAndLendBookAll(lending);
					req.setAttribute("lendList", lendList);
					req.setAttribute("today", new Date());
					return "/WEB-INF/view/user/member/userMenberUseList.jsp";
				}
				
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		}
		
		return null;
	}

}
