package com.yi.handler.admin.book;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yi.dao.RecommendationDao;
import com.yi.dao.impl.RecommendationDaoImpl;
import com.yi.model.Recommendation;
import com.yi.mvc.CommandHandler;

public class AdminBookRecomListHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		// TODO Auto-generated method stub
		try {
			RecommendationDao dao = RecommendationDaoImpl.getInstance();
			Recommendation recom = dao.selectRecommendationByLastNo();
			req.setAttribute("recom", recom);
			
			List<Recommendation> list = dao.selectRecommendationByAll();
			req.setAttribute("list", list);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "/WEB-INF/view/admin/book/adminBookRecomList.jsp";
	}

}
