<%@page import="java.util.ArrayList"%>
<%@page import="javax.mail.Transport"%>
<%@page import="javax.mail.Message"%>
<%@page import="javax.mail.internet.MimeMessage"%>
<%@page import="javax.mail.internet.InternetAddress"%>
<%@page import="javax.mail.Address"%>
<%@page import="com.yi.handler.admin.lending.SMTPAuthenticatior"%>
<%@page import="javax.mail.internet.MimeMessage"%>
<%@page import="javax.mail.Session"%>
<%@page import="javax.mail.Authenticator"%>
<%@page import="java.util.Properties"%>

<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");










String from = "ku0788@naver.com";
String[] to = request.getParameterValues("to");//받을 사람의 주소...... 1개씩 처리 또는 단체로 처리해야 하는데
String subject = "대구 도서관에서 안내드립니다.";
String content = "님께서 대출 하신 도서가 연체 중에 있습니다. 빠른 시일 내 방문하셔서 반납해주시길 바랍니다.";
// 입력값 받음
 
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
    Address[] toAddr = new InternetAddress[to.length];
	for(int i =0; i<to.length; i++){
		toAddr[i] = new InternetAddress(to[i]);
	}
    msg.addRecipients(Message.RecipientType.TO, toAddr); // 받는 사람 */
     /* msg.setRecipients(Message.RecipientType.TO, toAddr); */
     
    msg.setContent(content, "text/html;charset=UTF-8"); // 내용과 인코딩
     
    Transport.send(msg); // 전송
} catch(Exception e){
    e.printStackTrace();
    out.println("<script>alert('Send Mail Failed..');history.back();</script>");
    // 오류 발생시 뒤로 돌아가도록
    return;
}
System.out.println("sendMail.jsp에서 이제 전송전"); 
/* out.println("<script>alert('Send Mail Success!!');location.href='${pageContext.request.contextPath}/admin/lending/AdminLendingOverdue.jsp';</script>"); */
out.println("<script>alert('Send Mail Success!!');location.href='/WEB-INF/view/admin/lending/AdminLendingOverdue.jsp';</script>");
// 성공 시
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>

</body>
</html>