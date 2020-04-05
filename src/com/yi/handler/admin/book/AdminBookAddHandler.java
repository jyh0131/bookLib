package com.yi.handler.admin.book;

import java.io.File;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.codehaus.jackson.map.ObjectMapper;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.yi.dao.BookDao;
import com.yi.dao.LargeClassificationDao;
import com.yi.dao.MiddleClassificationDao;
import com.yi.dao.PublishingCompanyDao;
import com.yi.dao.impl.BookDaoImpl;
import com.yi.dao.impl.LargeClassificationDaoImpl;
import com.yi.dao.impl.MiddleClassificationDaoImpl;
import com.yi.dao.impl.PublishingCompanyDaoImpl;
import com.yi.model.Book;
import com.yi.model.LargeClassification;
import com.yi.model.MiddleClassification;
import com.yi.model.PublishingCompany;
import com.yi.mvc.CommandHandler;

public class AdminBookAddHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		// TODO Auto-generated method stub
		if(req.getMethod().equalsIgnoreCase("get")) {		
			String lcNo = req.getParameter("lcNo");
			LargeClassification lc = new LargeClassification();
			if(lcNo != null) {				
				lc.setLclasNo(Integer.parseInt(req.getParameter("lcNo")));
			}
			
			String plsSchName = req.getParameter("plsSchName");
			System.out.println("plsSchName: "+plsSchName);
			
			try {
				PublishingCompanyDao plsDao = PublishingCompanyDaoImpl.getInstance();
				List<PublishingCompany> plsList = plsDao.selectPublishingCompanyByAll();
				req.setAttribute("plsList", plsList);
				
				LargeClassificationDao lcDao = LargeClassificationDaoImpl.getInstace();
				List<LargeClassification> lcList = lcDao.selectLargeClassificationByAll();
				req.setAttribute("lcList", lcList);

				MiddleClassificationDao mlDao = MiddleClassificationDaoImpl.getInstance();
				List<MiddleClassification> mlList = mlDao.selectMiddleClassificationGroupLc(lc);
				
				if(plsSchName != null) {
					List<PublishingCompany> schPlsList = plsDao.selectPublishingCompanyByNameAll(plsSchName);
					req.setAttribute("schPlsList", schPlsList);
					
					ObjectMapper om = new ObjectMapper();
					String json = om.writeValueAsString(schPlsList);
					res.setContentType("application/json;charset=UTF-8");
					PrintWriter out = res.getWriter();
					out.print(json);
					out.flush();
					return null;
				}
				
				if(mlList != null) {					
					req.setAttribute("mlList", mlList);				
						
					ObjectMapper om = new ObjectMapper();
					String json = om.writeValueAsString(mlList);
					res.setContentType("application/json;charset=UTF-8");
					PrintWriter out = res.getWriter();
					out.print(json);
					out.flush();
					return null;
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			return "/WEB-INF/view/admin/book/adminBookInsertForm.jsp";
		} else if(req.getMethod().equalsIgnoreCase("post")) {
			
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
			System.out.println(uploadPath);
			
			
			try {
				BookDao dao = BookDaoImpl.getInstance();
				String bookCode = null;
				
				// 카테고리 번호
				int lcNo = Integer.parseInt(multi.getParameter("lcNo"));
				int mlNo = Integer.parseInt(multi.getParameter("mlNo"));
				String catLastCode = dao.selectBookByCatLastCode(lcNo, mlNo);
				
				// 중복도서 번호
				String bName = multi.getParameter("bookName").trim();
				String aName = multi.getParameter("authrName").trim();
				int pls = Integer.parseInt(multi.getParameter("pls"));
				String overlapCode = dao.selectBookByOverlapBookLastCode(bName, aName, pls);
				
				if(catLastCode != null) {
					if(overlapCode != null) {
						String[] CodeArr = overlapCode.split("-");
						int newNum = Integer.parseInt(CodeArr[1]) + 1;
						bookCode = CodeArr[0] + "-" + newNum;
						System.out.println("중복도서 코드 생성 : " + bookCode);
					} else {
						String[] CodeArr1 = catLastCode.split("\\.");
						String[] CodeArr2 = CodeArr1[1].split("-");
						int newNum = Integer.parseInt(CodeArr2[0]) + 1;
						bookCode = CodeArr1[0] + "." + String.format("%03d", newNum) + "-1";
						System.out.println("카테고리 코드 생성 : " + bookCode);
					}
				} else {
					bookCode = String.format("%02d%02d", lcNo, mlNo) + ".001-1";
					System.out.println("완전 새로운 코드 생성: " + bookCode);
				}
				
				String getPblcDate = multi.getParameter("pblicteYear");
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
				Date getPlcDate = sdf.parse(getPblcDate);
				
				
				Book book = new Book();
				book.setBookCode(bookCode);
				book.setBookName(bName);
				book.setAuthrName(aName);
				if(multi.getParameter("trnslrName") != null) {
					book.setTrnslrName(multi.getParameter("trnslrName").trim());
				}
				book.setPls(new PublishingCompany(pls));
				book.setPblicteYear(getPlcDate);
				book.setBookPrice(Integer.parseInt(multi.getParameter("bookPrice")));
				book.setLendPsbCdt(Integer.parseInt(multi.getParameter("lendPsbCdt")));
				book.setTotalLeCnt(0);
				book.setLcNo(new LargeClassification(lcNo));
				book.setMlNo(new MiddleClassification(mlNo));
				book.setRegistDate(new Date());
				book.setDsuseCdt(0);
				book.setBookImgPath(multi.getFilesystemName("bookImgPath"));
				
				dao.insertBook(book);
				
				req.setAttribute("bookCode", bookCode);
				req.setAttribute("addResult", true);
				req.setAttribute("bookName", bName);
				
				
				res.sendRedirect(req.getContextPath()+"/admin/book/add.do");
				return null;
				
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return null;
	}

}
