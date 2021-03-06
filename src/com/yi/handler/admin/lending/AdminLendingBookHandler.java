package com.yi.handler.admin.lending;

import java.sql.Connection;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yi.dao.BookDao;
import com.yi.dao.impl.BookDaoImpl;
import com.yi.jdbc.JDBCUtil;
import com.yi.model.Book;
import com.yi.mvc.CommandHandler;

public class AdminLendingBookHandler implements CommandHandler {
	
	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {		
		Connection conn = null;
/*		if(req.getMethod().equalsIgnoreCase("post")) {
			MemberDao memberDao = MemberDaoImpl.getInstance();
			LendingDao lendingDao = LendingDaoImpl.getInstance();
			String id = req.getParameter("mber_id"); 
			Member member = new  Member(req.getParameter("mber_id")); 
			Member member2 = memberDao.selectMemberByNo3(member);
			List<Lending> list3 = null;
			if(lendingDao.selectLendingByMberId(member2) != null) {
				list3 = lendingDao.selectLendingByMberId(member2);
				req.setAttribute("memberBook", list3);
			}

					

			if( list3 == null) {	 
			}
			else {
				
				ObjectMapper om = new ObjectMapper();
				String json = om.writeValueAsString(list3);
				
				res.setContentType("application/json;charset=UTF-8");
				PrintWriter out = res.getWriter();
				out.print(json);
				out.flush();
			}


			return "/WEB-INF/view/admin/lending/adminLendingMemberPop.jsp";
		}*/
		try {
			conn = JDBCUtil.getConnection();
			BookDao dao = BookDaoImpl.getInstance();
			String sel = req.getParameter("choice");
			String text = req.getParameter("text");
			if (sel.equals("code")) {

				Book book = new Book(text);
				List<Book> list2 = dao.LendingBookByCode2(book);
				req.setAttribute("rentBook", list2);
			} else if (sel.equals("name")) {

				Book book = new Book(text, new Date());
				List<Book> list2 = dao.lendingBookByName(book);
				req.setAttribute("rentBook", list2);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(conn);
		}
		return "/WEB-INF/view/admin/lending/adminLendingBookPop.jsp";
	}
}
