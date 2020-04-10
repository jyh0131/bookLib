package com.yi.handler.user.member;

import java.io.PrintWriter;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.codehaus.jackson.map.ObjectMapper;

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
			String libId = (String)req.getSession().getAttribute("Lib");
			
			if(libId != null) {
				Map<String, String> map = new HashMap<>();
				map.put("result", "libLogin");
				
				ObjectMapper om = new ObjectMapper();
				String json = om.writeValueAsString(map);
				res.setContentType("application/json;charset=UTF-8");
				PrintWriter pw = res.getWriter();
				pw.print(json);
				pw.flush(); 
				
				return null;
			}
			
			if(id == null) {
				Map<String, String> map = new HashMap<>();
				map.put("result", "notLogin");
				
				ObjectMapper om = new ObjectMapper();
				String json = om.writeValueAsString(map);
				res.setContentType("application/json;charset=UTF-8");
				PrintWriter pw = res.getWriter();
				pw.print(json);
				pw.flush(); 
				
				return null;
			}
			
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
