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
import com.yi.model.Member;
import com.yi.model.ZipCode;
import com.yi.mvc.CommandHandler;

public class UserMemberProfileHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		if(req.getMethod().equalsIgnoreCase("get")) {
			String id = (String)req.getSession().getAttribute("MemId");

			
			try {
				MemberDao dao = MemberDaoImpl.getInstance();
				Member memberInfo = dao.JSPSelectUpdateMember(new Member(id));
				
				req.setAttribute("memberInfo", memberInfo);
				
				return "/WEB-INF/view/user/member/userMemberProfile.jsp";
				
			}catch (Exception e) {
				e.printStackTrace();
			}
			
			
		}else if(req.getMethod().equalsIgnoreCase("post")) {
			String uploadPath = req.getRealPath("upload");
			File dir = new File(uploadPath);
			if(dir.exists() == false){
				dir.mkdir();
			}
			System.out.println(uploadPath);
			int size = 1024*1024*10;
			
			MultipartRequest multi = new MultipartRequest(req,
														uploadPath,
														size,
														"UTF-8",
														new DefaultFileRenamePolicy());
			
			try {
				MemberDao dao = MemberDaoImpl.getInstance();
				Member member = new Member();
				
				
				member.setMberId(multi.getParameter("id"));
				String name=multi.getParameter("name");
				member.setMberName(name);
				member.setMberPass(multi.getParameter("pass"));
				
				String birthStr = multi.getParameter("birthday");
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
				Date birthday = sdf.parse(birthStr);
				
				member.setMberBrthdy(birthday);
				member.setMberTel(multi.getParameter("phone"));
				member.setMberZip(new ZipCode(Integer.parseInt(multi.getParameter("zipCode"))));
				member.setMberBassAd(multi.getParameter("baseAddress"));
				member.setMberDetailAd(multi.getParameter("detailAddress"));

				if(multi.getFilesystemName("memberImgPath") != null ) {	
					member.setMemberImgPath(multi.getFilesystemName("memberImgPath"));
				}

				dao.updateMember(member);
				
				//프로필 수정시 이름바뀌는 부분
			
				
				String nameRe = (String)req.getSession().getAttribute("Mem");
				nameRe = name;
				req.setAttribute("Mem", nameRe);
	
				res.sendRedirect(req.getContextPath()+"/user/home.do");
				return null;
				
			}catch (Exception e) {
				e.printStackTrace();
			}
			
		}
		return null;
	}


}
