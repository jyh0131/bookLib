package com.yi.handler.user;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yi.dao.MemberDao;
import com.yi.dao.impl.MemberDaoImpl;
import com.yi.model.Member;
import com.yi.model.ZipCode;
import com.yi.mvc.CommandHandler;

public class UserJoinHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		if(req.getMethod().equalsIgnoreCase("get")) {
			return "/WEB-INF/view/user/userJoin.jsp";
			
		}else if(req.getMethod().equalsIgnoreCase("post")) {
			String id = req.getParameter("id");
			String pass = req.getParameter("pass");
			String name = req.getParameter("name");
	
			String birthStr = req.getParameter("birthday");
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			Date birthday = sdf.parse(birthStr);
			
			String phone = req.getParameter("phone");
			ZipCode zip = new ZipCode(Integer.parseInt(req.getParameter("zip")));
			String base = req.getParameter("baseAddress");
			String detail = req.getParameter("detailAddress");
			
			
			MemberDao userDao = MemberDaoImpl.getInstance();
			Member member = new Member(id,pass,name,birthday,zip,phone,base,detail);
			int addMember = userDao.insertMember(member);
			
			req.setAttribute("id", id);
			
			return "/WEB-INF/view/user/userLogin.jsp";
			
		}
		return null;
	}

}
