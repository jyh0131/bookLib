package com.yi.handler.admin;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yi.dao.RecommendationDao;
import com.yi.dao.impl.RecommendationDaoImpl;
import com.yi.model.Recommendation;
import com.yi.mvc.CommandHandler;

public class AdminHomeHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		// TODO Auto-generated method stub
		
		/*추천도서*/
		try {
			RecommendationDao dao = RecommendationDaoImpl.getInstance();
			
			Recommendation recom = dao.selectRecommendationByLastNo();
			req.setAttribute("recom", recom);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "/WEB-INF/view/admin/adminHome.jsp";
	}

}
