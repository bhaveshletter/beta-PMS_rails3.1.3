class ProjectsController < ApplicationController
  before_filter :authenticate_user!
 
  def index
    @projects = current_user.projects
    @project_participants = current_user.project_participants.collect{|t| t.project_id}
    @assigned_projects = Project.where("id IN (?)", @project_participants)
    @users = User.where("email like ? and email != ?", "%#{params[:q]}%", current_user.email)

    respond_to do |format|
      format.html #index.html.erb
      format.json { render :json => @users.map(&:attributes) }
    end

  end

  def new
    @project = current_user.projects.new
    
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @project }
    end
  end

  def show
    @project = Project.find(params[:id])
    @task_list = current_user.tasks.where(:project_id => params[:id])
    @assigned_task = current_user.responsible_tasks.where(:project_id => params[:id])
    
    if !@project.nil?
      @task = @project.tasks.new
    end
          
    respond_to do |format|
      format.html #show.html.erb
      format.json { render json: @project}
    end
  end

  def create

    @project = current_user.projects.new(params[:project])

    respond_to do |format|
      if @project.save
        if !params[:project][:member_ids].nil?
          params[:project][:member_ids].each do |member_id|
            ProjectParticipant.create(:project_id => @project.id, :member_id => member_id)
          end
        end
        format.html {redirect_to @project, notice: 'Project was successfully created.'}
        format.json { render json: @project, status: :created, location: @project }
      else
        format.html { render action: "new"}
        format.json { render json: @project.errors, status: :unprocessable_entity}
      end
    end
    
  end

  def edit
    @project = Project.find(params[:id])
  end

  def update

    @project = Project.find(params[:id])        
    respond_to do |format|
      if @project.update_attributes(params[:project])
        update_project_members
        format.html { redirect_to @project, notice: 'Project was successfully updated.'}
        format.json { head :ok}
      else
        format.html { render action: "edit"}
        format.json { render json: @project.errors, status: :unprocessable_entity}
      end
    end
  end

  def project_report
    @project = Project.find(params[:id])
    @timecards = @project.timecards
  end


  



  private

  # To update project participants after project update successfully
  def update_project_members

    @participants = @project.project_participants.collect{|x| x.member_id.to_s}
    if params[:project][:member_ids].nil?
      unless @participants.empty?
        ProjectParticipant.where("member_id IN (?) and project_id = ?", @participants, @project.id).update_all(:participating => false)
      end
    else
      @new_participants = params[:project][:member_ids] - @participants
      @common_participants = params[:project][:member_ids] & @participants
      unless @new_participants.empty?
        @new_participants.each do |new_member|
          ProjectParticipant.create(:project_id => @project.id, :member_id => new_member)
        end
      end
      unless @common_participants.empty?
        unless @participants.empty?
          ProjectParticipant.where("member_id IN (?) and project_id = ?", @participants, @project.id).update_all(:participating => false)
        end
        ProjectParticipant.where("member_id IN (?) and project_id = ?", @common_participants, @project.id).update_all(:participating => true)
      end
    end

  end

end
