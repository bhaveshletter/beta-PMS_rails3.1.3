class AddMilestoneIdToTasks < ActiveRecord::Migration
  def change
    add_column :tasks, :milestone_id, :integer, :default => nil
  end
end
