package com.yi.handler.admin.statistics;

import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.codehaus.jackson.map.ObjectMapper;

import com.yi.dao.MemberDao;
import com.yi.dao.impl.MemberDaoImpl;
import com.yi.mvc.CommandHandler;

public class AdminMemberStatisticsHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		if(req.getMethod().equalsIgnoreCase("get")) {
			MemberDao memberDao = MemberDaoImpl.getInstance();
			int [] memberCnt = memberDao.selectMemberCounts();
			req.setAttribute("memberCnt", memberCnt);
			return "/WEB-INF/view/admin/statistics/adminMemberStatistics.jsp";
		}
		else if(req.getMethod().equalsIgnoreCase("post")) {
			String y = req.getParameter("year");
			int y2 = Integer.parseInt(y);
			y2--;
			String wantDate = y+"-01-01";
			String wantDate2 = y2+"-01-01";
			System.out.println("wantDate : "+wantDate);
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			Date d = sdf.parse(wantDate);
			Date d2 = sdf.parse(wantDate2);
			MemberDao memberDao = MemberDaoImpl.getInstance();
			int[] cnt = memberDao.selectMemberCountDate(d);
			System.out.println("cnt의 값 : "+ cnt.toString());
			int[] cnt2 = memberDao.selectMemberCountDate(d2);
			System.out.println("cnt2의 값 : "+ cnt2.toString());
			Map<String, Object> map = new HashMap<>();
			map.put("wantDate", cnt);
			map.put("wantDate2", cnt2);
			System.out.println("map까지 함");
			ObjectMapper om = new ObjectMapper();
			String json = om.writeValueAsString(map);
			res.setContentType("application/json;charset=UTF-8");
			PrintWriter out = res.getWriter();
			out.print(json);
			out.flush();
		}
		return null;
	}

}
