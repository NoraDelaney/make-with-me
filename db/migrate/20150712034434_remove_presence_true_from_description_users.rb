class RemovePresenceTrueFromDescriptionUsers < ActiveRecord::Migration
  def up
    change_column :users, :description, :string
  end

  def down
    change_column :users, :description, :string, null: false
  end
end
