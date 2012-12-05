class CreateOrganizations < ActiveRecord::Migration
  def change
    create_table :organizations do |t|
      t.string :name
      t.string :industry
      t.string :street_1
      t.string :street_2
      t.string :city
      t.string :state
      t.string :country
      t.integer :zipcode
      t.string :office_number_1
      t.string :office_number_2
      t.string :fax_number
      t.string :website
      t.string :email
      t.string :facebook
      t.string :twitter
      t.string :linked

      t.timestamps
    end
  end
end
