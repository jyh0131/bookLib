<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<style>
	table{
		border-collapse: collapse;
	}
	th, td{
		border: 1px solid steelblue;
	}
</style>
</head>
<body>
	<p>
		<input type="radio" name="choiceBookColums" value="code">도서코드
		<input type="radio" name="choiceBookColums" value="name">도서명
		<input type="text" name="bookSearch">
		<button id="book_search">검색1</button>
	</p>
	<table>
		<tr>
			<th>도서코드</th>
			<th>도서명</th>
			<th>저자/역자</th>
			<th>발행년도</th>
			<th>출판사명</th>
			<th>대여일</th>
			<th>반납일</th>
			<th>선택</th>
		</tr>
	</table>
</body>
</html>