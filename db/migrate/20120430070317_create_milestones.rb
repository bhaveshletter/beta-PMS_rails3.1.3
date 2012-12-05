class CreateMilestones < ActiveRecord::Migration
  def change
    create_table :milestones do |t|
      t.string :name
      t.datetime :end_date, :default => nil
      t.integer :project_id, :default => nil

      t.timestamps
    end
  end
end
