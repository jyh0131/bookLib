package com.yi.handler.admin.book;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.yi.dao.BookDao;
import com.yi.dao.LargeClassificationDao;
import com.yi.dao.PublishingCompanyDao;
import com.yi.dao.impl.BookDaoImpl;
import com.yi.dao.impl.LargeClassificationDaoImpl;
import com.yi.dao.impl.PublishingCompanyDaoImpl;
import com.yi.model.Book;
import com.yi.model.LargeClassification;
import com.yi.model.PublishingCompany;
import com.yi.mvc.CommandHandler;

public class AdminBookUpdateHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		// TODO Auto-generated method stub
		if(req.getMethod().equalsIgnoreCase("get")) {
			String bookCode = req.getParameter("code");
			System.out.println("bookCode : " + bookCode);
			
			try {
				PublishingCompanyDao plsDao = PublishingCompanyDaoImpl.getInstance();
				List<PublishingCompany> plsList = plsDao.selectPublishingCompanyByAll();
				req.setAttribute("plsList", plsList);
				
				BookDao dao = BookDaoImpl.getInstance();
				Book item = dao.selectBookByCode(new Book(bookCode));
				
				System.out.println("item : " + item);
				
				req.setAttribute("item", item);
				return "/WEB-INF/view/admin/book/adminBookUpdateForm.jsp";
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
				BookDao dao = BookDaoImpl.getInstance();
				Book book = new Book();
				book.setBookCode(multi.getParameter("bookCode"));
				book.setBookName(multi.getParameter("bookName").trim());
				book.setAuthrName(multi.getParameter("authrName").trim());
				if(multi.getParameter("trnslrName") != null) {
					book.setTrnslrName(multi.getParameter("trnslrName").trim());
				}
				book.setBookPrice(Integer.parseInt(multi.getParameter("bookPrice")));
				book.setPls(new PublishingCompany(Integer.parseInt(multi.getParameter("pls"))));
				
				String getPblcDate = multi.getParameter("pblicteYear");
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
				Date getPlcDate = sdf.parse(getPblcDate);
				book.setPblicteYear(getPlcDate);
				
				book.setBookPrice(Integer.parseInt(multi.getParameter("bookPrice")));
				book.setLendPsbCdt(Integer.parseInt(multi.getParameter("lendPsbCdt")));
				
				if(multi.getFilesystemName("bookImgPath") != null ) {					
					book.setBookImgPath(multi.getFilesystemName("bookImgPath"));
				}
				
				dao.updateBook(book);
				
				res.sendRedirect(req.getContextPath()+"/admin/book/list.do");
				return null;
				
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return null;
	}

}
