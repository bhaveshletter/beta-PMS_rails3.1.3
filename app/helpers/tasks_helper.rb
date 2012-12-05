module TasksHelper

  # To get list of users whom project is assigned.
  def assign_user(p_id)
    @assign_user = User.where("id IN (?)", (ProjectParticipant.joins( :project ).having("project_id = ? and participating = ?", p_id.to_s, true)).collect{|x| x.member_id})
  end

  # To get list of milestone of specific project.
  def milestone_list(p_id)
    @milestone_list = Milestone.where(:project_id => p_id)
  end
  
end
