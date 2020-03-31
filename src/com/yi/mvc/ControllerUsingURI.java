package com.yi.mvc;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Properties;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ControllerUsingURI extends HttpServlet {
	private HashMap<String, CommandHandler> commandHandlerMap = new HashMap<>();
	
	@Override
	public void init() throws ServletException { 
		//Map 안에 command와 class가 담기게 처리함
		String configFile = getInitParameter("configFile"); // properties 파일 위치
		Properties prop = new Properties();
		String configFilePath = getServletContext().getRealPath(configFile); //RealPath : 절대 주소
		try (FileReader fis = new FileReader(configFilePath)) { //FileReader : 파일을 열어서 읽음 -> properties 파일을 열어서 읽음
			prop.load(fis);
		} catch (Exception e) {
			throw new ServletException(e);
		}
		
		Iterator KeyIter = prop.keySet().iterator();
		while(KeyIter.hasNext()) { // 키가 있을 경우 실행
			String command = (String)KeyIter.next(); // ex) simple.do를 가져옴 (커멘드)
			String handlerClassName = prop.getProperty(command); // 값 ex) com.yi.handler.SimpleHandler
			try {
				// 단순한 스트링을 클래스화 한 것 / 인스턴스화 / map에 넣는 작업
				Class<?> handlerClass = Class.forName(handlerClassName);
				CommandHandler handlerInstance = 
						(CommandHandler) handlerClass.newInstance();
				commandHandlerMap.put(command, handlerInstance);
			} catch (Exception e) {
				throw new ServletException(e);
			}
		}
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		process(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		process(req, resp);
	}
	
	private void process(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String command = request.getRequestURI(); // MVCProject/simple.do
		if(command.indexOf(request.getContextPath()) == 0) {
			// /simple.do
			command = command.substring(request.getContextPath().length());
		}
		CommandHandler handler = commandHandlerMap.get(command);
		if(handler == null) { // 없는 커멘드를 썻을 경우 
			handler = new NullHandler();
		}
		String viewPage = null;
		
		try {
			viewPage = handler.process(request, response); //simpleForm.jsp
		} catch (Exception e) {
			e.printStackTrace();
			throw new ServletException(e);
		}
		if(viewPage != null) { 
			RequestDispatcher dispather = request.getRequestDispatcher(viewPage);
			dispather.forward(request, response);
		}
	}
}
