<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<style>
	.content{
		overflow: hidden;
	}
	
	.sideMenu {
		position: fixed;
		top: 84px;
		left: 0;
		float: left;
		width: 248px;
		border-right: 1px solid #D9D9D9;
		height: 810px;
		background-color: #fff;
	}
	
	.sideUl li a {
		display: block;
		padding: 10px 35px;
		position: relative;
		border-bottom: 2px solid #D9D9D9;
		font-weight: 700;
	}
	
	.sideTitle {
		background-color: #2A3954;
		color: #fff;
		font-size: 20px;
		font-weight: 700;
		padding: 15px 30px;
		text-align: center;
	}
	
	.sideUl li a.sideView {
		background-color: #3493DD;
		color: #fff;
		font-weight: 700;
		border-bottom: 2px solid #FF9900;
	}
	
	.iconView {
		position: absolute;
		display: inline;
		color: #fff;
		font-size: 18px;
		right: 40px;
	}
	
	.contentWrap {
		float: left;
		width: 87%;
	}
</style>

<script>
	$(function(){
		$(".sideItem").click(function() {
			$(".sideItem").removeClass("sideView");
			$(".iconView").remove();
			$(this).addClass("sideView");
			$(this).append("<i class='fas fa-angle-right iconView'></i>");
		})
	})
</script>

	
		<aside class="sideMenu">
			<ul class="sideUl">
				<li class="sideTitle">대여 / 반납관리</li>
				<li><a class="sideItem sideView" href="#">대여관리<i class="fas fa-angle-right iconView"></i></a></li>
				<li><a class="sideItem" href="#">반납관리</a></li>
				<li><a class="sideItem" href="#">연체조회</a></li>
			</ul>
		</aside>