class CreateProjectArts < ActiveRecord::Migration
  def change
    create_table :project_arts do |t|
      t.integer :art_type_id, null: false
      t.integer :project_id, null: false
    end
  end
end
