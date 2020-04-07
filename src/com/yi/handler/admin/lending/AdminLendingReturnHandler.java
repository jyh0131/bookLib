package com.yi.handler.admin.lending;

import java.sql.Connection;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yi.dao.BookDao;
import com.yi.dao.LendingDao;
import com.yi.dao.MemberDao;
import com.yi.dao.impl.BookDaoImpl;
import com.yi.dao.impl.LendingDaoImpl;
import com.yi.dao.impl.MemberDaoImpl;
import com.yi.jdbc.JDBCUtil;
import com.yi.model.Book;
import com.yi.model.Member;
import com.yi.mvc.CommandHandler;

public class AdminLendingReturnHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		if (req.getMethod().equalsIgnoreCase("post")) {

			String id = req.getParameter("member_id");
			System.out.println("id : "+id);
			String[] bookCd = req.getParameterValues("book_code2");
			for(String s: bookCd) {
				System.out.println(s);
			}
			System.out.println("bookCd : "+bookCd.toString());
			Connection conn = null;
			try {
				conn = JDBCUtil.getConnection();
				BookDao bookDao = BookDaoImpl.getInstance();
				MemberDao memberDao = MemberDaoImpl.getInstance();
				LendingDao lendingDao = LendingDaoImpl.getInstance();
				Member mem = new Member(id);
				System.out.println("mem : "+ mem);
				Member member = memberDao.selectMemberByNo(mem);
				for (String s : bookCd) {
					Book bookcode = new Book(s);
					System.out.println("bookcode : "+ bookcode);
					Book book = bookDao.selectBookByCode(bookcode);
					System.out.println("book : "+book);
					lendingDao.updateLendingBookMember(member, book);
				}
				return "/WEB-INF/view/admin/lending/adminLending2.jsp";
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				JDBCUtil.close(conn);
			}
			return "/WEB-INF/view/admin/adminHome.jsp";
		}
		return "/WEB-INF/view/admin/lending/adminLending2.jsp";
		/*
		 * } else if (req.getMethod().equalsIgnoreCase("post")) { String id =
		 * req.getParameter("mber_id");
		 * 
		 * Connection conn = null; try { conn = JDBCUtil.getConnection(); MemberDao
		 * memberDao = MemberDaoImpl.getInstance(); LendingDao lendingDao =
		 * LendingDaoImpl.getInstance(); Member mem = new Member(id); Member member =
		 * memberDao.selectMemberByNo(mem); List<Lending> list =
		 * lendingDao.selectLendingByMberId(member);
		 * 
		 * ObjectMapper om = new ObjectMapper(); String json =
		 * om.writeValueAsString(list);
		 * 
		 * res.setContentType("application/json;charset=UTF-8"); PrintWriter out =
		 * res.getWriter(); out.print(json); out.flush(); } catch (Exception e) {
		 * e.printStackTrace(); } finally { JDBCUtil.close(conn); } Connection conn =
		 * null; try { System.out.println("handler 들어옴"); conn =
		 * JDBCUtil.getConnection(); LendingDao lendingDao =
		 * LendingDaoImpl.getInstance(); List<Lending> list =
		 * lendingDao.selectLendingByAll(); System.out.println("전체 대여목록 불러옴");
		 * ObjectMapper om = new ObjectMapper(); String json =
		 * om.writeValueAsString(list); System.out.println("리스트를 담음");
		 * System.out.println(json.toString());
		 * res.setContentType("application/json;charset=UTF-8"); PrintWriter out =
		 * res.getWriter(); out.print(json); out.flush(); } catch (Exception e) {
		 * e.printStackTrace(); }finally { JDBCUtil.close(conn); } }
		 */
	}
}
