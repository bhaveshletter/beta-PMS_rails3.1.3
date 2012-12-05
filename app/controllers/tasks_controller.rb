class TasksController < ApplicationController
  before_filter :authenticate_user!
  after_filter :task_mail, :only => [ :create ]

  # To assign milestone to specific task.
  def milestone_assignment
    
    Task.where(:id => params[:task_ids].split(",")).update_all(:milestone_id => params[:milestone_id])
    flash[:notice] = 'Milestone has been assigned successfully!'
    @task_list = current_user.tasks.where(:project_id => params[:project_id])
    @assigned_task = current_user.responsible_tasks.where(:project_id => params[:project_id])

    respond_to do |format|
      format.js
    end
    
  end
  
  def index
    @tasks = current_user.tasks
  end

  def new
    #    @task = current_user.tasks.new
  end
  
  def create

    @task = current_user.tasks.new(params[:task])

    if @task.save
      flash[:notice] = "Task is created successfully!"
    else
      flash[:error] = "Sorry! Task is not created!"
    end
    @task_list = current_user.tasks.where(:project_id => @task.project_id)
    @assigned_task = current_user.responsible_tasks.where(:project_id => @task.project_id)
    
    respond_to do |format|
      format.js
    end
    
  end

  # To send mail to user whom task has been assigned after task creation.
  def task_mail
    unless @task.responsible_id.nil?
      UserMailer.task_assignment(@task).deliver
    end
  end


  def edit

  end

  def update
    
  end
  
end
