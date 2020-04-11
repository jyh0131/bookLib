package com.yi.handler.user.book;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yi.dao.RecommendationDao;
import com.yi.dao.impl.RecommendationDaoImpl;
import com.yi.model.Recommendation;
import com.yi.mvc.CommandHandler;

public class UserBookRecomDetailHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		try {
			RecommendationDao dao = RecommendationDaoImpl.getInstance();
			Recommendation item = dao.selectRecommendationByLastNo();
			
			req.setAttribute("item", item);
			return "/WEB-INF/view/user/book/uesrBookRecomDetali.jsp";
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

}
