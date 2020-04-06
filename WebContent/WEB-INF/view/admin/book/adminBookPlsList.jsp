<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="../../adminInclude/adminHeader.jsp" %>
<%@ include file="../../adminInclude/adminSideMenu1.jsp" %>

<article class="contentWrap">
	<h2 class="pageTitle">출판사 관리</h2>
	
	<div class="listWrap">
		<div class="searchBox">
			<form action="">
				<label>출판사 코드</label>
				<input type="text" name="plsNo" placeholder="출판사코드입력"/>
				<input type="text" name="plsname" placeholder="출판사이름입력" />
				<input type="submit" value="검색" class="btnOrange" />
			</form>
			<a class="btnOrange" href="#">등록</a>
		</div>
		<div class="list">
			<table id="plsList">
				<tr>
					<td>no</td>
					<td>출판사코드</td>
					<td>출판사이름</td>
					<td>출판사관리</td>
				</tr>
			</table>
		</div>
	</div>
</article>

<%@ include file="../../adminInclude/adminFooter.jsp" %>