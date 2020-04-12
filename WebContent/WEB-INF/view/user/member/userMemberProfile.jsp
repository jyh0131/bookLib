<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ include file="../../userInclude/userHeader.jsp"%>
<%@ include file="../../userInclude/userSideMenu3.jsp"%>
<style>
.wrap {
	padding: 30px;
	position: relative;
}

.w395 {
	width: 250px;
}

#zip {
	width: 140px;
}

#id {
	width: 251px;
	background: lightgray;
}

.formWrap {
	width: 450px;
	margin-top: 42px;
	margin-left: 77px;
}

.formWrap p {
font-weight: 700;
    width: 170px;
    height: 51px;
    padding: 10px;
}
#idText{
	height:57px;
}

.formWrap input {
	padding: 5px;
	font-size: 16px;
}

.formWrap .error {
	font-size: 14px;
	color: red;
	font-weight: 400;
	padding-left: 5px;
	padding-bottom: 5px;
	display: block;
	width: 750px;
}

.formWrap p.noError {
	padding-bottom: 25px;
}

.formWrap .fas {
	color: #d9d9d9;
}

.formWrap p.btns {
	padding-top: 30px;
	padding-left: 20px;
}

.formWrap p.btns input {
	padding: 10px 20px;
}

.addBox input[type="file"] {
	font-size: 16px;
}

[type="date"] {
	background: #fff
		url(https://cdn1.iconfinder.com/data/icons/cc_mono_icon_set/blacks/16x16/calendar_2.png)
		97% 50% no-repeat;
}

[type="date"]::-webkit-inner-spin-button {
	-webkit-appearance: none;
	display: none;
}

[type="date"]::-webkit-calendar-picker-indicator {
	-webkit-appearance: none;
	opacity: 0;
}

.getImg {
	position: absolute;
	top: 140px;
	right: 106px;
}

.getImg img {
	width: 215px;
	border: 1px solid #ddd;
	display: block;
	height: 250px;
}

[type="file"] {
    position: absolute;
    top: 413px;
    right: -22px;
}
#btn{
    width: 67px;
    height: 32px;
    position: absolute;
    left: 297px;
}
.addressText{
	padding:-10px;
}
.imgDiv{
    padding: 24px 53px;
}
.adText{
	width: 249px;
    margin-top: 5px;
}
.submitBtn{
font-size: 20px;
    margin: 132px 116px;
    position: absolute;
    top: 502px;
    left: 403px;
}
[type="submit"]{
    width: 100px;
    height: 48px;
}
#cancel{
     width: 100px;
    height: 48px;
    margin-top: 10px;
    font-size: 18px;
}
.error {
	font-size: 14px;
	color: red;
}

</style>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
function imageURL(input) {
	//이미지경로
    if (input.files && input.files[0]) {
        var reader = new FileReader();

        reader.onload = function(e) {
            $('.loadImg').attr('src', e.target.result);
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
		$("form").submit(function() {
			
			$(".error").hide();
			
			function errors(item) {
				$(item).next(".error").show();
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
			if (pass.val() != passCheck.val() || passCheck.val()=="") {
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
				
				alert("[" +  $("#name").val() + "]님의 정보수정이 완료되었습니다.");
		})
		
		$("#cancel").click(function() {
			var cancel = confirm("회원정보 수정을 취소하시겠어요?");
			if(cancel){
				location.href="${pageContext.request.contextPath}/admin/user/userList.do";
				return false;
			}
			return false;
		})
		
		$(".loadImgBtn").change(function() {
			var changeImg = $(".loadImgBtn").val().split("\\");
			var imgName = changeImg[changeImg.length-1];
			var imgSrc = $(".loadImgBtn").val();
			
			console.log(imgSrc);
		})
		$(".error").hide();
	})
	
</script>
<div class="articleBg">
	<article class="contentWrap">
		<div class="wrap">
			<h3 class="pageTitle">회원정보 수정</h3>
			<div class="formWrap">
				<form action="profile.do" method="post" enctype="multipart/form-data">
					<p id="idText">
						<label>아이디 </label> <input class="w395" type="text" name="id"
							id="id" readonly value="${memberInfo.mberId }" />
					</p>
					<p>
						<label>이 름</label> <input class="w395" type="text" name="name"
							id="name" value="${memberInfo.mberName}" /> <span class="error">한글과 영문
							대 소문자를 사용하세요. (특수기호, 공백 사용 불가)</span>
					</p>
					<p>
						<label>비밀번호</label> <input class="w395" type="password"
							name="pass" value="${memberInfo.mberPass}" />
							 <span class="error">8~16자
							영문 대 소문자, 숫자, 특수문자를 사용하세요.</span>
					</p>
					<p>
						<label>비밀번호 확인</label> <input class="w395" type="password"
							name="passCheck" placeholder="비밀번호 확인" />  <span class="error">비밀번호가
							일치하지않습니다.</span>
					</p>
					<p>
						<label>생년월일</label> <input type="date" class="w395"
							name="birthday" id="dateField" min="1900-01-01"
							value="<fmt:formatDate value='${memberInfo.mberBrthdy}' pattern='yyyy-MM-dd'/>">
						 <span class="error">생년월일을
							선택해주세요.</span>
					</p>
					<p>
						<label>휴대전화</label> <input class="w395" type="text" name="phone"
							value="${memberInfo.mberTel }" />  <span
							class="error">(-)을 포함한 번호를 입력하세요.</span>
					</p>
					<p>
						<label>주소</label> <input type="text" name="zipCode" id="zip"
							value="${memberInfo.mberZip.zipCode }">
						<button class="btnOrange plsSearch" type="button" id="btn">검색</button>
						 <span class="error">주소를
							검색해주세요.</span>
					</p>
					<p class="addressText">
						<input class="adText" type="text" name="baseAddress" id="base"
							value="${memberInfo.mberBassAd} ">
						<input class="adText" type="text" name="detailAddress" id="detail"
						value="${memberInfo.mberDetailAd}">
					</p>

					<div class="imgDiv">
						<span class="memberImg"> 
						<c:if test="${memberInfo.memberImgPath !=null }"> [현재 이미지: ${memberInfo.memberImgPath }]</c:if>
						 <c:if test="${memberInfo.memberImgPath == null }">등록된 이미지가 없음</c:if>
						</span><br>
						<br> <input type="file" name="memberImgPath"
							class="loadImgBtn" onchange="imageURL(this);" />
					</div>
					<div class="submitBtn">
						<input type="submit" value="정보 수정" class="btnPurple" />
						<button class="btnPurple" id="cancel">취소</button>
					</div>
				</form>
			</div>
			<div class="getImg">
				<c:choose>
					<c:when test="${memberInfo.memberImgPath !=null }">
						<img class="loadImg"
							src="${pageContext.request.contextPath }/upload/${memberInfo.memberImgPath}" />
					</c:when>
					<c:when test="${memberInfo.memberImgPath ==null }">
						<img class="loadImg"
							src="${pageContext.request.contextPath }/images/no-image.png" />
					</c:when>
				</c:choose>
			</div>
		</div>
	</article>
</div>
<%@ include file="../../userInclude/userFooter.jsp"%>