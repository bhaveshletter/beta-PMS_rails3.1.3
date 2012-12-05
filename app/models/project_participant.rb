class ProjectParticipant < ActiveRecord::Base
  attr_accessible :project_id, :member_id

  belongs_to :user, :class_name => "User", :foreign_key => "member_id"
  belongs_to :project

end