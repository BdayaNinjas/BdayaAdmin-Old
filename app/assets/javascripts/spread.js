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

});