/**
 *  side menu
 */
$(function() {
	/*$(".sideItem").click(function() {
		$(".sideItem").removeClass("sideView");
		$(".iconView").remove();
		$(this).addClass("sideView");
		$(this).append("<i class='fas fa-angle-right iconView'></i>");
	})*/
	
	var contentH = $(".content").height();
	$(".sideMenu").height(contentH);
})