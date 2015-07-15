class CreateUserFiles < ActiveRecord::Migration
  def change
    create_table :user_files do |t|
      t.string :user_file, null: false
      t.integer :user_id, null: false
    end
  end
end
