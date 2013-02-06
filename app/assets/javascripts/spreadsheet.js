$(document).ready(function(){
	
	/* -------------------------------------------------------------------- 
		Actions to be implemented by the backenders using Ajax
	--------------------------------------------------------------------  */ 
	// saving changes (post forms)
	$(".save").click(function() {		
		// do ajax post here
		// on success: editOff(this);
	});
	
	// delete a row
	$(".delete-row").click(function() {		
		// do ajax request here
	});
	
	//update a row
	$(".update-row").click(function() {		
		// toggle the input fields
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
		spreadsheet.find(".spread-footer").find(".edit-spreadsheet").toggle();
		spreadsheet.find(".save").toggle();
		spreadsheet.find(".cancel").toggle();
	}
	function editOff(x) {
		var spreadsheet = $(x).closest(".spreadsheet");
		
		spreadsheet.find("td.edit").toggle();
		spreadsheet.find(".spread-head").width("+=17");
		spreadsheet.find(".spread-footer").width("+=17");
		spreadsheet.find(".spread-footer").find(".edit-spreadsheet").toggle();
		spreadsheet.find(".save").toggle();
		spreadsheet.find(".cancel").toggle();
	}
});