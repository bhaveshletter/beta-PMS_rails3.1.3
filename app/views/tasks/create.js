$("div#flash_id").html("<%= escape_javascript(render :partial => '/shared/noticemsg') %>");
$("#new_task")[0].reset();
$("#task_hours").val('');
$("#task_minutes").val('');
$("input#submit_id").attr("disabled", false);
$("#wait_id").css("display", "none");
$("div#task_list_id").html("<%= escape_javascript(render :partial => 'task_list', :object => @task_list) %>");

