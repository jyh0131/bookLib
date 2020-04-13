package com.yi.handler.user.book;

import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.codehaus.jackson.map.ObjectMapper;

import com.yi.dao.BookDao;
import com.yi.dao.impl.BookDaoImpl;
import com.yi.model.Book;
import com.yi.mvc.CommandHandler;

public class UserBookReqstOverlapHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		// TODO Auto-generated method stub
		if(req.getMethod().equalsIgnoreCase("post")) {
			String bookName = req.getParameter("bookName");
			String authr = req.getParameter("authr");
			String trnslr = req.getParameter("trnslr");
			String pls = req.getParameter("pls");
			String id = (String)req.getSession().getAttribute("MemId");
			System.out.println("trnslr: " + trnslr);
			
			try {
				
				BookDao bookDao = BookDaoImpl.getInstance();	
				System.out.println("trnslr : " + trnslr);
				Book chkBook = bookDao.selectBookByNameAndWriterNameAndPls(bookName, authr, trnslr, pls);
				System.out.println(chkBook);
				System.out.println("111");
				
				if(chkBook != null) {
					Map<String, String> map = new HashMap<>();
					map.put("result", "bookHave");
					
					ObjectMapper om = new ObjectMapper();
					String json = om.writeValueAsString(map);
					res.setContentType("application/json;charset=UTF-8");
					PrintWriter pw = res.getWriter();
					pw.print(json);
					pw.flush(); 
					System.out.println("22");
					return null;
				}
				
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return null;
	}

}
