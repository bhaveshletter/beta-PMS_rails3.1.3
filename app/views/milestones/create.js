$("div#flash_id").html("<%= escape_javascript(render :partial => '/shared/noticemsg') %>");
$("#new_milestone")[0].reset();
$("#new_milestone_form")[0].reset();
$("#task_form_id").empty();
$("#task_form_id").html("<%= escape_javascript(render :partial => '/tasks/form', :object => @task) %>");
$("#assign_milestone_id").empty();
$("#assign_milestone_id").html("<%= escape_javascript(render :partial => '/milestones/assign_milestone', :locals => {:task => @task, :project => @project}) %>");
$("#overlay").hide();
$("#milestone_process").hide();


