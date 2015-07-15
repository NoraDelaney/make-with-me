class UserFile < ActiveRecord::Base
  belongs_to :user

  validates :user, presence: true
  validates :user_file, presence: true
end
