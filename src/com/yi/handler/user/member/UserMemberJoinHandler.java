package com.yi.handler.user.member;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.yi.dao.MemberDao;
import com.yi.dao.impl.MemberDaoImpl;
import com.yi.model.Grade;
import com.yi.model.Member;
import com.yi.model.ZipCode;
import com.yi.mvc.CommandHandler;

public class UserMemberJoinHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		if(req.getMethod().equalsIgnoreCase("get")) {
			
			return "/WEB-INF/view/user/member/userJoin.jsp";
			
		}else if(req.getMethod().equalsIgnoreCase("post")) {
			
			
			String uploadPath = req.getRealPath("upload");
			File dir = new File(uploadPath);
			if(dir.exists() == false){
				dir.mkdir();
			}
			
			int size = 1024*1024*10;
			
			MultipartRequest multi = new MultipartRequest(req,
														uploadPath,
														size,
														"UTF-8",
														new DefaultFileRenamePolicy());
			
			
			try{
				String id = multi.getParameter("id");
				String birthStr = multi.getParameter("birthday");
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
				Date birthday = sdf.parse(birthStr);
				String name = multi.getParameter("name");
				MemberDao userDao = MemberDaoImpl.getInstance();
				
				
				req.setAttribute("name",name);
				
				Member member = new Member();
				member.setMberId(multi.getParameter("id"));
				member.setMberPass(multi.getParameter("pass"));
				member.setMberName(name);
				member.setMberBrthdy(birthday);
				member.setMberTel(multi.getParameter("phone"));
				member.setMberZip(new ZipCode(Integer.parseInt(multi.getParameter("zipCode"))));
				member.setMberBassAd(multi.getParameter("baseAddress"));
				member.setMberDetailAd(multi.getParameter("detailAddress"));
				member.setMemberImgPath(multi.getFilesystemName("memberImgPath"));
				member.setGrade(new Grade(1));
				member.setWdrCdt(0);
				member.setLendBookCnt(0);
				member.setLendPsbCdt(0);
				member.setOdCnt(0);
				member.setTotalLeCnt(0);
				member.setJoinDt(new Date());
				
				userDao.insertMember(member);
			
				res.sendRedirect(req.getContextPath()+"/user/home.do");
				return null;
			}catch (Exception e) {
				e.printStackTrace();
			}
			
		}
		return null;
	}

}
