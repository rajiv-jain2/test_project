class AddCoulumnsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :slug, :string
    add_column :users, :user_type, :integer
  end
end