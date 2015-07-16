class RenameUserFile < ActiveRecord::Migration
  def change
    rename_column :user_files, :user_file, :file
  end
end
