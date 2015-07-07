class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :name, null: false
      t.string :description, null: false
      t.integer :user_id, null: false
      t.integer :artist_type_id
    end
  end
end
