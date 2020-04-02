<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../adminInclude/adminHeader.jsp" %>
<%@ include file="../adminInclude/adminSideMenu3.jsp" %>
<style>
	#mber_form_container{
		border: 1px solid steelblue;
		width: 320px;
		margin: 10px auto 0;
	}
	#mber_form_container p{
		margin: 10px;
	}
	#mber_form_container p label{
		width: 150px;
		float: left;
	}
</style>
<article class="contentWrap">
	<form>
		<p>
			<input type="radio" name="choiceBookColums">도서코드
			<input type="radio" name="choiceBookColums">도서명
			<input type="text" name="search">
			<button>검색</button>
		</p>
	</form>
	<div id="mber_form_container">
		<form>
			<p>
				<label>회원ID</label>
				<input type="text" name="mber_id">
			</p>
			<p>
				<label>회원이름</label>
				<input type="text" name="mber_name">
			</p>
			<p>
				<label>회원등급</label>
				<input type="text" name="mber_id2">
			</p>
			<p>
				<label>대여가능여부</label>
				<input type="text" name="mber_id3">
			</p>
			<p>
				<label>대여가능권수</label>
				<input type="text" name="mber_id4">
			</p>			
		</form>
	</div>
</article>
	
<%@ include file="../adminInclude/adminFooter.jsp" %>