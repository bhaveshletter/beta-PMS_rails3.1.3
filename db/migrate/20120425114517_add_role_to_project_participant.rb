class AddRoleToProjectParticipant < ActiveRecord::Migration
  def change
    add_column :project_participants, :member_id, :integer
  end
end
