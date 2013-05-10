$_ = jQuery;
$_ ->
  # enable chosen js
  $('#event_event_manager_id').chosen
    allow_single_deselect: true
    no_results_text: 'No results matched'

  $("#name").click ->
    $("#name").hide()
    $("#name_edit").show()

  $("#manager").click ->
    $("#manager").hide()
    $("#manager_edit").show()

  $("#description").click ->
    $("#description").hide()
    $("#description_edit").show()

  $("#general_info").click ->
    $("#general_info").hide()
    $("#general_info_edit").show()

  $("#date").click ->
    $("#date").hide()
    $("#date_edit").show()

  $("#name_cancel_btn") ->
  	$("#name_edit").hide()
  	$("#name").show()

  $("#manager_cancel_btn") ->
  	$("#manager_edit").hide()
  	$("#manager").show()

  $("#description_cancel_btn") ->
  	$("#description_edit").hide()
  	$("#description").show()

  $("#general_info_cancel_btn") ->
  	$("#general_info_edit").hide()
  	$("#general_info").show()

  $("#date_cancel_btn") ->
  	$("#date_edit").hide()
  	$("#date").show()