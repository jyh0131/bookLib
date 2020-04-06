<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../userInclude/userHeader.jsp"%> 
<style>
.contentBg {
	height: 1050px;
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
    width: 860px;
    height: 670px;
    margin: 54px auto;
}
.findIdField {
 	width: 340px;
    margin: -30px auto;
}

.input-area {
	width: 209px;
    height: 70px;
    padding-bottom: 25px;
    position: relative;
}

.input-area label {
	width: 90px;
    float: left;
    font-size: 13px;
    font-weight: 900;
    padding: 2px 0px 8px 2px;
}

.input-area input {
    width: 330px;
    height: 48px;
}

input[type="submit"] {
	margin: 30px -2px;
    width: 336px;
    height: 63px;
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

#zip{
	width:195px;
}
#btn{
	width: 120px;
    height: 50px;
    background: #476fad;
    color: white;
    font-size: 20px;
    border: none;
    margin-left: 14px;
    position: absolute;
    top: 26px;
}
#base{
    margin:-12px 0 6px 0;
}
.error{
	display:none;
	font-size: 12px;
    color: red;
}

</style>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
		function sample4_execDaumPostcode() {
		    new daum.Postcode({
		        oncomplete: function(data) {
		            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
		            
					
		            // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
		            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
		            var roadAddr = data.roadAddress; // 도로명 주소 변수
		            var extraRoadAddr = ''; // 참고 항목 변수

		            // 법정동명이 있을 경우 추가한다. (법정리는 제외)
		            // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
		            if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
		                extraRoadAddr += data.bname;
		            }
		            // 건물명이 있고, 공동주택일 경우 추가한다.
		            if(data.buildingName !== '' && data.apartment === 'Y'){
		               extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
		            }
		            // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
		            if(extraRoadAddr !== ''){
		                extraRoadAddr = ' (' + extraRoadAddr + ')';
		            }

		            // 우편번호와 주소 정보를 해당 필드에 넣는다.
		            document.getElementById('sample4_postcode').value = data.zonecode;
		            document.getElementById("sample4_roadAddress").value = roadAddr;
		            document.getElementById("sample4_jibunAddress").value = data.jibunAddress;
		            
		            // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
		            if(roadAddr !== ''){
		                document.getElementById("sample4_extraAddress").value = extraRoadAddr;
		            } else {
		                document.getElementById("sample4_extraAddress").value = '';
		            }

		            var guideTextBox = document.getElementById("guide");
		            // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
		            if(data.autoRoadAddress) {
		                var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
		                guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
		                guideTextBox.style.display = 'block';

		            } else if(data.autoJibunAddress) {
		                var expJibunAddr = data.autoJibunAddress;
		                guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
		                guideTextBox.style.display = 'block';
		            } else {
		                guideTextBox.innerHTML = '';
		                guideTextBox.style.display = 'none';
		            }
		        }
		    }).open();
		}

$(function() {
	$("#btn").click(function() {
		sample4_execDaumPostcode();
	})
})		



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


$(function() {
	$("form").submit(function() {
		$(".error").css("display","none");
		
		$("#id").blur(function() {
			var idReg = /^[a-z0-9]{5,20}$/;
			var id = $("input[name='id']").val();
			if(idReg.test(id) ==false || id==""){	
				$("input[name='id']").next().css("display","inline");
				return false;
			}
		})

		
		var nameReg = /^[가-힣a-zA-Z]{1,20}$/;
		var name = $("input[name='name']").val();
		if(nameReg.test(name) ==false || name==""){
			$("input[name='name']").next().css("display","inline");
			return false;
		}
		
		var passReg = /^[a-zA-Z0-9!@#$%^&*()_-+=]{8,16}$/;
		var password = $("input[name='pass']").val();
		if(passReg.test(password) ==false || password==""){
			$("input[name='pass']").next().css("display","inline");
			return false;
		}
		
		var passCheck = $("input[name='passCheck']").val();
		if(password != passCheck){
			$("input[name='passCheck']").next().css("display","inline");
			return false;
		}
		
		var phoneReg =/^(010|011|017|018|019)-?[0-9]{3,4}-?[0-9]{4}$/;
		var phone =$("input[name='phone']").val();
		if(phoneReg.test(phone)==false || phone==""){
			$("input[name='phone']").next().css("display","inline");
			return false;
		}
		
	})
	
	$(function() {
		function checkId(){
			var oMsg = $("#idMsg");
			var idReg = /^[a-z0-9]{5,20}$/;
			var id = $("input[name='id']").val();
			var oInput =$("#id");
			
			if(id==""){
				showErrorMsg(oMsg,"필수 정보입니다.");
			}
		}
	})
	
	$("input[name='id']").on(onmouseout, function() {
		var id = $("input[name='id']").val();
		$.ajax({
			url:"idCheck.do",
			type:"get",
			data:{"id":id},
			success:function(res){
				console.log(res);
				
				
				if(res != null){
					alert("중복");
				}else{
					alert("사용가능");
				}
				
			}
		})
	})
})



</script>
<article>
	<div id="topPoint">
		<p>회원가입</p>
	</div>
	<form action="userJoin.do" method="post" autocomplete="off" enctype="multipart/form-data">
		<div class="member">
			<div class="findIdField">
				<div class="input-area">
					<label>아이디</label>
					 <input type="text" name="id" id="id" required>
					 <span class = "error" id="idMsg">5~20자의 영문 소문자, 숫자만 사용 가능합니다.</span>
				</div>
				<div class="input-area">
					<label>비밀번호</label>
					 <input type="password" name="pass" required>
					 <span class = "error">8~16자 영문 대 소문자, 숫자, 특수문자를 사용하세요.</span>
				</div>
				<div class="input-area">
					<label>비밀번호 재확인</label>
					 <input type="password" name="passCheck" required>
					 <span class = "error">비밀번호가 일치하지 않습니다.</span>
				</div>
				<div class="input-area">
					<label>이름</label>
					<input type="text" name="name" required>
					<span class="error">한글과 영문 대 소문자를 사용하세요. (특수기호, 공백 사용 불가)</span>
				</div>
				<div class="input-area">
					<label>생년월일</label>
						<input type="date" name="birthday" id="datefield" min="1900-01-01" required="required">
				</div>
				<div class="input-area">
					<label>휴대전화</label>
						<input type="text" name="phone" required>
						<span class="error">형식에 맞지 않는 번호입니다.</span>
				</div>
				
				<div class="input-area">
					<label>주소</label><br>
					<input type="text" name="zipCode" required id="zip"><button id="btn">검색</button>
				</div>
				<div class="input-area">
					<input type="text" name="baseAddress" id="base" required>
					<input type="text" name="detailAddress">
				</div>

					<input type="submit" value="가입하기">
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