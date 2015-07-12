class Rename < ActiveRecord::Migration
  def change
    rename_table :artist_types, :art_types
  end
end
