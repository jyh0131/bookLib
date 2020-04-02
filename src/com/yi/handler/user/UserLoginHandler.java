package com.yi.handler.user;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yi.dao.MemberDao;
import com.yi.dao.impl.MemberDaoImpl;
import com.yi.model.Member;
import com.yi.mvc.CommandHandler;

public class UserLoginHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		if(req.getMethod().equalsIgnoreCase("get")) {
			return "/WEB-INF/view/user/userLogin.jsp";
		
		}else if(req.getMethod().equalsIgnoreCase("post")) {
			String id = req.getParameter("id");
			String password = req.getParameter("password");
			
			
			Member member = new Member();
			member.setMberId(id);
			member.setMberPass(password);
			MemberDao dao = MemberDaoImpl.getInstance(); 
			dao.loginMember(member);
			
			if(member == null) {
				req.setAttribute("id", id);
				req.setAttribute("password", password);
				
			}
			
			
			
			
			
			
			
		}
		return null;
	}

}
