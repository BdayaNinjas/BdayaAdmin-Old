$_ = jQuery;
$_ ->
  # enable chosen js
  $('#event_event_manager_id').chosen
    allow_single_deselect: true
    no_results_text: 'No results matched'

  $('.best_in_place').best_in_place()