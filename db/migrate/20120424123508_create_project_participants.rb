class CreateProjectParticipants < ActiveRecord::Migration
  def change
    create_table :project_participants do |t|
      t.integer :project_id
      t.integer :user_id
      t.string :user_email

      t.timestamps
    end
  end
end
