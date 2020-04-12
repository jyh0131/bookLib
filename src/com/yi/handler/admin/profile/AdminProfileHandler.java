package com.yi.handler.admin.profile;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.yi.dao.LibrarianDao;
import com.yi.dao.impl.LibrarianDaoImpl;
import com.yi.model.Librarian;
import com.yi.model.ZipCode;
import com.yi.mvc.CommandHandler;

public class AdminProfileHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		if (req.getMethod().equalsIgnoreCase("get")) {
			String id = (String) req.getSession().getAttribute("LibId");
			String pass = (String)req.getSession().getAttribute("LibPass");

			try {
				LibrarianDao dao = LibrarianDaoImpl.getInstance();
				Librarian libInfo = dao.JSPSelectUpdateLib(new Librarian(id));
			

				req.setAttribute("libInfo", libInfo);

				return "/WEB-INF/view/admin/profile/adminProfile.jsp";

			} catch (Exception e) {
				e.printStackTrace();
			}
			
		} else if (req.getMethod().equalsIgnoreCase("post")) {
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
				LibrarianDao dao = LibrarianDaoImpl.getInstance();
				Librarian lib = new Librarian();
				
				
				lib.setLbId(multi.getParameter("id"));
				String name=multi.getParameter("name");
				lib.setLbName(name);
				lib.setLbPass(multi.getParameter("pass"));
				
				String birthStr = multi.getParameter("birthday");
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
				Date birthday = sdf.parse(birthStr);
				
				lib.setLbBirthDay(birthday);
				lib.setLbTel(multi.getParameter("phone"));
				lib.setLbZip(new ZipCode(Integer.parseInt(multi.getParameter("zipCode"))));
				lib.setLbBassAd(multi.getParameter("baseAddress"));
				lib.setLbDetailAd(multi.getParameter("detailAddress"));
				

				if(multi.getFilesystemName("LibImgPath") != null ) {	
					lib.setLibImgPath(multi.getFilesystemName("LibImgPath"));
				}

				dao.updateLibrarianJsp(lib);
				
				res.sendRedirect(req.getContextPath()+"/admin/home.do");
				return null;
				
				//프로필 수정시 이름바뀌는 부분
			
				
			}catch (Exception e) {
				e.printStackTrace();
			}
		
		}
		return null;

	}
}
