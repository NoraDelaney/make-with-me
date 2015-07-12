class Project < ActiveRecord::Base
  has_many :project_arts
  has_many :art_types, through: :project_arts
  has_many :project_memberships
  has_many :users, through: :project_memberships

  validates :name, presence: true
  validates :description, presence: true
end
