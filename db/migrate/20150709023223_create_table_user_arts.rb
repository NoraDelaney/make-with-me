class CreateTableUserArts < ActiveRecord::Migration
  def change
    create_table :user_arts do |t|
      t.integer :user_id, null: false
      t.integer :art_type_id, null: false
    end
  end
end
