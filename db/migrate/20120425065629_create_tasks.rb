class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.integer :user_id
      t.integer :responsible_id
      t.integer :project_id
      t.string :name
      t.text :description
      t.datetime :start_date, :default => nil
      t.datetime :end_date, :default => nil
      t.integer :hours, :null => false, :default => 0
      t.integer :minutes, :null => false, :default => 0
      t.string :status, :default => nil
      t.timestamps
    end
  end
end
