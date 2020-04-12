package com.yi.handler.user;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yi.dao.BookDao;
import com.yi.dao.LendingDao;
import com.yi.dao.MemberDao;
import com.yi.dao.RecommendationDao;
import com.yi.dao.impl.BookDaoImpl;
import com.yi.dao.impl.LendingDaoImpl;
import com.yi.dao.impl.MemberDaoImpl;
import com.yi.dao.impl.RecommendationDaoImpl;
import com.yi.model.Book;
import com.yi.model.Lending;
import com.yi.model.Member;
import com.yi.model.Recommendation;
import com.yi.mvc.CommandHandler;

public class UserHomeHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		
		
		try {
			RecommendationDao recomDao = RecommendationDaoImpl.getInstance();
			Recommendation recom = recomDao.selectRecommendationByLastNo();
			req.setAttribute("recom", recom);
			
			LendingDao lendDao = LendingDaoImpl.getInstance();
			List<Lending> lendList = lendDao.selectLendingBastList(8);
			req.setAttribute("lendList", lendList);
			
			BookDao bookDao = BookDaoImpl.getInstance();
			List<Book> newList = bookDao.selectNewBookList(8);
			req.setAttribute("newList", newList);
			
			
			return "/WEB-INF/view/user/userHome.jsp";
		
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
		
	}

}
