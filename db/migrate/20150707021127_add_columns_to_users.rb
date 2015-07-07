class AddColumnsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :first_name, :string, null: false
    add_column :users, :last_name, :string, null: false
    add_column :users, :city, :string, null: false
    add_column :users, :state, :string, null: false
    add_column :users, :description, :string, null: false
    add_column :users, :website, :string
    add_column :users, :artist_type_id, :integer, null: false
  end
end
