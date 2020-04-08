package com.yi.handler.admin.user;

import java.text.SimpleDateFormat;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yi.dao.MemberDao;
import com.yi.dao.impl.MemberDaoImpl;
import com.yi.model.Member;
import com.yi.mvc.CommandHandler;

public class AdminUserListHandler implements CommandHandler {
	

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		if (req.getMethod().equalsIgnoreCase("get")) {
			

			try {
				MemberDao memberDao = MemberDaoImpl.getInstance();
				List<Member> memberList = memberDao.selectMemberByAll();
				req.setAttribute("memberList", memberList);
			} catch (Exception e) {
				e.printStackTrace();
			}

			return "/WEB-INF/view/admin/user/adminUserList.jsp";
			
			
		} else if (req.getMethod().equalsIgnoreCase("post")) {
			
			String schType = req.getParameter("schType")==null? "":req.getParameter("schType");
			String schText = req.getParameter("schText")==null? "":req.getParameter("schText");
		
		try {
			MemberDao dao = MemberDaoImpl.getInstance();
			List<Member> memberList = null;
			
			Member member = new Member();
			
			
			
			if(schType.equals("회원명")) {
				if(schText.length() > 0) {
					member.setMberName(schText.trim());
					memberList = dao.searchMemberByName(member);
					req.setAttribute("memberList", memberList);
				}	
			}else if(schType.equals("회원ID")) {
				member.setMberId(schText.trim());
				memberList = dao.searchMemberByID(member);
				req.setAttribute("memberList", memberList);
				
			}else if(schType.equals("생년월일")) {
				member.setMberBrthdy(new SimpleDateFormat("yyyy-MM-dd").parse(schText.trim()));
				memberList = dao.searchMemberByBirtyday(member);
				req.setAttribute("memberList", memberList);
						
			}
			
			if(memberList == null) {
				req.setAttribute("memberListNull", true);
			}
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		}
		return null;
	}

}
