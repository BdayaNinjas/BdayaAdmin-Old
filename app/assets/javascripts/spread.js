$(document).ready(function(){
	
/************* RENDERING *************/

	$("spreadsheet").each(function(){
		try { var options = jQuery.parseJSON($(this).attr("options")); }
		catch(err) {throw "| Error in the (spreadsheet.options) format. "+err; }

		if (options) {
		
		//--------- INITIALIZING ----------//
			var container = $("<div/>").addClass("spreadsheet").attr("id", $(this).attr("id"));
			var spreadhead = $("<div/>").addClass("spread-head");
			var spreadfooter = $("<div/>").addClass("spread-footer");

		//---------- Rendering ------------//

			//Title
			spreadhead.append($("<h1/>").text(options.title));

			//Tabs
			var tab = $("<div/>").addClass("tab");
			$.each(options.tabs, function(i, data){
				spreadhead.append(tab.clone()
									.html(data.name)
									.attr({"id":data.id, "content":data.content})
									.addClass((data.content == options.content[0]) ? "active" : "")
								);
			});

			//Panel
			$.each(options.content, function(i, el){
				var table = $(el);
				var numCol = table.find("thead th").length;
				table.find("tbody tr").each(function(){
					var panel = $(".panel", this).remove();
					$(this).after(panel.wrap("<div/>").attr("colspan", numCol).hide());
					$(this).addClass("clickable");
				});
			});

			//Spreadfooter
			var footerContent = $("<div/>").addClass("main-content");
				//Edit
				if (options.edit != false) {
					footerContent.append($("<div/>").addClass("tab edit-button").html("Edit"));

					var editContent = $("<div/>").addClass("edit-content");

					//New Row Button
					editContent.append($("<div/>").addClass("btn new-row").html($(".add-form").html()));
					$(".add-form").hide();

					spreadfooter.append(editContent.hide());
				}
			spreadfooter.append(footerContent);

		//----------- APPENDING ---------//

			//Spreadhead
			container.prepend(spreadhead);

			//Content
			if (typeof options.content == "object")
				$.each(options.content, function(i, el){
					container.append(
						//show the first content, hise the rest.
						(i!=0)?  $(el).hide() : $(el)
					);
				});
			else
				container.append($(options.content));

			//Spreadfooter
			container.append(spreadfooter);


			//Spreadsheet
			$(this).after(container).remove();

		}
		else
			throw "Spreadsheet.options in not defined.";

	});

/************** ACTIONS **************/

	//Spreadhead Tabs
	$(".spread-head > .tab").click(function(){
		$($(this).siblings(".active").eq(0).removeClass("active").attr("content")).hide();
		$($(this).addClass("active").attr("content")).show();
	});

	//Panel
	//Click row for panel
	$(".spreadsheet > table > tbody > tr.clickable").click(function(){
		$(this).next(".panel").slideToggle();
	});

	//Edit
	$(".spreadsheet > .spread-footer > .main-content > .edit-button").click(function() {
		$(this).closest(".main-content").hide().siblings(".edit-content").eq(0).show();
	});

/************** PLUGINS **************/
	
	(function( $ ){

		$.fn.trToForm = function() {  
			return this.each(function() {
				$(this).html("");
				var formid = $(this).attr("formid");
				if(!formid)
					throw "This tr cann't be converted to inoput, there is no formid.";
				$tr = $(this);
				$("#"+formid).find("input, textarea, select").not("[type=submit], [type=hidden], button").each(function() {
					$tr.append("<td>" + $(this).get(0).outerHTML + "</td>");
				});
			});
		};

		$.fn.formToTr = function() {  
			return this.each(function() {
				var formid = $(this).attr("id");
				if(!formid)
					throw "This form cann't be converted to tr, there is no id.";
				$tr = $("td[formid="+formid+"]");
				$(this).find("input, textarea, select").not("[type=submit], [type=hidden], button").each(function() {
					$tr.append("<td>" + $(this).get(0).outerHTML + "</td>");
				});
			});
		};

	})( jQuery );

});

var id=0;
function appendEdit(form) {
	form = $(form);
	form.attr("id", "formid" + id);

	var row = $("<tr/>");
	var data = "";
	form.find("form").find("input, textarea, select").not("[type=submit], button").each(function() {
		if ($(this).attr("type") != "hidden")
			data += ("<td>" + $(this).get(0).outerHTML + "</td>");
		else
			data += $(this).get(0).outerHTML;
	});
	row.html(data).appendTo("table > tbody").attr("formid", "formid"+id);

	$(".add-form").after(form.hide());
	id++;
}

$(".spreadsheet input, .spreadsheet select, .spreadsheet textarea").live("change", function(event) {
	var formId = $(this).closest("tr").addClass("changedrow").attr("formid");
	$("#"+formId).find("#"+ $(this).attr("id")).val($(this).val());
	$("#"+formId).find("form").addClass("changedform");
});





















