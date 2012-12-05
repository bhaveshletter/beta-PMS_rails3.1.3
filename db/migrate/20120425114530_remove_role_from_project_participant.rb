class RemoveRoleFromProjectParticipant < ActiveRecord::Migration
  def up
    remove_column :project_participants, :user_id
  end

  def down
    add_column :project_participants, :user_id, :integer
  end
end
