package com.yi.handler.admin.book;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yi.mvc.CommandHandler;

import jxl.Workbook;
import jxl.write.Label;
import jxl.write.WritableSheet;
import jxl.write.WritableWorkbook;

public class AdminBookReastExcelAddHandler implements CommandHandler {

	private File file;
	private int fileNum = 1;

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		if (req.getMethod().equalsIgnoreCase("post")) {
			//파일 생성 후 저장
			Date today = new Date();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			String dateSdf = sdf.format(today);
			String fileName = "신청도서리스트(" + dateSdf + ")";
			
			String uploadPath = req.getRealPath("excel");
			File dir = new File(uploadPath);
			if(dir.exists() == false){
				dir.mkdir();
			}
			
			System.out.println(uploadPath);
			
			WritableWorkbook workbook = null;
			WritableSheet sheet = null;
			Label label = null;
			
			file = new File(uploadPath+"\\"+fileName+(fileNum++)+".xls");
			if(!file.exists()) {
				file.createNewFile();
			} else {
				System.out.println("중복됨");
				fileNum++;
				file = new File(uploadPath+"\\"+fileName+"_"+fileNum+".xls");
				file.createNewFile();
			}
			
			// 데이터
			String[] title = { "no", "신청도서명", "저자", "역자", "출판사", "신청회원수", "신청일자", "입고여부" };
			String[] keys = {"no", "name", "auth", "trns", "pls", "cnt", "date", "whCdt"};
			String[] no = req.getParameterValues("no");
			String[] bookName = req.getParameterValues("bookName");
			String[] auth = req.getParameterValues("auth");
			String[] trns = req.getParameterValues("trns");
			String[] pls = req.getParameterValues("pls");
			String[] cnt = req.getParameterValues("cnt");
			String[] date = req.getParameterValues("date");
			String[] whCdt = req.getParameterValues("whCdtRes");
			
			for(int i=0; i<whCdt.length; i++) {
				System.out.print("whCdt: " + whCdt[i]);
			}
			
			
			Map<String, String> titleMap = new HashMap<String, String>();
			for(int i=0; i<8; i++) {
				titleMap.put(keys[i], title[i]);
			}
					
			List<Map<String, String>> list = new ArrayList<Map<String,String>>();
			list.add(titleMap);
			
			for(int i=0; i<no.length; i++) {		
				Map<String, String> dataMap = new HashMap<String, String>();
				dataMap.put("no", no[i]);
				dataMap.put("name", bookName[i]);
				dataMap.put("auth", auth[i]);
				dataMap.put("trns", trns[i]);
				dataMap.put("pls", pls[i]);
				dataMap.put("cnt", cnt[i]);
				dataMap.put("date", date[i]);
				dataMap.put("whCdt", whCdt[i]);
				list.add(dataMap);
			}
			
			try {
				workbook = Workbook.createWorkbook(file);
				workbook.createSheet("sheet1", 0);
				sheet = workbook.getSheet(0);
				
				// 타이틀
				for(int i=0; i<list.size(); i++) {
					Map<String, String> rs = list.get(i);
					label = new Label(0, i, rs.get("no"));
					sheet.addCell(label);
					
					label = new Label(1, i, rs.get("name"));
					sheet.addCell(label);
					
					label = new Label(2, i, rs.get("auth"));
					sheet.addCell(label);
					
					label = new Label(3, i, rs.get("trns"));
					sheet.addCell(label);
					
					label = new Label(4, i, rs.get("pls"));
					sheet.addCell(label);
					
					label = new Label(5, i, rs.get("cnt"));
					sheet.addCell(label);
					
					label = new Label(6, i, rs.get("date"));
					sheet.addCell(label);
					
					label = new Label(7, i, rs.get("whCdt"));
					sheet.addCell(label);
				}
				
				workbook.write();
				workbook.close();
				
				res.sendRedirect(req.getContextPath() + "/admin/book/bookReqstList.do");
				return null;
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			

			
		}
		return null;
	}

}
