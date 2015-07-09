class RecreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :name, null: false
      t.string :description, null: false
      t.boolean :collaborators_wanted, default: true
    end
  end
end
