package com.yi.handler.user.member;

import java.util.Calendar;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yi.dao.LendingDao;
import com.yi.dao.impl.LendingDaoImpl;
import com.yi.model.Book;
import com.yi.model.Lending;
import com.yi.model.Member;
import com.yi.mvc.CommandHandler;

public class UserMemberRturnPsmCdtUpdateHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		if(req.getMethod().equalsIgnoreCase("post")) {
			String[] items = req.getParameterValues("chk");
			String mberId = (String) req.getSession().getAttribute("MemId");
			
			try {
				LendingDao dao = LendingDaoImpl.getInstance();
				Calendar cal = Calendar.getInstance();
				
				for(int i=0; i<items.length; i++) {
					Lending getLendNo =  dao.selectLendingByNo(Integer.parseInt(items[i]));
					
					Date date = getLendNo.getRturnDueDate();
					cal.setTime(date);
					cal.add(Calendar.DATE, 10);
					Date rturnDate = cal.getTime();
					
					Lending lending = new Lending();
					lending.setBookCd(new Book(getLendNo.getBookCd().getBookCode()));
					lending.setMberId(new Member(mberId));
					lending.setRturnPsmCdt(1);
					lending.setRturnDueDate(rturnDate);
					
					dao.updateLendingByCodeAndMberId(lending);
				}
				
				res.sendRedirect(req.getContextPath()+"/user/member/uesList.do");
				return null;
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return null;
	}

}
