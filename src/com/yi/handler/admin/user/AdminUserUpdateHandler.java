package com.yi.handler.admin.user;

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

public class AdminUserUpdateHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		if(req.getMethod().equalsIgnoreCase("get")) {
			String id = req.getParameter("id");
			
			try {
				MemberDao dao = MemberDaoImpl.getInstance();
				Member item = dao.JSPSelectUpdateMember(new Member(id));
				
				req.setAttribute("item", item);
				
				return "/WEB-INF/view/admin/user/adminUserUpdateForm.jsp";
				
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
				
				res.sendRedirect(req.getContextPath()+"/admin/user/userList.do");
				return null;
				
			}catch (Exception e) {
				e.printStackTrace();
			}
			
		}
		return null;
	}

}
