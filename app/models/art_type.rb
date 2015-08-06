class ArtType < ActiveRecord::Base
  has_many :user_arts
  has_many :users, through: :user_arts
  accepts_nested_attributes_for :user_arts

  VALID_TYPES = [
    "visual art",
    "writing",
    "music",
    "dance",
    "theater",
    "filmmaking"
  ]

  validates :name, presence: true, inclusion: { in: VALID_TYPES }

end
