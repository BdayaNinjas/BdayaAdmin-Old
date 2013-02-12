$(document).ready(function(){
  $("li").not(".tab").click(function() {
			$(this).siblings(".active").eq(0).removeClass("active");
			
			$(this).next("li").addClass("active");
		});
});
