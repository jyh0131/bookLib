package com.yi.handler.user;

import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.codehaus.jackson.map.ObjectMapper;

import com.yi.dao.MemberDao;
import com.yi.dao.impl.MemberDaoImpl;
import com.yi.model.Member;
import com.yi.mvc.CommandHandler;

public class UserIdCheckHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
			try {
				String id = req.getParameter("id");
				MemberDao userDao = MemberDaoImpl.getInstance();
				Member member = new Member();
				member.setMberId(id);
				
				Member IdCheck = userDao.selectMemberByNo(member);
				
				Map<String, String> map  = new HashMap<String,String>();
				map.put("변경", "성공");
				
				ObjectMapper om = new ObjectMapper();
				String json = om.writeValueAsString(member);
				
				res.setContentType("application/json;charset=UTF-8");
				PrintWriter pw = res.getWriter();
				pw.print(json);
				pw.flush();
				
			}catch (Exception e) {
				e.printStackTrace();
			}
		return null;
	}

}
