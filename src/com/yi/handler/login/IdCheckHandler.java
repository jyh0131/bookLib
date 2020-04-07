package com.yi.handler.login;

import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.codehaus.jackson.map.ObjectMapper;

import com.yi.dao.LibrarianDao;
import com.yi.dao.MemberDao;
import com.yi.dao.impl.LibrarianDaoImpl;
import com.yi.dao.impl.MemberDaoImpl;
import com.yi.model.Librarian;
import com.yi.model.Member;
import com.yi.mvc.CommandHandler;

public class IdCheckHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
			try {
				String id = req.getParameter("id");
				MemberDao userDao = MemberDaoImpl.getInstance();
				Member member = new Member();
				member.setMberId(id);
				
				LibrarianDao libDao = LibrarianDaoImpl.getInstance();
				Librarian lib = new Librarian();
				lib.setLbId(id);
				
				Member idCheck = userDao.selectMemberByNo(member);
				Librarian librarianIdCheck = libDao.selectLibrarianById(lib);
				
				Map<String, String> map  = new HashMap<String,String>();
				map.put("변경", "성공");
				

				if(idCheck==null) {
					if(librarianIdCheck!=null) {
						ObjectMapper om = new ObjectMapper();
						String json = om.writeValueAsString(librarianIdCheck);
						
						
						res.setContentType("application/json;charset=UTF-8");
						PrintWriter pw = res.getWriter();
						pw.print(json);
						pw.flush();
					}else {
						ObjectMapper om = new ObjectMapper();
						String json = om.writeValueAsString(idCheck);
					
						res.setContentType("application/json;charset=UTF-8");
						PrintWriter pw = res.getWriter();
						pw.print(json);
						pw.flush();
					}
				}


			}catch (Exception e) {
				e.printStackTrace();
			}
		return null;
	}

}
