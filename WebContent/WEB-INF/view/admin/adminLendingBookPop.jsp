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
		<input type="radio" name="choiceBookColums" value="code">�����ڵ�
		<input type="radio" name="choiceBookColums" value="name">������
		<input type="text" name="bookSearch">
		<button id="book_search">�˻�1</button>
	</p>
	<table>
		<tr>
			<th>�����ڵ�</th>
			<th>������</th>
			<th>����/����</th>
			<th>����⵵</th>
			<th>���ǻ��</th>
			<th>�뿩��</th>
			<th>�ݳ���</th>
			<th>����</th>
		</tr>
	</table>
</body>
</html>