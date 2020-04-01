<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
	.mainCtn {
		padding-bottom: 5px;
	}
	
	.asideMenu {
		float: left;
		background: #fff;
		width: 21%;
	}
	
	.contentWrap {
		float: right;
		min-height: 650px;
		background: #fff;
		width: 78%;
	}
	
	/* asideMenu */
	aside.asideMenu ul li a{
		display: block;
		padding: 15px;
		font-size: 16px;
		font-weight: 700;
		background-color: #F8F8F8;
		border-bottom: 1px solid #CCC;
	}
		
	aside.asideMenu ul li a.asidView {
		border-bottom: 1px solid #0060B7;
		background-color: #fff;
	}
	
	aside.asideMenu ul li.asideTitle {
		padding: 15px;
		font-size: 20px;
		font-weight: 700;
		background: #7388A7;
		color: #fff;
		text-align: center;
	}
</style>

<script>
	$(function(){
		var height = $(".contentWrap").height();
		$(".asideMenu").height(height);
		
		$(".asideMenuItem").click(function() {
			$(".asideMenuItem").removeClass("asidView");
			$(this).addClass("asidView");
		})
	})
</script>


<aside class="asideMenu">
	<ul>
		<li class="asideTitle">자료검색</li>
		<li><a class="asideMenuItem asidView" href="#">통합자료검색</a></li>
		<li><a class="asideMenuItem" href="#">신착도서</a></li>
		<li><a class="asideMenuItem" href="#">대출베스트</a></li>
		<li><a class="asideMenuItem" href="#">이달의 추천도서</a></li>
	</ul>
</aside>