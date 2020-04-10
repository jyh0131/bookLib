package com.yi.handler.user.book;

import java.io.PrintWriter;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.codehaus.jackson.map.ObjectMapper;

import com.yi.dao.RequestBookDao;
import com.yi.dao.impl.RequestBookDaoImpl;
import com.yi.model.Member;
import com.yi.model.RequestBook;
import com.yi.mvc.CommandHandler;

public class UserBookReqstAddHandler implements CommandHandler {

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
			
			return "/WEB-INF/view/user/book/userBookReqstAddForm.jsp";
		} else if(req.getMethod().equalsIgnoreCase("post")) {
			String bookName = req.getParameter("bookName");
			String authr = req.getParameter("authr");
			String trnslr = req.getParameter("trnslr").equals("") ? null : req.getParameter("trnslr");
			String pls = req.getParameter("pls");
			String id = (String)req.getSession().getAttribute("MemId");
			
			System.out.println("id : " + id);
			
			try {
				RequestBook rb = new RequestBook();
				rb.setRequestBookName(bookName);
				rb.setRequestBookAuthor(authr);
				rb.setRequestBookTrnslr(trnslr);
				rb.setRequestBookPls(pls);
				rb.setRequestMbId(new Member(id));
				rb.setRequestDate(new Date());
				rb.setWhCdt(0);
				
				RequestBookDao dao = RequestBookDaoImpl.getInstance();
				dao.insertRequestBook(rb);
				
				res.sendRedirect(req.getContextPath()+"/user/book/requestList.do ");
				return null;
				
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		return null;
	}

}
