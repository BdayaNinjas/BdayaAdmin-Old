$(document).ready(function(){

	/* -------------------------------------------------------------------- 
		Actions to be implemented by the backenders using Ajax
	--------------------------------------------------------------------  */ 
	// saving changes (post forms)
 $(".save").click(function() {
 	// do ajax post here
 	// on success: editOff(this);
 	 
 	 $(this).closest(".spreadsheet").find("table > tbody").find(".edited-row").each(function() {	  
 	 var $form = $(this).find("form");
 	 alert($form.attr('action'));
 	 $.ajax({	
 	 type : "POST",
 	 cache : false,
 	 url : $form.attr('action'),
 	 data : $form.serializeArray(),
 	 complete : function(data) {
 	 alert(form.parent().attr("class") == "add-row edited-row");
 	 // if (form.parent().attr("class") == "add-row edited-row")
 	 }
 	 });
 	 // window.location.reload();
 	});
 });
 
$(".delete-row").click(function() {	  
 	// do ajax request here

 	var $form =$(this).closest("tr").find("form");
 	$.ajax({
 	 type : "DELETE",
 	 cache : false,
 	 url : $form.attr('action'),
 	 data : $form.serializeArray()
 	});
 	// window.location.reload();
 });	

$(".delete-row2").click(function() {	  
 	// do ajax request here

 	var $form =$(this).closest("td").find("form");
	alert($form.attr('action'));
 	$.ajax({
 	 type : "DELETE",
 	 cache : false,
 	 url : $form.attr('action'),
 	 data : $form.serializeArray()
 	});
 	// window.location.reload();
 });


	/* -------------------------------------------------------------------- 
		Essential functionalities for the spreadsheet
		***Don't Change***
	--------------------------------------------------------------------  */ 

	// edit tab
	$(".edit-spreadsheet").click(function() {
		editOn(this);
	});
	// cancel editing
	$(".cancel").click(function() {
		editOff(this);
	});

	function editOn(x) {
		var spreadsheet = $(x).closest(".spreadsheet");

		spreadsheet.find("td.edit").toggle();
		spreadsheet.find(".spread-head").width("-=17");
		spreadsheet.find(".spread-footer").width("-=17");
		spreadsheet.find(".spread-footer").children().toggle();

	}
	function editOff(x) {
		var spreadsheet = $(x).closest(".spreadsheet");

		spreadsheet.find("td.edit").toggle();
		spreadsheet.find(".spread-head").width("+=17");
		spreadsheet.find(".spread-footer").width("+=17");
		spreadsheet.find(".spread-footer").children().toggle();
	}

	// edit row
	$(".update-row").click(function() {
		var row = $(this).closest("tr");
		row.addClass("edited-row");

		row.children("td").not(".edit").each(function() {
			$(this).children().toggle();
		});
	});
	// new row
	 $(".add").click(function() {
 	$(this).closest(".spreadsheet").find(".add-row").addClass("edited-row").toggle();
 });
 
 
 	/* spreadsheet head tabs */
	// hide the inactive spreadsheets
	$(".spread-head").children(".tab").not(".active").each(function() {
		$("#"+$(this).attr("data-id")).hide();
	});
	//tab click action
	$(".spread-head > .tab").click(function() {
		$("#"+$(this).siblings(".active").eq(0).attr("data-id")).hide();
		$(this).siblings(".active").eq(0).removeClass("active");

		$(this).addClass("active");
		$("#"+$(this).attr("data-id")).show();
	});

	//add member to event
	 $(".spreadsheet .add-member").click(function() {
	 	$(this).children(".members-list").show();
	 });
	 $(document).keyup(function(e) {

	  if (e.keyCode == 27) {
	 	$(".spreadsheet .add-member .members-list").hide();
	 } // esc
	 });
 
	//agenda tabs
	$(".agenda-content > ul > li").click(function() {
		$(this).siblings(".active").eq(0).removeClass("active");
		$(this).addClass("active");
	});
 
});
