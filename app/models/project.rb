class Project < ActiveRecord::Base
  belongs_to :user
  belongs_to :artist_type

  validates :name, presence: true
  validates :description, presence: true
  validates :user, presence: true
end
