class AddDescriptionToTimecard < ActiveRecord::Migration
  def change
    add_column :timecards, :description, :string
  end
end
