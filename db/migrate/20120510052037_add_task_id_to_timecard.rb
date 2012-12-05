class AddTaskIdToTimecard < ActiveRecord::Migration
  def change
    add_column :timecards, :task_id, :integer, :default => nil
  end
end
