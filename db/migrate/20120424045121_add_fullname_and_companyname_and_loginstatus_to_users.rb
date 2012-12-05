class AddFullnameAndCompanynameAndLoginstatusToUsers < ActiveRecord::Migration
  def change
    add_column :users, :full_name, :string, :null => false, :default => ""
    add_column :users, :company_name, :string, :null => false, :default => ""
    add_column :users, :login_status, :boolean, :default => false
  end
end
