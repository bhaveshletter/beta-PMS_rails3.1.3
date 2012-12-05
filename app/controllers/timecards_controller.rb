class TimecardsController < ApplicationController
  def index
    @timecards = Timecard.all
  end

  def new
    @timecard = Timecard.new
    @project_participants = current_user.project_participants.collect{|t| t.project_id}
    @assigned_projects = Project.where("id IN (?)", @project_participants)
    @assign_tasks = Task.where("project_id IN (?)", @project_participants)
  end

  def create
    @timecard =  Timecard.new(params[:timecard])
    @timecard.user_id = current_user.id
    if !params[:timecard][:task_id].nil?
      @timecard.task_id = params[:timecard][:task_id]
    end
    tm = params[:timecard][:time_duration]
    tms = tm.split(':')[0]
    mins = tms.to_i * 60
    minutes = mins + tm.split(':')[1].to_i
    @timecard.time_duration = minutes

    respond_to do |format|
      if @timecard.save
        format.html { redirect_to(@timecard, :notice => 'Timecard was successful created') }
      else
        format.html { render :action => "new"}
      end
    end
  end

  def show
    @timecard = Timecard.find(params[:id])
  end


  def task_list
    @tasks = Task.find(:all, :select => 'id, name', :conditions => ["project_id = ?", params[:project_id]], :order => :name)
  end

end
