class AddParticipatingToProjectParticipants < ActiveRecord::Migration
  def change
    add_column :project_participants, :participating, :boolean, :null => false, :default => true
  end
end
