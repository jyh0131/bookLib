/**
 * sidu menu
 */

$(function() {
//	var height = $(".content").height();
//	$(".asideMenu").height(height);

	$(".asideMenuItem").click(function() {
		$(".asideMenuItem").removeClass("asidView");
		$(this).addClass("asidView");
	})
})