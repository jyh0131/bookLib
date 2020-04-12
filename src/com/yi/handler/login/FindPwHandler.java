package com.yi.handler.login;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.yi.dao.LibrarianDao;
import com.yi.dao.MemberDao;
import com.yi.dao.impl.LibrarianDaoImpl;
import com.yi.dao.impl.MemberDaoImpl;
import com.yi.model.Librarian;
import com.yi.model.Member;
import com.yi.mvc.CommandHandler;

public class FindPwHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		if (req.getMethod().equalsIgnoreCase("get")) {

			return "/WEB-INF/view/login/findPw.jsp";

		} else if (req.getMethod().equalsIgnoreCase("post")) {

			try {
				String id = req.getParameter("id");
				String name = req.getParameter("name");
				String birthday = req.getParameter("birthday");
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
				Date brthdy = sdf.parse(birthday);

				MemberDao userDao = MemberDaoImpl.getInstance();
				Member member = new Member();
				member.setMberId(id);
				member.setMberName(name);
				member.setMberBrthdy(brthdy);

				LibrarianDao libDao = LibrarianDaoImpl.getInstance();
				Librarian libratian = new Librarian();
				libratian.setLbId(id);
				libratian.setLbName(name);
				libratian.setLbBirthDay(brthdy);

				Member findMemberPw = userDao.findMemberPw(member);
				Librarian findLibPw = libDao.findLibrarianPw(libratian);

				if (findMemberPw == null) {
					if (findLibPw == null) {
						HttpSession session = req.getSession();
						session.setAttribute("error", "nullId");

						return "/WEB-INF/view/login/findId.jsp";
					}
					
					StringBuffer newKey = createPw();
					String libPw = libDao.selectLibrarianById(libratian).getLbPass();
					String newPw = newKey.toString();
					String libId = libratian.getLbId();
					
					req.setAttribute("toName", libratian.getLbName());
					req.setAttribute("toId", libId);
					req.setAttribute("toPw", newPw);
					req.setAttribute("libPw", libPw);
					req.setAttribute("type", "lib");
					
					return "/WEB-INF/view/login/temporaryPwMail.jsp";
				}
				
				StringBuffer newKey = createPw();
				String newPw = newKey.toString();
				String mberId = member.getMberId();
				String mberPw = userDao.selectMemberByNo(member).getMberPass();
				
				req.setAttribute("toName", member.getMberName());
				req.setAttribute("toId", mberId);
				req.setAttribute("toPw", newPw);
				req.setAttribute("mberPw", mberPw);
				req.setAttribute("type", "mber");
	
				return "/WEB-INF/view/login/temporaryPwMail.jsp";

			} catch (Exception e) {
				e.printStackTrace();
			}

		}
		return null;
	}

	private StringBuffer createPw() {
		char[] charSet = {'0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 
						'A', 'B', 'C', 'D', 'E','F', 'G', 'H', 'I', 'J', 'K',
						'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 
						'V', 'W', 'X', 'Y', 'Z',
						'!', '@', '#', '$', '%', '^', '&', '+', '=', '.'};
		StringBuffer newKey = new StringBuffer();
		for(int i = 0; i<10; i++) {
			int idx = (int) (charSet.length * Math.random());
			newKey.append(charSet[idx]);
		}
		return newKey;
	}
}
