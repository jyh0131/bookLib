<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../userInclude/userHeader.jsp" %>
<style>

</style>
<article>
	<form action="login.do" method="post">
		<fieldset>
				<p>
					<label>아이디</label>
					<input type="text" name="id">
				</p>
				<p>
					<label>비밀번호</label>
					<input type="password" name="password">
				</p>
				<p>
					<input type="submit" value="로그인">
				</p>
		</fieldset>
	</form>
		<c:if test="${error == 'notMatchID' }">
			<span class="error">없는 ID입니다.</span>
		</c:if>
</article>

<%@ include file="../userInclude/userFooter.jsp" %>