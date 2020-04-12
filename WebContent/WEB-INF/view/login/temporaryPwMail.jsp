<%@page import="com.yi.dao.impl.MemberDaoImpl"%>
<%@page import="com.yi.dao.MemberDao"%>
<%@page import="com.yi.dao.impl.LibrarianDaoImpl"%>
<%@page import="com.yi.dao.LibrarianDao"%>
<%@page import="com.yi.jdbc.JDBCUtil"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.mail.Message.RecipientType"%>
<%@page import="com.yi.handler.admin.lending.SMTPAuthenticatior"%>
<%@page import="javax.mail.Transport"%>
<%@page import="javax.mail.Message"%>
<%@page import="javax.mail.Address"%>
<%@page import="javax.mail.internet.InternetAddress"%>
<%@page import="javax.mail.internet.MimeMessage"%>
<%@page import="javax.mail.Session"%>
<%@page import="javax.mail.Authenticator"%>
<%@page import="java.util.Properties"%>
<%@page import="com.yi.handler.admin.lending.SMTPAuthenticatior"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	request.setCharacterEncoding("utf-8");	

	Connection conn = null;

	String from = "ku0788@naver.com";
	String toId = (String)request.getAttribute("toId");
	String toPw = (String)request.getAttribute("toPw");
	String toName = (String)request.getAttribute("toName");
	String type = (String)request.getAttribute("type");
	
	System.out.println("mtoName : " + toName);
	System.out.println("mtoId : " + toId);
	System.out.println("mtoPw : " + toPw);
	System.out.println("type : " + type);
	
	String subject = "3조 도서관에서 임시 비밀번호 발급 안내";
	String content = toName + "님의 임시 비밀번호 입니다. 임시비밀번호 : " + toPw;
	
	
	Properties p = new Properties(); // 정보를 담을 객체
	 
	p.put("mail.smtp.host","smtp.naver.com"); // 네이버 SMTP
	 
	p.put("mail.smtp.port", "465");
	p.put("mail.smtp.starttls.enable", "true");
	p.put("mail.smtp.auth", "true");
	p.put("mail.smtp.debug", "true");
	p.put("mail.smtp.socketFactory.port", "465");
	p.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
	p.put("mail.smtp.socketFactory.fallback", "false");
	// SMTP 서버에 접속하기 위한 정보들
	
	try{
		Authenticator auth = new SMTPAuthenticatior();
		Session ses = Session.getInstance(p, auth);
	     
	    ses.setDebug(true);
	     
	    MimeMessage msg = new MimeMessage(ses); // 메일의 내용을 담을 객체
	    msg.setSubject(subject); // 제목
	     
	    InternetAddress fromAddr = new InternetAddress(from);
	    msg.setFrom(fromAddr); // 보내는 사람
	     
	   /*  Address toAddr = new InternetAddress(to); */
	    Address toAddr = new InternetAddress(toId);
		msg.addRecipient(Message.RecipientType.TO, toAddr);
	     
	    msg.setContent(content, "text/html;charset=UTF-8"); // 내용과 인코딩
	     
	    Transport.send(msg); // 전송
	    
	    // 임시비밀번호 넣기
	    conn = JDBCUtil.getConnection();
	    conn.setAutoCommit(false);
	    
	    if(type.equals("lib")){
	    	LibrarianDao libDao = LibrarianDaoImpl.getInstance();
	    	libDao.updateLibTemporaryPw(toPw, toId);
	    	conn.commit();
	    } else if(type.equals("mber")){
	    	MemberDao userDao = MemberDaoImpl.getInstance();
	    	userDao.updateTemporaryPw(toPw, toId);
	    	conn.commit();
	    }
	    
	} catch(Exception e) {
		e.printStackTrace();
		conn.rollback();
		out.println("<script>alert('[오류]메일발송이 되지 않았습니다.');history.back();</script>");
		return;
	}
	
	out.println("<script>alert('임시비밀번호가 메일로 발송되었습니다.');location.href='http://localhost:8080/bookLib/login/login.do';</script>");
%>