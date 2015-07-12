class RemoveColumnUsers < ActiveRecord::Migration
  def change
    remove_column :users, :artist_type_id, :integer, null: false
  end
end
