package com.yi.handler.admin.user;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yi.dao.MemberDao;
import com.yi.dao.impl.MemberDaoImpl;
import com.yi.model.Member;
import com.yi.mvc.CommandHandler;

public class AdminUserWdrCdtRightHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		try {
			MemberDao dao = MemberDaoImpl.getInstance();
			Member member = new Member();
			member.setMberId(req.getParameter("id"));
			
			Member memInfo = dao.selectMemberByNo(member);
			int wdrCdt = memInfo.getWdrCdt();
			
			
			if(wdrCdt == 0) {
				memInfo.setWdrCdt(1);
				dao.updateCountMember(memInfo);
			}
			
			if(wdrCdt ==1) {
				memInfo.setWdrCdt(0);
				dao.updateCountMember(memInfo);
			}
			
			res.sendRedirect(req.getContextPath()+"/admin/user/userList.do");
			
			return null;
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

}
