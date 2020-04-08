<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../adminInclude/adminHeader.jsp" %>
<%@ include file="../../adminInclude/adminSideMenu2.jsp" %>
<style>
	.wrap {
		position: relative;
	}
	
	.w395 {
		width: 250px;
	}
	
	#zip{
		width:140px;
	}
	
	#id{
		width:140px;
	}
	
	.addBox {
		width: 700px;
		margin-left: 300px;
	}
	
	.addBox p {
		padding-top: 10px;
		padding-bottom: 10px;
		font-size: 18px;
	}
	
	.addBox label {
		width: 200px;
		display: inline-block;
	}
	#base, #detail{
		margin-left: 204px;
	}
	.addBox input[type="text"],
	.addBox input[type="date"],
	.addBox input[type="password"],
	.addBox select {
		font-size: 18px;
		padding: 5px;
	}
	.addBox input[type="file"] {
		font-size: 16px;
	}
	
	.addBox input[type="submit"]{
		font-size: 20px;
		margin: 50px 200px;
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
	
	.addBox .fas {
		color: #D9D9D9;
	}
	
	.error {
		font-size: 14px;
		color: red;
		display: none;
	}

	.getImg {
		position: absolute;
    	top: 90px;
   		border: 1px solid #ddd;
    	padding: 5px;
	}
	
	.getImg img {
		width: 215px;
	    border: 1px solid #ddd;
	    display: block;
	    height: 250px;
	}
	
</style>
<!-- 주소검색용 스크립트 -->
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
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
	
	$(function(){
		//정규표현식
		$("form").submit(function(){
			$(".error").hide();
			$(".fas").css("color", "#D9D9D9");
			
			function errors(item) {
				$(item).nextAll(".error").show();
				$(item).nextAll(".fas").css("color", "#E8396F");
			}
			
			var idReg = /^[a-z0-9@\_\-\.]{5,20}$/;
			var id = $("input[name='id']");			
			if(id.val() == "" || idReg.test(id.val())==false) {
				errors(id);
				return false;
			}
			
			var nameReg = /^[가-힣a-zA-Z]{1,20}$/;
			var name = $("input[name='name']");			
			if(name.val() == "" || nameReg.test(name.val())==false) {
				errors(name);
				return false;
			}
			
			var passReg = /^[a-zA-Z0-9!@#$%^&]{8,16}$/;
			var pass = $("input[name='pass']");			
			if(pass.val() == "" || passReg.test(pass.val())==false) {
				errors(pass);
				return false;
			}
			
			var pass = $("input[name='pass']");		
			var passCheck = $("input[name='passCheck']");
			if (pass.val() != passCheck.val() || passCheck=="") {
				errors(passCheck);
				return false;
			}
			
			var birthday =  $("input[name='birthday']");
			if(birthday.val()==""){
				errors(birthday);
				return false;
			}
		
				var phoneReg = /^(010|011|017|018|019)-?[0-9]{3,4}-?[0-9]{4}$/;
				var phone = $("input[name='phone']");
				if (phoneReg.test(phone.val()) == false || phone.val() == "") {
					errors(phone);
					return false;
				}
				
				alert("[" +  $("#name").val() + "]님의 회원가입이 완료되었습니다.");
		})
		
		$("#IdCheck").click(function() {
			var id = $("input[name='id']").val();
			$.ajax({
				url : "${pageContext.request.contextPath}/login/idCheck.do",
				type : "get",
				data : {"id" : id},
				success : function(res) {
					console.log(res);
					
					
					if (res != null) {
						alert("중복되는 아이디입니다");
						$("input[name='id']").val("");
					}else if(res == null){
						alert("사용가능한 아이디입니다.");
					}
				}
			})
		})
	})
	
</script>
<article class="contentWrap">
	<div class="wrap">
		<h2 class="pageTitle">회원등록</h2>
		
		<div class="addBox">
			<form action="userAdd.do" method="post" enctype="multipart/form-data" autocomplete="off">
				<p>
					<label>아이디 </label>
					<input type="text" name="id" id="id" placeholder="회원아이디"/>
					<button class="btnOrange plsSearch" type="button" id="IdCheck">중복확인</button>
					<i class="fas fa-feather-alt"></i>
					<span class="error">5~20자의 영문 소문자와 숫자,특수기호(@_-.)만 사용 가능합니다.</span>
				</p>
				<p>
					<label>이 름</label>
					<input class="w395" type="text" name="name" id="name" placeholder="이름"/>
					<i class="fas fa-feather-alt"></i>
					<span class="error">한글과 영문 대 소문자를 사용하세요. (특수기호, 공백 사용 불가)</span>
				</p>
				<p>
					<label>비밀번호</label>
					<input class="w395" type="password" name="pass" placeholder="비밀번호"/>
					<i class="fas fa-feather-alt"></i>
					<span class="error">8~16자 영문 대 소문자, 숫자, 특수문자를 사용하세요.</span>
				</p>
				<p>
					<label>비밀번호 확인</label>
					<input class="w395" type="password" name="passCheck" placeholder="비밀번호 확인"/>
					<i class="fas fa-feather-alt"></i>
					<span class="error">비밀번호가 일치하지않습니다.</span>
				</p>
				<p>
					<label>생년월일</label> 
					<input type="date" class="w395" name="birthday" id="dateField" min="1900-01-01">
					<i class="fas fa-feather-alt"></i>
					<span class="error">생년월일을 선택해주세요.</span>
				</p>
				<p>
					<label>휴대전화</label>
					<input class="w395" type="text" name="phone" placeholder="휴대전화"/>
					<i class="fas fa-feather-alt"></i>
					<span class="error">(-)을 포함한 번호를 입력하세요.</span>
				</p>
				<p>
					<label>주소</label> 
					<input type="text" name="zipCode" id="zip" placeholder="우편번호">
					<button class="btnOrange plsSearch" type="button" id="btn">검색</button>
					<i class="fas fa-feather-alt"></i>
					<span class="error">주소를 검색해주세요.</span>
				</p>
				<p>
					<input class="w395" type="text" name="baseAddress" id="base" placeholder="기본주소"> 
				</p>
				<p>
					<input class="w395" type="text" name="detailAddress" id="detail" placeholder="상세주소">
				</p>
				
				<p>
					<label>회원 이미지</label>
					<input type="file" name="bookImgPath" onchange="imageURL(this);" />
				</p>
				<div class="submitBtn">
					<input type="submit" value="회원 등록" class="btnPurple"/>
				</div>
			</form>
		</div>
		<div class="getImg">
			<img class="loadImg" src="${pageContext.request.contextPath }/images/no-image.png" />
		</div>
	</div>

</article>

<%@ include file="../../adminInclude/adminFooter.jsp" %>