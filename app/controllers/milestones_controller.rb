class MilestonesController < ApplicationController
  before_filter :authenticate_user!
  
  def index
  end

  def new
  end

  def create
    
    @milestone = Milestone.new(params[:milestone])
    if @milestone.save
      flash[:notice] = 'Milestone is added successfully!'
      @project = Project.find(@milestone.project_id)
      @task = @project.tasks.new()
    else
      flash[:error] = 'Sorry! Milestone is not added!'
    end
    
    respond_to do |format|
      format.js
    end
    
  end

end
