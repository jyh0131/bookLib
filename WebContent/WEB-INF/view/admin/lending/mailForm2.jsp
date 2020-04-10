<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
    <div>
        <form action="/bookLib/sendMail.jsp" method="post">
            <table>
                <tr><th colspan="2">JSP 메일 보내기</th></tr>
                <tr><td>from</td><td><input type="text" name="from" value="ku0788@naver.com"/></td></tr>
                <tr><td>to</td><td><input type="text" name="to" value="${emailList }"/></td></tr>
                <tr><td>subject</td><td><input type="text" name="subject" value="연체 중입니다."/></td></tr>
                <tr><td>content</td><td><textarea name="content" style="width:170px; height:200px;">대구 도서관에서 안내 드립니다. 님께서 대출하신 도서가 연체 되었습니다. 도서 반납 부탁드립니다.</textarea></td></tr>
                <tr><td colspan="2" style="text-align:right;"><input type="submit" value="Transmission"/></td></tr>
            </table>
        </form>
    </div>
</body>
</html>