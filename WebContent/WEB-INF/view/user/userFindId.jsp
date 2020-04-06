<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../userInclude/userHeader.jsp"%>
<style>
.contentBg {
	height: 650px;
}

#topPoint {
	font-size: 24px;
	font-weight: bold;
	width: 893px;
	padding: 15px;
	border-bottom: 2px solid #7388a7;
	margin-left: 77px;
}

.member {
	width: 830px;
	height: 300px;
	margin: 70px auto;
	padding-top: 18px;
	border: 1px solid black;
}

.member p{
	font-size:20px;
	color: #7388a7;
	font-weight: bold;
	padding-left: 20px;
}

.findIdField {
	background: white;
	width: 408px;
	margin: 47px auto;
	height: 210px;
}

.input-area {
	width: 535px;
    height: 50px;
}

.input-area label {
	width: 100px;
	float: left;
	line-height: 37px;
}

.input-area input {
	width: 257px;
	height: 30px;
}

input[type="submit"] {
	margin: 25px 132px;
	width: 190px;
	height: 50px;
	background: #476fad;
	color: white;
	font-size: 20px;
	border: none;
}
[type="date"] {
	background:#fff url(https://cdn1.iconfinder.com/data/icons/cc_mono_icon_set/blacks/16x16/calendar_2.png)
		97% 50% no-repeat;
}
[type="date"]::-webkit-inner-spin-button {
	display: none;
}
[type="date"]::-webkit-calendar-picker-indicator {
	opacity: 0;
}
</style>

<script>
$(function() {
	var today = new Date();
	var day=today.getDate();
	var month = today.getMonth()+1;
	var year = today.getFullYear();
	if(day<10){
		day='0'+day;
	}
	if(month<10){
		month='0'+month;
	}
	today = year + '-' + month + '-' + day;
	document.getElementById("datefield").setAttribute("max", today);
	
})

</script>

<article>
	<div id="topPoint">
		<p>아이디 찾기</p>
	</div>
	<form action="findId.do" method="post">
		<div class="member">
			<p>아이디를 찾으시려면 아래사항을 입력하신 후 확인버튼을 누르세요.</p>
			<div class="findIdField">
				<div class="input-area">
					<label><img src="../images/check.jpg" width="20px"
						alt="체크이미지"> 이름</label> <input type="text" name="name" required>
				</div>
				<div class="input-area">
					<label><img src="../images/check.jpg" width="20px"
						alt="체크이미지"> 생년월일</label>
						<input type="date" name="birthday" id="datefield" min="1900-01-01" required="required">
				</div>
					<input type="submit" value="확인">
			</div>
		</div>
	</form>
	<c:choose>
		<c:when test="${error == 'nullId'}">
			<script>
				alert("등록된 아이디가 없습니다.");
			</script>
		</c:when>
		
		<c:when test="${Lib !=null}">
			<script>
				var flag =confirm("아이디는 [ ${Lib} ]입니다 로그인화면으로 이동하시겠어요?");
				if(flag==true){
					location.href = "${pageContext.request.contextPath}/user/login.do";
				}
			</script>
			<%
				session.removeAttribute("Lib");
			%>
		</c:when>
		
		<c:when test="${Mem !=null}">
			<script>
				var flag =confirm("아이디는 [ ${Mem} ]입니다 로그인화면으로 이동하시겠어요?");
				if(flag==true){
					location.href = "${pageContext.request.contextPath}/user/login.do";
				}
			</script>
				<%
				session.removeAttribute("Mem");
			%>
		</c:when>
	</c:choose>
</article>

<%@ include file="../userInclude/userFooter.jsp"%>