$(document).ready(function(){
	
	/* -------------------------------------------------------------------- 
		Actions to be implemented by the backenders using Ajax
	--------------------------------------------------------------------  */ 
	// saving changes (post forms)
<<<<<<< HEAD
	$(".save").click(function() {		
		// do ajax post here
		// on success: editOff(this);
		
		$(this).closest(".spreadsheet").find("table > tbody").find("form").each(function() {			
			var $form = $(this);

			 $.ajax({
		     type     : "POST",
		     cache    : false,
		     url      : $form.attr('action'),
		     data     : $form.serializeArray(),
		     success  : function(data) {
		         alert("asd");
		     }
		    });
		});
		
	});
	
	// delete a row
	$(".delete-row").click(function() {		
		// do ajax request here
	});
	
	//update a row
	$(".update-row").click(function() {		
		// toggle the input fields
	});
	
	
	
=======
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
 	 window.location.reload();
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
 	window.location.reload();
 });	
>>>>>>> 13dca9997ec03fb51ed494fd4425f98d0f047587
	
	
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
<<<<<<< HEAD
		row.children("td").not(".edit").each(function() {
			$(this).children("").toggle();
		});
	});
	// new row
	$(".add").click(function() {
		$(this).closest(".spreadsheet").find("table > tbody").append($(".add-row").clone().toggle().attr("class", "asda"));
	})
=======
		row.addClass("edited-row");

		row.children("td").not(".edit").each(function() {
			$(this).children().toggle();
		});
	});
	// new row
	 $(".add").click(function() {
 	$(this).closest(".spreadsheet").find(".add-row").addClass("edited-row").toggle();
 });
<<<<<<< HEAD
>>>>>>> 13dca9997ec03fb51ed494fd4425f98d0f047587
=======
 
 // spreadsheet header tabs
	$(".link-data").hide();
        var ld = $(".active").attr("data-id");
        $("#"+ld).show();

        $(".tab").click(function () {
        	$(".link-data").hide();
                $(".tab").removeClass("active");
                $(this).addClass("active");
                $("#"+$(this).attr("data-id")).show();
        });
>>>>>>> b21b6d604cbce412771d43398e4ef06fa3ab4859
	
	
});
