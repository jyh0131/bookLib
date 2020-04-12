package com.yi.handler.user.member;

import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.codehaus.jackson.map.ObjectMapper;

import com.yi.dao.MemberDao;
import com.yi.dao.impl.MemberDaoImpl;
import com.yi.model.Member;
import com.yi.mvc.CommandHandler;

public class UserMemberProfilePwCheckHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		if(req.getMethod().equalsIgnoreCase("get")) {
			String id = (String)req.getSession().getAttribute("MemId");
			String libId = (String)req.getSession().getAttribute("Lib");
			String pass = (String)req.getSession().getAttribute("MemPass");
			
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
				
				req.setAttribute("memberInfo", memInfo);
				
				
			}catch (Exception e) {
				e.printStackTrace();
			}
			
			return "/WEB-INF/view/user/member/userMemberProfilePwCheck.jsp";
		}else if(req.getMethod().equalsIgnoreCase("post")) {
			String id = (String)req.getSession().getAttribute("MemId");
			String pass = (String)req.getSession().getAttribute("MemPass");
			MemberDao memDao = MemberDaoImpl.getInstance();
			Member member = new Member(id);
			Member memInfo = memDao.selectMemberByNo(member);
			req.setAttribute("memInfo", memInfo);
			
			res.sendRedirect(req.getContextPath()+"/user/member/profile.do");
			return null;
		}
		return null;
	}

}
