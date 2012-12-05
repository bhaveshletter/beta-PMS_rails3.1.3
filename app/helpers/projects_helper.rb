module ProjectsHelper

=begin
  def user_project_members
    ob = current_user.projects.map{|i| i.project_participants.map {|j| j.member_id } }
     return User.where(:id => ob.collect{|i| i }).uniq
  end
=end

  # To display organization's members only during creation of project
  def organization_members
    current_user.organization.users.order("department_id")
  end
  
end
