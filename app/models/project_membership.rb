class ProjectMembership < ActiveRecord::Base
  belongs_to :projects
  belongs_to :users

  validates :project, presence: true
  validates :user, presence: true
end
