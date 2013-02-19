class AddUserInfoColsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :firstname, :string
    add_column :users, :lastname, :string
    add_column :users, :phone, :string
    add_column :users, :company, :string, :default => 'Comity Designs Inc.'
  end
end
