package com.yi.handler.admin;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yi.dao.BookDao;
import com.yi.dao.LendingDao;
import com.yi.dao.RecommendationDao;
import com.yi.dao.impl.BookDaoImpl;
import com.yi.dao.impl.LendingDaoImpl;
import com.yi.dao.impl.RecommendationDaoImpl;
import com.yi.model.Recommendation;
import com.yi.mvc.CommandHandler;

public class AdminHomeHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		try {
			
			/*추천도서*/
			RecommendationDao dao = RecommendationDaoImpl.getInstance();
			Recommendation recom = dao.selectRecommendationByLastNo();
			req.setAttribute("recom", recom);
			/*---------------------------------------------*/
			/* home에 신착, 대여, 연체 (전월대비 비교)/(금년의 총 카운팅)을 위한 변수 생성  */
			Calendar cal = Calendar.getInstance();
			int y = cal.get(Calendar.YEAR);
			int m = cal.get(Calendar.MONTH)+1;
			int m2 = cal.get(Calendar.MONTH);
			//simpleDateformat 생성
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			//Dao 객체 생성
			BookDao bookDao = BookDaoImpl.getInstance();
			LendingDao lendingDao = LendingDaoImpl.getInstance();
			//월별 비교 위한 날짜 생성
			String monthDate = y+"-"+m+"-01";
			String monthDate2 = y+"-"+m2+"-01";
			Date monthD = sdf.parse(monthDate);
			Date monthD2 = sdf.parse(monthDate2);
			//월별 신착도서 비교를 위한 값 출력
			int[] newCnt = bookDao.selectCountByCateDate(monthD);
			int[] newCnt2 = bookDao.selectCountByCateDate(monthD2);
			int newSum = sum(newCnt);
			int newSum2 = sum(newCnt2);
			int newRes = newSum-newSum2;
			System.out.println("신착도서 비교 : "+newRes);
			//월별 대여도서 비교를 위한 값 출력
			int[] lendngCnt = bookDao.selectLendingCategoryCnt(monthD);
			int[] lendngCnt2 = bookDao.selectLendingCategoryCnt(monthD2);
			int lendingSum = sum(lendngCnt);
			int lendingSum2 = sum(lendngCnt2);
			int lendingRes = lendingSum - lendingSum2;
			System.out.println("대여도서 비교 : "+lendingRes);
			//월별 연체도서 비교를 위한 값 출력
			int overdueCnt = lendingDao.showOverdueBooCntMonth(monthD);
			int overdueCnt2 = lendingDao.showOverdueBooCntMonth(monthD);
			int overdueRes = overdueCnt - overdueCnt2;
			System.out.println("연체도서 비교 : "+overdueRes);
			//금년도 카운팅을 위한 날짜 생성
			String yearDate = y+"-01-01";
			Date yearD = sdf.parse(yearDate);
			int newYearCnt = bookDao.selectCountByCateDateYear(yearD);
			System.out.println("올해 신착 도서 : "+newYearCnt);
			int lendYearCnt = bookDao.selectLendingCategoryYearCnt(yearD);
			System.out.println("올해 대여 도서 : "+lendYearCnt);
			int overdueYearCnt = lendingDao.showOverdueBooCntYear(yearD);
			System.out.println("올해 연체 도서 : "+overdueYearCnt);
			req.setAttribute("newRes", newRes);
			req.setAttribute("lendingRes", lendingRes);
			req.setAttribute("overdueRes", overdueRes);
			req.setAttribute("newYearCnt", newYearCnt);
			req.setAttribute("lendYearCnt", lendYearCnt);
			req.setAttribute("overdueYearCnt", overdueYearCnt);
			req.setAttribute("y", y);
			/*---------------------------------------------*/
			return "/WEB-INF/view/admin/adminHome.jsp";
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	public static int sum(int[] array) {
		int sum = 0;

		for (int i = 0; i < array.length; i++)
			sum += array[i];

		return sum;
	}
}
