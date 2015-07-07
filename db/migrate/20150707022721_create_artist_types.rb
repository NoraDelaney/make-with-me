class CreateArtistTypes < ActiveRecord::Migration
  def change
    create_table :artist_types do |t|
      t.string :name, null: false
    end
  end
end
