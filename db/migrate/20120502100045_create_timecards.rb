class CreateTimecards < ActiveRecord::Migration
  def change
    create_table :timecards do |t|
      t.integer :project_id
      t.integer :user_id
      t.integer :time_duration
      t.string :role
      t.datetime :created_at
      t.datetime :updated_at

      t.timestamps
    end
  end
end
