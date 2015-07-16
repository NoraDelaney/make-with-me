class CreatePdfs < ActiveRecord::Migration
  def change
    create_table :pdfs do |t|
      t.string :name, null: false
      t.string :user_pdf, null: false
      t.integer :user_id, null: false
    end
  end
end
