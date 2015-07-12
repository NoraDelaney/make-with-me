class ArtType < ActiveRecord::Base
  has_many :user_arts
  has_many :users, through: :user_arts
  has_many :project_arts
  has_many :projects, through: :project_arts

  validates :name, presence: true
end
