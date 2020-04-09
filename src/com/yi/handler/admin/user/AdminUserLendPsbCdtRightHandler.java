package com.yi.handler.admin.user;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yi.dao.MemberDao;
import com.yi.dao.impl.MemberDaoImpl;
import com.yi.model.Member;
import com.yi.mvc.CommandHandler;

public class AdminUserLendPsbCdtRightHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		
		try {
			MemberDao dao = MemberDaoImpl.getInstance();
			Member member = new Member();
			member.setMberId(req.getParameter("id"));
			
			Member memInfo = dao.selectMemberByNo(member);
			int lendPsbCdt = memInfo.getLendPsbCdt();
			
			if(lendPsbCdt == 0) {
				memInfo.setLendPsbCdt(1);
				dao.updateCountMember(memInfo);
			}
			if(lendPsbCdt ==1) {
				memInfo.setLendPsbCdt(0);
				dao.updateCountMember(memInfo);
			}
			
			res.sendRedirect(req.getContextPath() +"/admin/user/userList.do");
			
			return null;
			
		}catch (Exception e) {
			e.printStackTrace();
		}
	
		return null;
	}

}
