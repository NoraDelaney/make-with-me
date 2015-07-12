class UserArt < ActiveRecord::Base
  belongs_to :user
  belongs_to :art_type
  validates :user, presence: true
  validates :art_type, presence: true
end
