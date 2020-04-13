<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../userInclude/userHeader.jsp"%>
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
	width: 50px;
    margin: -24px auto;
}

.input-area {
	width: 209px;
	height: 70px;
	padding-bottom: 30px;
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
	background: #fff
		url(https://cdn1.iconfinder.com/data/icons/cc_mono_icon_set/blacks/16x16/calendar_2.png)
		97% 50% no-repeat;
}

[type="date"]::-webkit-inner-spin-button {
	display: none;
}

[type="date"]::-webkit-calendar-picker-indicator {
	opacity: 0;
}

#zip {
	width: 195px;
}

#btn {
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

#base {
	margin: -12px 0 6px 0;
}

.error {
	display: none;
	font-size: 11px;
	color: red;
	width: 350px;
	padding-top: 3px;
}
.getImg{
	position: absolute;
    top: 315px;
    left: 565px;
    border: 1px solid #ddd;
   	padding: 5px; 
}
.loadImg{
	width: 230px;
    height: 275px;
}
#memberImage{
    position: absolute;
    top: 619px;
    left: 617px;
}
#memberImage label{
    background: #476fad;
    color: white;
    font-size: 18px;
    width: 118px;
    display: block;
    height: 40px;
    text-align: center;
    line-height: 40px;
}
#id-area{
	margin-bottom:10px;
}
</style>
<script
	src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
function imageURL(input) {
	//이미지경로
    if (input.files && input.files[0]) {
        var reader = new FileReader();

        reader.onload = function(e) {
            $('.loadImg').attr('src', e.target.result)
        }
        reader.readAsDataURL(input.files[0]);
    }
}

	function address() {
		new daum.Postcode({
			oncomplete : function(data) {
				var roadAddr = data.roadAddress; // 도로명 주소 변수
				var extraRoadAddr = ''; // 참고 항목 변수
				if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
					extraRoadAddr += data.bname;
				}
				// 우편번호와 주소 정보를 해당 필드에 넣는다.
				document.getElementById('zip').value = data.zonecode;
				document.getElementById("base").value = roadAddr;
			}
		}).open();
	}
	
	$(function() {
		$("#btn").click(function() {
			address();
		})
	})
	
	$(function() {
		//생일달력을 오늘까지만 선택할수 있게하는 함수
		var now = new Date();
		var day = now.getDate();
		var month = (now.getMonth() + 1);
		var year = now.getFullYear();
		if (day < 10) {
			day = '0' + day;
		}
		if (month < 10) {
			month = '0' + month;
		}
		today = year + '-' + month + '-' + day;
		document.getElementById("dateField").setAttribute("max", today);
	})

				
	$(function() {
		$("input[name='id']").on("keyup", function() {
			var id = $("input[name='id']").val();
			$.ajax({
				url : "${pageContext.request.contextPath}/login/idCheck.do",
				type : "get",
				data : {"id" : id},
				success : function(res) {
					console.log(res);
					
					
					if (res != null) {
						$("input[name='id']").next().next().css("display", "block");
					}else if(res == null){
						$("input[name='id']").next().next().css("display", "none");
					}
				}
			})
		})
		
		//정규표현식 에러 떠있을때 가입 안되게 막음
	
		$("#id").blur(function() {
				var idReg = /^[a-z0-9@\_\-\.]{5,20}$/;
				var id = $("input[name='id']").val();
				if (idReg.test(id) == false || id == "") {
					$("input[name='id']").next().css("display", "block");
				}else if(idReg.test(id) == true){
					$("input[name='id']").next().css("display", "none");
				}
			})
			
			$("#name").blur(function(){
					var nameReg = /^[가-힣a-zA-Z]{1,20}$/;
					var name = $("input[name='name']").val();
					if (nameReg.test(name) == false || name == "") {
						$("input[name='name']").next().css("display", "block");
					}else if(nameReg.test(name)==true){
						$("input[name='name']").next().css("display", "none");
					}
			})
			$("#pass").blur(function(){
				var passReg = /^[a-zA-Z0-9!@#$%^&]{8,16}$/;
				var password = $("input[name='pass']").val();
				if (passReg.test(password) == false || password == "") {
					$("input[name='pass']").next().css("display", "block");
				}else if(passReg.test(password)==true){
					$("input[name='pass']").next().css("display", "none");
				}
			})
			$("#passCheck").blur(function(){
				var password = $("input[name='pass']").val();
				var passCheck = $("input[name='passCheck']").val();
				if (password != passCheck || passCheck=="") {
					$("input[name='passCheck']").next().css("display", "block");
				}else if(password == passCheck){
					$("input[name='passCheck']").next().css("display", "none");
				}
			})
				$("#phone").blur(function(){
				var phoneReg = /^(010|011|017|018|019)-?[0-9]{3,4}-?[0-9]{4}$/;
				var phone = $("input[name='phone']").val();
				if (phoneReg.test(phone) == false || phone == "") {
					$("input[name='phone']").next().css("display", "block");
				}else if(phoneReg.test(phone) ==true){
					$("input[name='phone']").next().css("display", "none");
				}
			}) 
			
			$("form").submit(function(){
			var idDuMsg = $("#idDuMsg").css("display");
			var idMsg = $("#idMsg").css("display");
			var passMsg = $("#passMsg").css("display");
			var passCheckMsg = $("#passCheckMsg").css("display");
			var nameMsg = $("#nameMsg").css("display");
			var birthMsg = $("#birthMsg").css("display");

			if(idDuMsg == "block" || idMsg =="block" || passMsg =="block" || passCheckMsg =="block" || nameMsg =="block" || birthMsg =="block"){
				alert("입력창을 다시 확인해주세요.");
				return false;
			}else{
				alert("[" +$("#name").val() + "]님의 회원가입이 완료되었습니다.");
			}
			
		})
	})
</script>
<article>
	<div id="topPoint">
		<p>회원가입</p>
	</div>
	<form action="Join.do" method="post" autocomplete="off" enctype="multipart/form-data">
		<div class="member">
			<div class="findIdField">
				<div class="input-area" id="id-area">
					<label>아이디</label> <input type="text" name="id" id="id" required>
					<span class="error" id="idDuMsg">5~20자의 영문 소문자와 숫자,특수기호(@_-.)만 사용 가능합니다.</span>
					<span class="error" id="idMsg">중복된 아이디입니다.</span>					
				</div>
				<div class="input-area">
					<label>비밀번호</label> <input type="password" name="pass" id="pass" required>
					<span class="error" id="passMsg">8~16자 영문 대 소문자, 숫자, 특수문자를 사용하세요.</span>
				</div>
				<div class="input-area">
					<label>비밀번호 재확인</label>
					 <input type="password" name="passCheck" id="passCheck"required> 
					 <span class="error" id="passCheckMsg">비밀번호가 일치하지 않습니다.</span>
				</div>
				<div class="input-area">
					<label>이름</label> <input type="text" name="name" required id="name">
					<span class="error" id="nameMsg">한글과 영문 대 소문자를 사용하세요. (특수기호, 공백 사용 불가)</span>
				</div>
				<div class="input-area">
					<label>생년월일</label> <input type="date" name="birthday" id="dateField" min="1900-01-01" required="required">
				</div>
				<div class="input-area">
					<label>휴대전화</label> <input type="text" name="phone" id="phone" required>
					<span class="error" id="birthMsg">형식에 맞지 않는 번호입니다.</span>
				</div>
				<div class="input-area">
					<label>주소</label><br> <input type="text" name="zipCode"
						required id="zip">
					<button id="btn">검색</button>
				</div>
				<div class="input-area">
					<input type="text" name="baseAddress" id="base" required> 
					<input type="text" name="detailAddress" id="detail" placeholder="상세주소를 입력해주세요.">
				</div>
				<div id="memberImage">
				<label>이미지 추가
					<input type="file" name="memberImgPath" style="display:none;" width="100px" onchange="imageURL(this);" />
				</label>
				</div>
				<input type="submit" value="가입하기">
			</div>
		</div>
	</form>
		<div class="getImg">
			<img class="loadImg" src="${pageContext.request.contextPath }/images/no-image.png"/>
		</div>

</article>
<%@ include file="../../userInclude/userFooter.jsp"%>